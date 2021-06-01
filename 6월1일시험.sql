1. ������̺�(employees)���� phone_number��� �÷��� ����� ��ȭ��ȣ�� ###.###.#### ���·� ����Ǿ� �ִ�.
���⼭ ó�� 3�ڸ� ���� ��� ���� ������ȣ�� (031)�� �ٿ� ��ȭ��ȣ�� ����ϵ��� ������ �ۼ��� ����.;


SELECT employee_id,
       LPAD(SUBSTR(phone_number, 4), 14, '(031)'),
       REPLACE(phone_number, '.', '-')
FROM employees;

SELECT employee_id,
    REPLACE(LPAD(SUBSTR(phone_number, 4), 14, '(031)'), '.', '-') 
    FROM employees;


2. �������� �������� ������̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 10�� �̻��� ����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��غ���. 
   (�ټӳ���� ���� ���������� ����� �������� ����);
SELECT employee_id, emp_name, HIRE_DATE, 
       ROUND((sysdate - hire_date) / 365)
  FROM employees
 WHERE ROUND((sysdate - hire_date) / 365) >= 22
 ORDER BY hire_date DESC;
 
 
 3. �� ���̺�(CUSTOMERS)�� �� ��ȭ��ȣ(cust_main_phone_number) �÷��� �ٸ� ���ڷ� ��ü(������ ��ȣȭ)�ϵ��� ������ �ۼ��� ����.
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
       DECODE(TRUNC((CUST_YEAR_OF_BIRTH-1900)/10),  5, '1950���', 
                                        6, '1960���',
                                        7, '1970���',
                                        8, '1980���',
                                        9, '1990���',
                                        '��Ÿ') year
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