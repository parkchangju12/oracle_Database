SELECT  a.employee_id, a.emp_name, b.job_title, c.start_date, c.end_date, d.department_name
FROM    employees a,
        jobs b,
        job_history c,
        departments d
        
WHERE   a.employee_id = c.employee_id
AND     c.department_id = d.department_id
AND     c.job_id = b.job_id
AND     a.employee_id = 101;
        





























--1번;
SELECT  a.employee_id, a.emp_name, b.job_title, c.start_date, c.end_date, d.department_name
FROM    employees a,
        jobs b,
        job_history c,
        departments d
WHERE   a.employee_id = c.employee_id
AND     c.department_id = d.department_id
AND     c.job_id = b.job_id
AND     a.employee_id = 101;
        
        
--2번;

SELECT  a.employee_id, a.emp_name, b.job_id, b.department_id
FROM    employees a, job_history b
WHERE   a.employee_id = b.employee_id(+)
AND     a.department_id = b.department_id(+);


--4번

SELECT      a.department_id, a.department_name
FROM        departments a, employees b
WHERE       a.department_id = b.department_id
AND         b.salary > 3000
ORDER BY    a.department_name;


SELECT      a.department_id, a.department_name
FROM        departments a
INNER JOIN  employees b
ON          (a.department_id = b.department_id)
WHERE       b.salary > 3000
ORDER BY    a.department_name;



--5번

SELECT  a.department_id, a.department_name
FROM    departments a
WHERE   EXISTS (SELECT  1
                FROM    job_history b
                WHERE   a.department_id = b.department_id);










SELECT a.department_id, a.department_name
 FROM departments a
WHERE a.department_id IN ( SELECT department_id
                             FROM job_history  );
                             
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
                             
--6번

SELECT emp.years, 
       emp.employee_id,
       emp2.emp_name,
       emp.amount_sold
  FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                a.employee_id, 
                SUM(a.amount_sold) AS amount_sold
           FROM sales a,
                customers b,
                countries c
          WHERE a.cust_id = b.CUST_ID
            AND b.country_id = c.COUNTRY_ID
            AND c.country_name = 'Italy'     
          GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id   
        ) emp,
       ( SELECT  years, 
                 MAX(amount_sold) AS max_sold,
                 MIN(amount_sold) AS min_sold
          FROM ( SELECT SUBSTR(a.sales_month, 1, 4) as years,
                        a.employee_id, 
                        SUM(a.amount_sold) AS amount_sold
                   FROM sales a,
                        customers b,
                        countries c
                  WHERE a.cust_id = b.CUST_ID
                    AND b.country_id = c.COUNTRY_ID
                    AND c.country_name = 'Italy'     
                  GROUP BY SUBSTR(a.sales_month, 1, 4), a.employee_id    
               ) K
          GROUP BY years
       ) sale,
       employees emp2
  WHERE emp.years = sale.years
   AND (emp.amount_sold = sale.max_sold  OR emp.amount_sold = sale.min_sold)
   AND emp.employee_id = emp2.employee_id
  ORDER BY years;