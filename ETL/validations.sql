-- -------- validating merchants ------------------------
SELECT 
    (SELECT COUNT(merchant_name) FROM fraud_dwh.d_merchant),
    (SELECT COUNT(distinct MerchantName) FROM fraudulent_activities.bank),
    (SELECT COUNT(distinct merchant) FROM fraudulent_activities.credit_card),
    CASE
        WHEN (SELECT COUNT(distinct MerchantName) FROM fraudulent_activities.bank) + (SELECT COUNT(distinct merchant) FROM fraudulent_activities.credit_card) = (SELECT COUNT(merchant_name) FROM fraud_dwh.d_merchant) 
        THEN 'Valid'
        ELSE 'Invalid'
    END AS validation_result;
-- -------- validating transactions ------------------------
SELECT 
    (SELECT COUNT(id) FROM fraud_dwh.f_transaction),
    (SELECT COUNT(distinct TransactionID) FROM fraudulent_activities.bank),
    (SELECT COUNT(distinct trans_num) FROM fraudulent_activities.credit_card),
    CASE
        WHEN (SELECT COUNT(distinct TransactionID) FROM fraudulent_activities.bank) + (SELECT COUNT(distinct trans_num) FROM fraudulent_activities.credit_card) = (SELECT COUNT(id) FROM fraud_dwh.f_transaction) 
        THEN 'Valid'
        ELSE 'Invalid'
    END AS validation_result;
-- -------- fraud validation ---------------------------------
SELECT 
    (SELECT COUNT(*) FROM fraud_dwh.f_transaction where fraud_indicator = 1),
    (SELECT COUNT(*) FROM fraudulent_activities.bank where FraudIndicator = 1),
    (SELECT COUNT(*) FROM fraudulent_activities.credit_card where is_fraud = 1),
    CASE
        WHEN (SELECT COUNT(*) FROM fraudulent_activities.credit_card where is_fraud = 1) + (SELECT COUNT(*) FROM fraudulent_activities.bank where FraudIndicator = 1) = (SELECT COUNT(*) FROM fraud_dwh.f_transaction where fraud_indicator = 1) 
        THEN 'Valid'
        ELSE 'Invalid'
    END AS validation_result;
-- ---------- jobs validation --------------------------------------
SELECT 
    (SELECT COUNT(*) FROM fraud_dwh.d_job),
    (SELECT COUNT(distinct job) FROM fraudulent_activities.bank where not exists (SELECT distinct job FROM fraudulent_activities.credit_card)),
    (SELECT COUNT(distinct job) FROM fraudulent_activities.credit_card),
    CASE
        WHEN (SELECT COUNT(distinct job) FROM fraudulent_activities.bank where not exists (SELECT distinct job FROM fraudulent_activities.credit_card)) + (SELECT COUNT(distinct job) FROM fraudulent_activities.credit_card) = (SELECT COUNT(*) FROM fraud_dwh.d_job) 
        THEN 'Valid'
        ELSE 'Invalid'
    END AS validation_result;
-- --------- categories validation ----------------------------------------
SELECT 
    (SELECT COUNT(*) FROM fraud_dwh.d_category),
    (SELECT COUNT(distinct Category) FROM fraudulent_activities.bank where not exists (SELECT distinct category FROM fraudulent_activities.credit_card)),
    (SELECT COUNT(distinct category) FROM fraudulent_activities.credit_card),
    CASE
        WHEN (SELECT COUNT(distinct Category) FROM fraudulent_activities.bank where not exists (SELECT distinct category FROM fraudulent_activities.credit_card)) + (SELECT COUNT(distinct category) FROM fraudulent_activities.credit_card) = (SELECT COUNT(*) FROM fraud_dwh.d_category) 
        THEN 'Valid'
        ELSE 'Invalid'
    END AS validation_result;