SELECT employee_id,
       LPAD(SUBSTR(phone_number, 5), 12, '(02)')
  FROM employees;
  
  SELECT employee_id,
       LPAD(SUBSTR(phone_number, 5), 12, '(02)')
  FROM employees;
  
  SELECT cust_main_phone_number, 
       REPLACE(cust_main_phone_number, '-', '/')
  FROM customers;

SELECT cust_name, cust_main_phone_number, 
       TRANSLATE(cust_main_phone_number, '0123456789', 'acielsifke') new_phone_number
  FROM customers;

SELECT CUST_NAME,CUST_YEAR_OF_BIRTH, 
       DECODE( TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10),
       3, '30��',4, '40��',5, '50��','��Ÿ') age
FROM CUSTOMERS;   


SELECT CUST_NAME, 
       CUST_YEAR_OF_BIRTH, 
       CASE WHEN TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10)  BETWEEN  1 AND 19 THEN '10��'
            WHEN TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10)  BETWEEN 20 AND 29 THEN '20��'
            WHEN TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10)  BETWEEN 30 AND 39 THEN '30��'
            WHEN TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10)  BETWEEN 40 AND 49 THEN '40��'
            WHEN TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10)  BETWEEN 50 AND 59 THEN '50��'
            WHEN TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10)  BETWEEN 60 AND 69 THEN '60��'
            WHEN TRUNC((TO_CHAR(SYSDATE, 'YYYY') - CUST_YEAR_OF_BIRTH)/10)  BETWEEN 70 AND 79 THEN '70��'
          ELSE '��Ÿ' END AS new_generation
FROM CUSTOMERS;     