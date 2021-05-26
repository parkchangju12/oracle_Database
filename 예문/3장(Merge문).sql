--4. Meerge문
--테이블 생성

CREATE TABLE ex3_3(
    employee_id NUMBER,
    bonus_amt   NUMBER DEFAULT 0
);

INSERT INTO ex3_3 (employee_id)
SELECT  e.employee_id
FROM    employees e, sales s
WHERE   e.employee_id = s.employee_id
AND     s.SALES_MONTH BETWEEN '200010' AND '200012'
GROUP   BY e.employee_id;

SELECT *
    FROM ex3_3
ORDER BY employee_id;

SELECT  employee_id, manager_id, salary, salary*0.01
FROM    employees
WHERE   employee_id IN (SELECT employee_id FROM ex3_3);

SELECT  employee_id, manager_id, salary, salary*0.001
FROM    employees
WHERE   employee_id NOT IN (SELECT employee_id FROM ex3_3)
AND     manager_id = 146;

MERGE INTO  ex3_3 d
USING       (SELECT employee_id, salary, manager_id FROM employees WHERE manager_id = 146) b
ON          (d.employee_id = b.employee_id)
WHEN MATCHED THEN
UPDATE SET  d.bonus_amt = d.bonus_amt + b.salary * 0.01
WHEN NOT MATCHED THEN
INSERT      (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
WHERE       (b.salary <8000);

SELECT  *
FROM    ex3_3
ORDER BY employee_id;

MERGE INTO  ex3_3 d
USING       (SELECT employee_id, salary, manager_id FROM employees WHERE manager_id = 146) b
ON          (d.employee_id = b.employee_id)
WHEN MATCHED THEN
UPDATE SET  d.bonus_amt = d.bonus_amt + b.salary * 0.01
DELETE WHERE (B.employee_id = 161)
WHEN NOT MATCHED THEN
INSERT      (d.employee_id, d.bonus_amt) VALUES (b.employee_id, b.salary *.001)
WHERE       (b.salary <8000);

SELECT  *
FROM    ex3_3
ORDER BY employee_id;