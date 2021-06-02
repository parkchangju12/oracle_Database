SELECT a.department_id, a.department_name
FROM departments a, employees b
WHERE a.department_id = b.department_id
AND b.salary >3000
ORDER BY a.department_name;

SELECT a.employee_id, a.emp_name, a.department_id, b.department_name
FROM employees a, departments b
WHERE a.department_id = b.department_id
AND a.department_id NOT IN (SELECT department_id
                            FROM departments
                            WHERE manager_id IS NULL);
                            
                            
SELECT count(*)
FROM employees a
WHERE NOT EXISTS(SELECT 1
                 FROM departments c
                 WHERE a.department_id = c.department_id
                 AND    manager_id IS NULL);
                 
                 
SELECT  a.employee_id, a.emp_name, b.employee_id, b.emp_name, a.department_id
FROM    employees a, employees b
WHERE   a.employee_id < b.employee_id
AND     a.department_id = b.department_id
AND     a.department_id = 20;


SELECT  a.department_id, a.department_name, b.job_id, b.department_id
FROM    departments a, job_history b
WHERE   a.department_id = b.department_id;


SELECT  a.department_id, a.department_name, b.job_id, b.department_id
FROM    departments a, job_history b
WHERE   a.department_id = b.department_id(+);

SELECT  a.employee_id, a.emp_name, b.job_id, b.department_id
FROM    employees a, job_history b
WHERE   a.employee_id = b.employee_id(+)
AND     a.department_id = b.department_id;

SELECT  a.employee_id, a.emp_name, b.job_id, b.department_id
FROM    employees a, job_history b
WHERE   a.employee_id = b.employee_id(+)
AND     a.department_id = b.department_id(+);

SELECT  a.employee_id, a.emp_name, b.department_id, b.department_name
FROM    employees a,departments b;