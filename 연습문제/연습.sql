DROP TABLE ex3_6;

CREATE TABLE ex3_6(
    employee_id     NUMBER(6,0),
    emp_name        VARCHAR2(80),
    salary          NUMBER(8,2),
    manager_id      NUMBER(6,0)
);

INSERT INTO ex3_6
SELECT  employee_id, emp_name, salary, manager_id
FROM    employees a
WHERE   a.manager_id = 124
AND     a.salary BETWEEN 2000 AND 3000;

DELETE ex3_3;

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id 
  FROM employees e, sales s
 WHERE e.employee_id = s.employee_id
   AND s.SALES_MONTH BETWEEN '200010' AND '200012'
 GROUP BY e.employee_id;
 
COMMIT;

MERGE INTO ex3_3 d
    USING (SELECT employee_id, salary, manager_id
            FROM employees
            WHERE manager_id = 145 ) b
        ON (d.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET d.bonus_amt = d.bonus_amt + b.salary * 0.01
WHEN NOT MATCHED THEN
    INSERT (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.005);
    
SELECT  employee_id, emp_name
FROM    employees
WHERE   commission_pct IS NULL
ORDER BY    employee_id;

SELECT  employee_id, salary
FROM    employees
WHERE   salary >= 2000
AND     salary <= 2500
ORDER BY employee_id;


SELECT  employee_id, salary
FROM    employees
WHERE   salary=ANY (2000, 3000, 4000)
ORDER BY employee_id;

SELECT employee_id, salary
FROM    employees
WHERE   salary <> ALL (2000, 3000, 4000)
ORDER BY employee_id;s
