--ABS(N)
--���밪���� ��ȯ

SELECT ABS(10), ABS(-20), ABS(-11.13413)
FROM DUAL;

--CEIL(N), FLOOR(N)
--�ø�

SELECT CEIL(10.123), CEIL(10.541), CEIL(13.1)
FROM DUAL;

--����
SELECT FLOOR(11.98), FLOOR(13.11), FLOOR(-11.95)
FROM DUAL;

--ROUND(N,I), TRUNC(N1,N2)
--�ݿø�
SELECT ROUND(10.154), ROUND(11.578), ROUND(99.49999)
FROM DUAL;

--ROUND(����, �ݿø��ڸ���)
SELECT ROUND(163.11,1), ROUND(421.151,2), ROUND(11.7555,3)
FROM DUAL;

SELECT ROUND(163.11,-1), ROUND(421.151,-2), ROUND(11.7555,-3)
FROM DUAL;

--�߶󳻱�
--TRUNC(��, �߶��ڸ���)
SELECT TRUNC(115.155), TRUNC(115.155,1),TRUNC(115.155,2), TRUNC(115.15,-2)
FROM DUAL;

--����
--POWER(����, ����������)
SELECT POWER(3,2), POWER(3,3), POWER(3,3.0001)
FROM DUAL;
--��������
SELECT POWER(-3, 3.0001)
FROM DUAL;

--N�� ������
SELECT SQRT(2), SQRT(5)
FROM DUAL;

--��2�� ��1�� �������� ������
--MOD(��1, ��2)
SELECT MOD(19,4), MOD(19.123, 4.2)
FROM DUAL;

--��2�� ��1�� �������� ���������� �ٸ�
--REMAINDER(��1, ��2)
SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2)
FROM DUAL;

SELECT EXP(2), LN(2.713), LOG(10, 100)
FROM DUAL;


SELECT INITCAP('never say goodbye'), INITCAP('never6say*good��bye')
FROM DUAL;

SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never say goodbye')
FROM DUAL;

SELECT CONCAT('I Have',' A Dream'), 'I Have' || ' A Dream'
FROM DUAL;

SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG',-1,4)
FROM DUAL;

SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('�����ٶ󸶹ٻ�', 1, 4)
FROM DUAL;

SELECT  LTRIM('ABCDEFGABC', 'ABC'),
        LTRIM('�����ٶ�','��'),
        LTRIM('ABCDEFGABC', 'ABC'),
        LTRIM('�����ٶ�', '��')
FROM DUAL;

SELECT LTRIM('�����ٶ�', '��'), RTRIM('�����ٶ�', '��')
FROM DUAL;

CREATE TABLE ex4_1(
    phone_num VARCHAR2(30));
    
INSERT INTO ex4_1 VALUES('111-1111');

INSERT INTO ex4_1 VALUES('111-2222');

INSERT INTO ex4_1 VALUES('111-3333');

SELECT *
FROM ex4_1;

SELECT LPAD(phone_num, 12, '(02)')
FROM ex4_1;

SELECT REPLACE('���� �ʸ� �𸣴µ� �ʴ� ���� �˰ڴ°�?','��','��')
FROM DUAL;

SELECT  LTRIM(' ABC DEF '),
        RTRIM(' ABC DEF '),
        REPLACE(' ABC DEF ',' ','')
FROM DUAL;


SELECT  employee_id,
        TRANSLATE(EMP_NAME, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'thehillsarealivewiththesou')
        AS TRANS_NAME
FROM    employees;

--INSTR(ã�°�,���� ��ȣ,ã�°Ϳ� ��ȣ)
SELECT  INSTR('���� ���� �ܷο� ���� ���� ���� ���ο� ���� ���� ���� ��ſﶧ��', '����') AS INSTR1,
        INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����', '����', 5) AS INSTR2,
        INSTR('���� ���� �ܷο� ����, ���� ���� ���ο� ����, ���� ���� ��ſ� ����', '����',5,2) AS INSTR3
FROM    DUAL;

SELECT  LENGTH('���ѹα�'),
        LENGTHB('���ѹα�')
FROM    DUAL;

--SYSDATE(����ð� ����Ͻú���) SYSTIMESTAMP(����Ͻú������ı���)
SELECT SYSDATE, SYSTIMESTAMP
FROM    DUAL;

--ADD_MONTHS(DATE, �����) : ���� �ٲ��ִ°�
SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
FROM DUAL;

SELECT  MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE,1)) mon1,
        MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1),SYSDATE) mon2
FROM DUAL;

--�������� ǥ��
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

--�� �ݿø� �ݳ���
SELECT SYSDATE,  ROUND(SYSDATE, 'month'), TRUNC(SYSDATE, 'month')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, 'ȭ����')
FROM DUAL;

--TO_CHAR(����, '������ ����')
SELECT TO_CHAR(123456789, '999,99,9999')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

--TO_NUMBER�� ��ȯ
SELECT TO_NUMBER('123456')
FROM DUAL;

--TO_DATE(��¥ ����ȯ)
SELECT TO_DATE('20210527','YYYY-MM-DD')
FROM DUAL;

SELECT TO_DATE('20210527 12:19:30','YYYY-MM-DDHH24:MI:SS')
FROM DUAL;

SELECT NVL (manager_id, employee_id)
FROM    employees
WHERE   manager_id IS NULL;

SELECT employee_id,
        NVL2(commission_pct, salary +(salary *commission_pct), salary) AS salary2
FROM    employees;

SELECT employee_id, salary, commission_pct,
    COALESCE(salary * commission_pct, salary) AS salary2
FROM employees;

SELECT employee_id, commission_pct
FROM employees
WHERE commission_pct <0.2;

SELECT COUNT(*)
FROM  employees
WHERE  NVL(commission_pct,0) <0.2;

SELECT COUNT(*)
FROM employees
WHERE LNNVL(commission_pct >=0.2);

SELECT employee_id,
TO_CHAR(start_date,'YYYY') start_year,
TO_CHAR(end_date, 'YYYY') end_year,
NULLIF(TO_CHAR(end_date, 'YYYY'), TO_CHAR(start_date, 'YYYY')) nullif_year
FROM job_history;

