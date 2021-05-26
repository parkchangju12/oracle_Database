--3Àå Á¶°Ç½Ä

SELECT employee_id ,salary
FROM employees
WHERE salary = ANY(2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id ,salary
FROM employees
WHERE   salary = 2000
OR      salary = 3000
OR      salary = 4000
ORDER BY employee_id;

SELECT employee_id ,salary
FROM employees
WHERE  salary = ALL(2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id ,salary
FROM employees
WHERE  salary = SOME(2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id ,salary
FROM employees
WHERE NOT(salary >=2500)
ORDER BY employee_id;

SELECT employee_id ,salary
FROM employees
WHERE  salary BETWEEN 2000 AND 2500
ORDER BY employee_id;

SELECT employee_id ,salary
FROM employees
WHERE  salary IN (2000,3000,4000)
ORDER BY employee_id;

SELECT employee_id ,salary
FROM employees
WHERE  salary NOT IN (2000,3000,4000)
ORDER BY employee_id;


SELECT department_id, department_name
FROM departments a
WHERE EXISTS  (SELECT *
                FROM employees b
                WHERE a.department_id = b.department_id
                AND b.salary >300)
ORDER BY a.department_name;


SELECT emp_name
FROM employees
WHERE emp_name LIKE 'A%'
ORDER BY emp_name;

SELECT emp_name
FROM employees
WHERE emp_name LIKE 'Al%'
ORDER BY emp_name;

CREATE TABLE ex3_5(
    names VARCHAR2(30));
    
INSERT INTO ex3_5 VALUES ('È«±æµ¿');
INSERT INTO ex3_5 VALUES ('È«±æ¿ë');
INSERT INTO ex3_5 VALUES ('È«±æ»ó');
INSERT INTO ex3_5 VALUES ('È«±æ»óµ¿');

SELECT *
FROM ex3_5
WHERE NAMES like 'È«±æ%';

SELECT *
FROM ex3_5
WHERE NAMES like 'È«±æ_';