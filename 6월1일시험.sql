1. 사원테이블(employees)에는 phone_number라는 컬럼에 사원의 전화번호가 ###.###.#### 형태로 저장되어 있다.
여기서 처음 3자리 숫자 대신 서울 지역번호인 (031)를 붙여 전화번호를 출력하도록 쿼리를 작성해 보자.;


SELECT employee_id,
       LPAD(SUBSTR(phone_number, 4), 14, '(031)'),
       REPLACE(phone_number, '.', '-')
FROM employees;

SELECT employee_id,
    REPLACE(LPAD(SUBSTR(phone_number, 4), 14, '(031)'), '.', '-') 
    FROM employees;


2. 현재일자 기준으로 사원테이블의 입사일자(hire_date)를 참조해서 근속년수가 10년 이상인 사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해보자. 
   (근속년수가 많은 사원순서대로 결과를 나오도록 하자);
SELECT employee_id, emp_name, HIRE_DATE, 
       ROUND((sysdate - hire_date) / 365)
  FROM employees
 WHERE ROUND((sysdate - hire_date) / 365) >= 22
 ORDER BY hire_date DESC;
 
 
 3. 고객 테이블(CUSTOMERS)의 고객 전화번호(cust_main_phone_number) 컬럼을 다른 문자로 대체(일종의 암호화)하도록 쿼리를 작성해 보자.
 ;
 SELECT cust_name, cust_main_phone_number, 
       TRANSLATE(cust_main_phone_number, '0123456789', 'imastudent') new_phone_number
  FROM customers
  ORDER BY cust_name ASC;

4.
CREATE TABLE exam3
(
    name    VARCHAR2(100),
    new_phone_number    VARCHAR2(25)
);

5. ;
INSERT INTO exam3(name, new_phone_number)
SELECT cust_name,
       TRANSLATE(cust_main_phone_number, '0123456789', 'imastudent') new_phone_number
FROM customers
ORDER BY cust_name ASC;


6.;

SELECT name, 
       TRANSLATE(new_phone_number, 'imastudent', '0123456789') new_phone_number
FROM exam3;


7.;
SELECT CUST_NAME, 
       CUST_YEAR_OF_BIRTH, 
       DECODE(TRUNC((CUST_YEAR_OF_BIRTH-1900)/10),  5, '1950년대', 
                                        6, '1960년대',
                                        7, '1970년대',
                                        8, '1980년대',
                                        9, '1990년대',
                                        '기타') year
FROM CUSTOMERS;


8.;
SELECT TO_CHAR(hire_date, 'MM') AS hire_year,
       COUNT(*)
  FROM employees
GROUP BY TO_CHAR(hire_date, 'MM')
ORDER BY TO_CHAR(hire_date, 'MM');



SELECT period, region, SUM(loan_jan_amt)
FROM kor_loan_status
WHERE period LIKE '2011%'
GROUP BY period, region
ORDER BY period, region;