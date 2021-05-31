--ABS(N)
--절대값으로 변환

SELECT ABS(10), ABS(-20), ABS(-11.13413)
FROM DUAL;

--CEIL(N), FLOOR(N)
--올림

SELECT CEIL(10.123), CEIL(10.541), CEIL(13.1)
FROM DUAL;

--내림
SELECT FLOOR(11.98), FLOOR(13.11), FLOOR(-11.95)
FROM DUAL;

--ROUND(N,I), TRUNC(N1,N2)
--반올림
SELECT ROUND(10.154), ROUND(11.578), ROUND(99.49999)
FROM DUAL;

--ROUND(숫자, 반올림자릿수)
SELECT ROUND(163.11,1), ROUND(421.151,2), ROUND(11.7555,3)
FROM DUAL;

SELECT ROUND(163.11,-1), ROUND(421.151,-2), ROUND(11.7555,-3)
FROM DUAL;

--잘라내기
--TRUNC(값, 잘라낼자릿수)
SELECT TRUNC(115.155), TRUNC(115.155,1),TRUNC(115.155,2), TRUNC(115.15,-2)
FROM DUAL;

--제곱
--POWER(숫자, 숫자제곱수)
SELECT POWER(3,2), POWER(3,3), POWER(3,3.0001)
FROM DUAL;
--제곱오류
SELECT POWER(-3, 3.0001)
FROM DUAL;

--N의 제곱근
SELECT SQRT(2), SQRT(5)
FROM DUAL;

--값2를 값1로 나눈값의 나머지
--MOD(값1, 값2)
SELECT MOD(19,4), MOD(19.123, 4.2)
FROM DUAL;

--값2를 값1로 나눈값의 나머지지만 다름
--REMAINDER(값1, 값2)
SELECT REMAINDER(19,4), REMAINDER(19.123, 4.2)
FROM DUAL;

SELECT EXP(2), LN(2.713), LOG(10, 100)
FROM DUAL;


SELECT INITCAP('never say goodbye'), INITCAP('never6say*good가bye')
FROM DUAL;

SELECT LOWER('NEVER SAY GOODBYE'), UPPER('never say goodbye')
FROM DUAL;

SELECT CONCAT('I Have',' A Dream'), 'I Have' || ' A Dream'
FROM DUAL;

SELECT SUBSTR('ABCDEFG', 1, 4), SUBSTR('ABCDEFG',-1,4)
FROM DUAL;

SELECT SUBSTRB('ABCDEFG', 1, 4), SUBSTRB('가나다라마바사', 1, 4)
FROM DUAL;

SELECT  LTRIM('ABCDEFGABC', 'ABC'),
        LTRIM('가나다라','가'),
        LTRIM('ABCDEFGABC', 'ABC'),
        LTRIM('가나다라', '라')
FROM DUAL;

SELECT LTRIM('가나다라', '나'), RTRIM('가나다라', '나')
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

SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?','나','너')
FROM DUAL;

SELECT  LTRIM(' ABC DEF '),
        RTRIM(' ABC DEF '),
        REPLACE(' ABC DEF ',' ','')
FROM DUAL;


SELECT  employee_id,
        TRANSLATE(EMP_NAME, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'thehillsarealivewiththesou')
        AS TRANS_NAME
FROM    employees;

--INSTR(찾는것,시작 번호,찾는것에 번호)
SELECT  INSTR('내가 만약 외로울 때면 내가 만약 괴로운 때며 내가 만약 즐거울때면', '만약') AS INSTR1,
        INSTR('내가 만약 외로운 때면, 내가 만약 괴로운 때면', '만약', 5) AS INSTR2,
        INSTR('내가 만약 외로운 때면, 내가 만약 괴로울 때면, 내가 만약 즐거울 때면', '만약',5,2) AS INSTR3
FROM    DUAL;

SELECT  LENGTH('대한민국'),
        LENGTHB('대한민국')
FROM    DUAL;

--SYSDATE(현재시간 년월일시분초) SYSTIMESTAMP(년월일시분초이후까지)
SELECT SYSDATE, SYSTIMESTAMP
FROM    DUAL;

--ADD_MONTHS(DATE, 변경수) : 월을 바꿔주는것
SELECT ADD_MONTHS(SYSDATE, 1), ADD_MONTHS(SYSDATE, -1)
FROM DUAL;

SELECT  MONTHS_BETWEEN(SYSDATE, ADD_MONTHS(SYSDATE,1)) mon1,
        MONTHS_BETWEEN(ADD_MONTHS(SYSDATE, 1),SYSDATE) mon2
FROM DUAL;

--마지막일 표시
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

--일 반올림 반내림
SELECT SYSDATE,  ROUND(SYSDATE, 'month'), TRUNC(SYSDATE, 'month')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '화요일')
FROM DUAL;

--TO_CHAR(숫자, '변경할 형식')
SELECT TO_CHAR(123456789, '999,99,9999')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD')
FROM DUAL;

--TO_NUMBER형 변환
SELECT TO_NUMBER('123456')
FROM DUAL;

--TO_DATE(날짜 형변환)
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

