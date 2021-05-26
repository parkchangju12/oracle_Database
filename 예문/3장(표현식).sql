--3장 표현식

SELECT employee_id, salary,
CASE WHEN salary <= 5000 THEN 'C등급'
WHEN salary > 5000 AND salary <= 15000 THEN 'B등급'
ELSE 'A등급'
END AS salary_grade
FROM employees
