--1. Select문;

- 예문1
select 사원번호, 사원명(컬럼) # *은 모든 컬럼
from 사원테이블 (어디서)
where 급여>50000; (조건);

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;

- 예문2
order by 컬럼 : 컬럼을 정렬;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
ORDER BY employee_id;

- 예문3
and 컬럼 = '조건' (조건추가) # 둘다 일치할때
오라클은 디폴트로 대소문자를 구분하여 조건이 틀리면 데이터는 조회되지 않는다.

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
AND job_id = 'IT_PROG'
ORDER BY employee_id;

- 예문4
or 컬럼 = '조건' (조건추가) # 조건1 이거나 조건2 일때

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
OR    job_id = 'IT_PROG'
ORDER BY employee_id;

- 예문5
원컬럼명 AS 컬럼별칭 AS 생략가능

SELECT  a.employee_id, a.emp_name, a.department_id,
        b.department_name AS dep_name
FROM    employees a,
        departments b
WHERE   a.department_id = b.department_id;