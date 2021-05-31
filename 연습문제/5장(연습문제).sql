--1번

--사원 테이블에서 입사년도별 사원 수를 구하는 쿼리를 작성해 보자

SELECT  TO_CHAR(hire_date, 'YYYY') , COUNT(*)
FROM    employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY TO_CHAR(hire_date, 'YYYY');

--2번

--kor_loan_status 테이블에서 2012년도 월별, 지역별 대출 총 잔액을 구하는 쿼리를 작성해 보자

SELECT  period, region, SUM(loan_jan_amt) totl_jan
FROM    kor_loan_status
WHERE   period LIKE '2012%'
GROUP BY period, region
ORDER BY period, region;

--3번

--다음의 쿼리는 분할 ROLLUP을 적용한 쿼리다.
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun );

--이 쿼리를 ROLLUP을 사용하지 않고 집합 연산자로 동일한 결과가 나오도록 쿼리를 작성해 보자
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period,  gubun
UNION 
SELECT period,'', SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period; 