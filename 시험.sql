CREATE TABLE ex3_6(
    employee_id NUMBER(6,0),
    emp_name    VARCHAR2(80),
    salary      NUMBER(8,2),
    manager_id  NUMBER(6,0)
);


INSERT INTO ex3_6
SELECT employee_id, emp_name, salary, manager_id
FROM employees a
WHERE MANAGER_ID =124
AND   a.salary BETWEEN 2000 AND 3000; 



DELETE ex3_3;

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id 
  FROM employees e, sales s
 WHERE e.employee_id = s.employee_id
   AND s.SALES_MONTH BETWEEN '200010' AND '200012'
 GROUP BY e.employee_id;
 
COMMIT;

SELECT *
FROM ex3_3;


MERGE INTO ex3_3 a
    USING (SELECT employee_id , salary, manager_id
            FROM employees
            WHERE manager_id = 145) b
        ON (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET a.bonus_amt = a.bonus_amt + b.salary*0.01
WHEN NOT MATCHED THEN
    INSERT (a.employee_id, a.bonus_amt) VALUES (b.employee_id, b.salary*0.005);



SELECT employee_id, emp_name
FROM employees
WHERE commission_pct IS NULL
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary >=2000
AND   salary <=2500
ORDER BY employee_id;

SELECT employee_id, salary
FROM employees
WHERE salary = ANY(2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM    employees
WHERE  salary <> ALL(2000,3000,4000)
ORDER BY employee_id;



CREATE TABLE ex3_6(
    employee_id  NUMBER(6),
    emp_name  VARCHAR2(80),
    salary NUMBER(8,2),
    manager_id  NUMBER(6)
);

INSERT INTO ex3_6
SELECT employee_id, emp_name, salary, manager_id
FROM   employees a
WHERE  MANAGER_ID = 124
AND    a.salary BETWEEN 2000 AND 3000;

MERGE INTO ex3_3 a
    USING(SELECT employee_id, manager_id, salary
          FROM employees
          WHERE manager_id = 145) b
       ON (a.employee_id = b.employee_id)
       
    WHEN MATCHED THEN
            UPDATE SET a.bonus_amt = a.bonus_amt + b.salary*0.01
    WHEN NOT MATCHED THEN
            INSERT (a.employee_id, a.bonus_amt) VALUES (b.employee_id, b.salary*.005);
    

SELECT employee_id, emp_name
FROM    employees
WHERE   commission_pct IS NULL
ORDER BY employee_id;





--1번
CREATE TABLE PRODUCTSS (
    PRODUCT_ID      NUMBER(12,0),
    PRODUCT_NAME    VARCHAR2(8 BYTE),
    QUANTITY        NUMBER(10,0) DEFAULT 0,
    ORDER_DATE      DATE,
    ORDRDER_MODE    VARCHAR2(8 BYTE),
    DESCRIPION      VARCHAR2(20 BYTE),
    STANDARD_COST   NUMBER(4,0),
    LIST_PRICE      NUMBER(8,2) DEFAULT 0,
    CATEGORY_ID     NUMBER(6,0),
    PROMOTION_ID    NUMBER(6,0),
    CONSTRAINT PK_PRODUCT PRIMARY KEY(PRODUCT_ID),
    CONSTRAINT CK_ORDER_MODE CHECK (ORDER_MODE in ('direct', 'onlice'))
);

--2번
CREATE TABLE exam2_1 (
    employee_id     NUMBER(6,0),
    emp_name        VARCHAR2(80),
    salary          NUMBER(8,2),
    manager_id      NUMBER(6,0));
    
--3번
INSERT INTO exam2_1
SELECT employee_id, emp_name, salary, manager_id
FROM employees a
WHERE manager_id = 147
AND   a.salary BETWEEN 6000 AND 7000;

DROP TABLE ex2_2;
--4번
CREATE TABLE exam2_2(
    employee_id     NUMBER,
    bonus_amt       NUMBER DEFAULT 0
);
    
    
--5번
INSERT INTO exam2_2 (employee_id)
SELECT e.employee_id
FROM   employees e, sales s
WHERE e.employee_id = s.employee_id
AND s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP BY e.employee_id;

COMMIT;
SELECT *
FROM exam2_2;

MERGE INTO exam2_2 a
    USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 146) b
        ON (a.employee_id = b.employee_id)
        
WHEN MATCHED THEN
    UPDATE SET a.bonus_amt = a.bonus_amt + b.salary*0.05
WHEN NOT MATCHED THEN
    INSERT (a.employee_id, a.bonus_amt) VALUES (b.employee_id, b.salary*0.02); 

--6번
SELECT employee_id, emp_name
FROM employees
WHERE department_id IS NULL
ORDER BY employee_id;

--7번
SELECT employee_id, salary
FROM employees
WHERE   salary >= 4500
AND     salary <= 5000
ORDER BY employee_id;









