--1��

--��� ���̺��� �Ի�⵵�� ��� ���� ���ϴ� ������ �ۼ��� ����

SELECT  TO_CHAR(hire_date, 'YYYY') , COUNT(*)
FROM    employees
GROUP BY TO_CHAR(hire_date, 'YYYY')
ORDER BY TO_CHAR(hire_date, 'YYYY');

--2��

--kor_loan_status ���̺��� 2012�⵵ ����, ������ ���� �� �ܾ��� ���ϴ� ������ �ۼ��� ����

SELECT  period, region, SUM(loan_jan_amt) totl_jan
FROM    kor_loan_status
WHERE   period LIKE '2012%'
GROUP BY period, region
ORDER BY period, region;

--3��

--������ ������ ���� ROLLUP�� ������ ������.
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
FROM kor_loan_status
WHERE period LIKE '2013%'
GROUP BY period, ROLLUP(gubun );

--�� ������ ROLLUP�� ������� �ʰ� ���� �����ڷ� ������ ����� �������� ������ �ۼ��� ����
SELECT period, gubun, SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period,  gubun
UNION 
SELECT period,'', SUM(loan_jan_amt) totl_jan
  FROM kor_loan_status
 WHERE period LIKE '2013%' 
 GROUP BY period; 