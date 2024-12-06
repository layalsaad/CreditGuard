SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_customers_daily()
BEGIN
	delete from fraud_dwh.d_customer;
    
    insert into  fraud_dwh.d_customer(customer_name, gender, job_id, dob)
    select distinct b.CustomerName, b.gender, j.id, b.dob from fraudulent_activities.bank as b,  fraud_dwh.d_job as j where j.job_name = b.job and not exists (select 1 from fraud_dwh.d_customer where fraud_dwh.d_customer.customer_name = b.CustomerName);
    
    insert into  fraud_dwh.d_customer(customer_name, gender, job_id, dob)
    select distinct c.customer_name, c.gender, j.id, c.dob from fraudulent_activities.credit_card as c,  fraud_dwh.d_job as j where j.job_name = c.job and not exists (select 1 from fraud_dwh.d_customer where fraud_dwh.d_customer.customer_name = c.customer_name);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_customers_daily', now(),'d_customer', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT daily_customers_load
ON SCHEDULE EVERY 1 Day
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_customers_daily();


DELIMITER //
CREATE PROCEDURE load_timestamp_daily()
BEGIN
	delete from fraud_dwh.d_timestamp;
    
    insert into  fraud_dwh.d_timestamp(trans_timestamp,trans_year, month_number, trans_day, day_of_week_id, trans_hour, trans_minute, trans_second)
    select distinct b.trans_timestamp, b.trans_year, b.trans_month, b.trans_day, d.id, b.trans_hour, b.trans_minute, b.trans_second
    from fraudulent_activities.bank as b, fraud_dwh.d_day_of_week as d
	where b.Day_of_Week = d.day_name and not exists (select 1 from fraud_dwh.d_timestamp as ts where ts.trans_timestamp = b.trans_timestamp);
    
    insert into  fraud_dwh.d_timestamp(trans_timestamp,trans_year, month_number, trans_day, day_of_week_id, trans_hour, trans_minute, trans_second)
    select distinct cc.trans_date_trans_time, cc.trans_year, cc.trans_month, cc.trans_day, d.id, cc.trans_hour, cc.trans_minute, cc.trans_second
    from fraudulent_activities.credit_card as cc, fraud_dwh.d_day_of_week as d
	where cc.Day_of_Week = d.day_name and not exists (select 1 from fraud_dwh.d_timestamp as ts where ts.trans_timestamp = cc.trans_date_trans_time);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_timestamp_daily', now(),'d_timestamp', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT daily_timestamp_load
ON SCHEDULE EVERY 1 Day
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_timestamp_daily();

DELIMITER //
CREATE PROCEDURE load_transactions_daily()
BEGIN
	delete from fraud_dwh.f_transaction;
     
    insert into  fraud_dwh.f_transaction(transaction_id, timestamp_id, merchant_id, customer_id, cc_num, category_id, amount, fraud_id, fraud_indicator)
    select distinct cc.trans_num, t.id, m.id, c.id, cc.cc_num, cat.id, cc.amt, cc.fraud_type, cc.is_fraud
    from fraudulent_activities.credit_card as cc, fraud_dwh.d_timestamp as t, fraud_dwh.d_merchant as m, fraud_dwh.d_customer as c, fraud_dwh.d_category as cat
	where cc.trans_date_trans_time = t.trans_timestamp and cc.merchant = m.merchant_name and cc.customer_name = c.customer_name and cc.category = cat.category_name;
    
    insert into  fraud_dwh.f_transaction(transaction_id, timestamp_id, merchant_id, customer_id, cc_num, category_id, amount, fraud_id, fraud_indicator)
    select distinct b.TransactionID, t.id, m.id, c.id, b.cc_num, cat.id, b.TransactionAmount, b.fraud_type, b.FraudIndicator
    from fraudulent_activities.bank as b, fraud_dwh.d_timestamp as t, fraud_dwh.d_merchant as m, fraud_dwh.d_customer as c, fraud_dwh.d_category as cat
	where b.trans_timestamp = t.trans_timestamp and b.MerchantName = m.merchant_name and b.CustomerName = c.customer_name and b.Category = cat.category_name;
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_transactions_daily', now(),'f_transaction', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT daily_transactions_load
ON SCHEDULE EVERY 1 Day
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_transactions_daily();