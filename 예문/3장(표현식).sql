--3�� ǥ����

SELECT employee_id, salary,
CASE WHEN salary <= 5000 THEN 'C���'
WHEN salary > 5000 AND salary <= 15000 THEN 'B���'
ELSE 'A���'
END AS salary_grade
FROM employees
