SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_merchants_daily()
BEGIN
	delete from fraud_dwh.d_merchant;
    
    insert into  fraud_dwh.d_merchant(merchant_name)
    select distinct MerchantName from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_merchant where fraud_dwh.d_merchant.merchant_name = fraudulent_activities.bank.MerchantName);
    
    insert into  fraud_dwh.d_merchant(merchant_name)
    select distinct merchant from fraudulent_activities.credit_card where not exists (select 1 from fraud_dwh.d_merchant where fraud_dwh.d_merchant.merchant_name = fraudulent_activities.credit_card.merchant);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_merchants_weekly', now(),'d_merchant', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT weekly_merchants_load
ON SCHEDULE EVERY 1 week
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_merchants_weekly();