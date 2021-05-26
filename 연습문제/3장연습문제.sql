DROP TABLE ex3_6;

--문제1
CREATE TABLE ex3_6(
    employee_id     NUMBER(6),
    manager_id      NUMBER(6),
    emp_name   VARCHAR(80),
    salary          NUMBER(8, 2)
);

INSERT INTO ex3_6
SELECT  employee_id, manager_id, emp_name, salary
FROM    employees a
WHERE   a.manager_id = 124
AND     a.salary BETWEEN 2000 AND 3000;


--문제2

DELETE ex3_3;

INSERT INTO ex3_3 (employee_id)
SELECT e.employee_id 
  FROM employees e, sales s
 WHERE e.employee_id = s.employee_id
   AND s.SALES_MONTH BETWEEN '200010' AND '200012'
 GROUP BY e.employee_id;
 
COMMIT;

MERGE INTO ex3_3 a
     USING (SELECT employee_id, salary, manager_id
              FROM employees
             WHERE manager_id = 145) b
        ON (a.employee_id = b.employee_id)
 WHEN MATCHED THEN 
      UPDATE SET a.bonus_amt = a.bonus_amt + b.salary * 0.01
 WHEN NOT MATCHED THEN 
      INSERT (a.employee_id, a.bonus_amt) VALUES (b.employee_id, b.salary *.005) ;
