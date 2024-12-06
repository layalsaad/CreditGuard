SET GLOBAL event_scheduler = ON;

DELIMITER //
CREATE PROCEDURE load_categories_monthly()
BEGIN
	delete from fraud_dwh.d_category;

    insert into fraud_dwh.d_category(category_name)
    select distinct category from fraudulent_activities.credit_card;
    
    insert into fraud_dwh.d_category(category_name)
    select distinct category from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_category where fraud_dwh.d_category.category_name = fraudulent_activities.bank.category);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_categories_monthly', now(),'d_category', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT monthly_categories_load
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_categories_monthly();
    
DELIMITER //
CREATE PROCEDURE load_states_monthly()
BEGIN
	delete from fraud_dwh.d_state;

    insert into fraud_dwh.d_state(state_name)
    select distinct state from fraudulent_activities.credit_card;
    
    insert into fraud_dwh.d_state(state_name)
    select distinct m_state from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_state where fraud_dwh.d_state.state_name = fraudulent_activities.bank.m_state);
    
    insert into fraud_dwh.d_state(state_name)
    select distinct m_state from fraudulent_activities.credit_card where not exists (select 1 from fraud_dwh.d_state where fraud_dwh.d_state.state_name = fraudulent_activities.credit_card.m_state);
    
    insert into fraud_dwh.d_state(state_name)
    select distinct c_state from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_state where fraud_dwh.d_state.state_name = fraudulent_activities.bank.c_state);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_states_monthly', now(),'d_state', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT monthly_states_load
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_states_monthly();
    

DELIMITER //
CREATE PROCEDURE load_cities_monthly()
BEGIN
	delete from fraud_dwh.d_city;

    insert into fraud_dwh.d_city(city_name)
    select distinct city from fraudulent_activities.credit_card;
    
    insert into fraud_dwh.d_city(city_name)
    select distinct m_city from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_city where fraud_dwh.d_city.city_name = fraudulent_activities.bank.m_city);
    
    insert into fraud_dwh.d_city(city_name)
    select distinct m_city from fraudulent_activities.credit_card where not exists (select 1 from fraud_dwh.d_city where fraud_dwh.d_city.city_name = fraudulent_activities.credit_card.m_city);
    
    insert into fraud_dwh.d_city(city_name)
    select distinct c_city from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_city where fraud_dwh.d_city.city_name = fraudulent_activities.bank.c_city);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_cities_monthly', now(),'d_city', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT monthly_cities_load
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_cities_monthly();
    

DELIMITER //
CREATE PROCEDURE load_streets_monthly()
BEGIN
	delete from fraud_dwh.d_street;

    insert into fraud_dwh.d_street(street_name)
    select distinct street from fraudulent_activities.credit_card;
    
    insert into fraud_dwh.d_street(street_name)
    select distinct m_street from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_street where fraud_dwh.d_street.street_name = fraudulent_activities.bank.m_street);
    
    insert into fraud_dwh.d_street(street_name)
    select distinct m_street from fraudulent_activities.credit_card where not exists (select 1 from fraud_dwh.d_street where fraud_dwh.d_street.street_name = fraudulent_activities.credit_card.m_street);
    
    insert into fraud_dwh.d_street(street_name)
    select distinct c_street from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_street where fraud_dwh.d_street.street_name = fraudulent_activities.bank.c_street);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_streets_monthly', now(),'d_street', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT monthly_streets_load
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_streets_monthly();
    

DELIMITER //
CREATE PROCEDURE load_jobs_monthly()
BEGIN
	delete from fraud_dwh.d_job;

    insert into fraud_dwh.d_job(job_name)
    select distinct job from fraudulent_activities.credit_card;
    
    insert into fraud_dwh.d_job(job_name)
    select distinct job from fraudulent_activities.bank where not exists (select 1 from fraud_dwh.d_job where fraud_dwh.d_job.job_name = fraudulent_activities.bank.job);
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_jobs_monthly', now(),'d_job', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT monthly_jobs_load
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_jobs_monthly();


DELIMITER //
CREATE PROCEDURE load_addresses_monthly()
BEGIN
	delete from fraud_dwh.d_address;
    
    insert into  fraud_dwh.d_address(c_id, street_id, city_id, state_id, zipcode)
    select c.id, strt.id, ct.id, st.id, b.c_zip 
    from fraudulent_activities.bank as b,  fraud_dwh.d_customer as c , fraud_dwh.d_street as strt,  fraud_dwh.d_city as ct, fraud_dwh.d_state as st
    where b.CustomerName = c.customer_name and b.c_street = strt.street_name and b.c_city = ct.city_name and b.c_state = st.state_name and not exists (select 1 from fraud_dwh.d_address where fraud_dwh.d_address.c_id = c.id and c.customer_name = b.CustomerName);
    
    insert into  fraud_dwh.d_address(c_id, street_id, city_id, state_id, zipcode)
    select distinct c.id, strt.id, ct.id, st.id, cc.zip 
    from fraudulent_activities.credit_card as cc,  fraud_dwh.d_customer as c , fraud_dwh.d_street as strt,  fraud_dwh.d_city as ct, fraud_dwh.d_state as st
    where cc.customer_name = c.customer_name and cc.street = strt.street_name and cc.city = ct.city_name and cc.state = st.state_name and not exists (select 1 from fraud_dwh.d_address where fraud_dwh.d_address.c_id = c.id and c.customer_name = cc.customer_name);
    
    insert into  fraud_dwh.d_address(m_id, street_id, city_id, state_id, zipcode)
    select distinct m.id, strt.id, ct.id, st.id, b.c_zip 
    from fraudulent_activities.bank as b,  fraud_dwh.d_merchant as m , fraud_dwh.d_street as strt,  fraud_dwh.d_city as ct, fraud_dwh.d_state as st
    where b.MerchantName = m.merchant_name and b.m_street = strt.street_name and b.m_city = ct.city_name and b.m_state = st.state_name and not exists (select 1 from fraud_dwh.d_address where fraud_dwh.d_address.m_id = m.id and m.merchant_name = b.MerchantName);
    
    insert into  fraud_dwh.d_address(m_id, street_id, city_id, state_id, zipcode)
    select distinct m.id, strt.id, ct.id, st.id, cc.zip 
    from fraudulent_activities.credit_card as cc,  fraud_dwh.d_merchant as m , fraud_dwh.d_street as strt,  fraud_dwh.d_city as ct, fraud_dwh.d_state as st
    where cc.merchant = m.merchant_name and cc.m_street = strt.street_name and cc.m_city = ct.city_name and cc.m_state = st.state_name and not exists (select 1 from fraud_dwh.d_address as addr 
    where addr.m_id = m.id and addr.street_id = strt.id and addr.city_id = ct.id and addr.state_id = st.id and addr.zipcode = cc.zip)
    and m.id is not null and strt.id is not null and ct.id is not null and st.id is not null
    and strt.street_name is not null and ct.city_name is not null and st.state_name is not null;
    
    insert into fraud_dwh.logs (procedure_name, procedure_date, table_modified, source_schema, target_schema)
    values ('load_addresses_monthly', now(),'d_address', 'fraudulent_activities','fraud_dwh');
END
//

CREATE EVENT monthly_addresses_load
ON SCHEDULE EVERY 1 Month
STARTS CURRENT_DATE + INTERVAL 2 HOUR
DO
	CALL load_addresses_monthly();