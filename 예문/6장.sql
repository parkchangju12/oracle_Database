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

SELECT a.*
FROM (SELECT a.sales_month, ROUND(AVG(a.amount_sold)) AS month_avg
        FROM sales a,
             customers b,
             countries c
        WHERE   a.sales_month BETWEEN '200001' AND '200012'
        AND     a.cust_id = b.CUST_ID
        AND     b.COUNTRY_ID = c.COUNTRY_ID
        AND     c.COUNTRY_NAME = 'Italy'
        GROUP BY a.sales_month
        ) a,
        (SELECT ROUND(AVG(a.amount_sold)) AS year_avg
            FROM sales a,
                customers b,
                countries c
        WHERE   a.sales_month BETWEEN '200001' AND '200012'
        AND     a.cust_id = b.CUST_ID
        AND     b.COUNTRY_ID = c.COUNTRY_ID
        AND     c.COUNTRY_NAME = 'Italy'
        ) b
WHERE a.month_avg>b.year_avg;


SELECT  SUBSTR(a.sales_month, 1, 4) as years,
        a.employee_id,
        SUM(a.amount_sold) AS amount_sold
FROM    sales a,
        customers b,
        countries c
WHERE   a.cust_id = b.CUST_ID
AND     b.country_id = c.COUNTRY_ID
AND     c.country_name = 'Italy'
GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id;

SELECT  years, MAX(amount_sold) AS max_sold
FROM    (SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id,
                SUM(a.amount_sold) AS amount_sold
         FROM   sales a,
                customers b,
                countries c
         WHERE  a.cust_id = b.CUST_ID
         AND    b.country_id = c.COUNTRY_ID
         AND    c.country_name = 'Italy'
         GROUP  BY  SUBSTR(a.sales_month, 1,4), a.employee_id)K
GROUP BY years
ORDER BY years;


SELECT  emp.years, emp.employee_id, emp.amount_sold
FROM    (SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id,
                SUM(a.amount_sold) AS amount_sold
         FROM   sales a,
                customers b,
                countries c
         WHERE  a.cust_id = b.CUST_ID
         AND    b.country_id = c.COUNTRY_ID
         AND    c.country_name = 'Italy'
         GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id) emp, (SELECT years, MAX(amount_sold) AS max_sold
         FROM   (SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id,
                        SUM(a.amount_sold) AS amount_sold
                 FROM   sales a,
                        customers b,
                        countries c
                WHERE   a.cust_id = b.CUST_ID
                AND     b.country_id = c.COUNTRY_ID
                AND     c.country_name = 'Italy'
                GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id
                ) K
        GROUP BY years
    ) sale
WHERE   emp.years = sale.years
AND     emp.amount_sold = sale.max_sold
ORDER by YEARS;





SELECT  emp.years, emp.employee_id, emp.amount_sold, emp.amount_sold
FROM    (SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id,
                SUM(a.amount_sold) AS amount_sold
         FROM   sales a,
                customers b,
                countries c
         WHERE  a.cust_id = b.CUST_ID
         AND    b.country_id = c.COUNTRY_ID
         AND    c.country_name = 'Italy'
         GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id) emp, 
         (SELECT years, MAX(amount_sold) AS max_sold
         FROM   (SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id,
                        SUM(a.amount_sold) AS amount_sold
                 FROM   sales a,
                        customers b,
                        countries c
                WHERE   a.cust_id = b.CUST_ID
                AND     b.country_id = c.COUNTRY_ID
                AND     c.country_name = 'Italy'
                GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id
                ) K
        GROUP BY years
    ) sale, employees emp2
WHERE   emp.years = sale.years
AND     emp.amount_sold = sale.max_sold
AND     emp.employee_id = emp2.employee_id
ORDER by YEARS;

































