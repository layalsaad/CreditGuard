
DELIMITER //
CREATE PROCEDURE load_days_of_week()
BEGIN
	delete from fraud_dwh.d_day_of_week;
    insert into fraud_dwh.d_day_of_week(day_name)
    values('Monday'), ('Tuesday'), ('Wednesday'), ('Thursday'), ('Friday'), ('Saturday'), ('Sunday');
END
//

DELIMITER //
CREATE PROCEDURE load_months()
BEGIN
	delete from fraud_dwh.d_month;
    insert into fraud_dwh.d_month(month_name)
    values('January'), ('February'), ('March'), ('April'), ('May'), ('June'), ('July'), ('August'), ('September'), ('October'), ('November'), ('December');
END
//

DELIMITER //
CREATE PROCEDURE load_types()
BEGIN
	delete from fraud_dwh.d_fraud;
    insert into fraud_dwh.d_fraud(id, fraud_type)
    values(1, 'bank'), (2, 'credit card');
END
//
