--3�� �ǻ��÷�

SELECT ROWNUM, employee_id
FROM    employees;

SELECT ROWNUM, employee_id
FROM    employees
WHERE ROWNUM <5;

SELECT ROWNUM, employee_id, ROWID
FROM employees
WHERE ROWNUM <5;