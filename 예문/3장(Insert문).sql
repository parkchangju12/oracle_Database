2. Insert문

CREATE TABLE ex3_1(
    col1    VARCHAR2(10),
    col2    NUMBER,
    col3    DATE
);

--INSERT INTO 테이블(컬럼1,컬럼2.....)
--VALUES (컬럼값1,컬럼값2,....);

INSERT INTO ex3_1(col1,col2,col3)
VALUES('ABC',10,SYSDATE);

--컬럼순서를 바꾸어도 VALUES절에 값을 바뀐순서와 맞추기만 하면 문제가 없다

INSERT INTO ex3_1(col3,col1,col2)
VALUES(SYSDATE,'DEF',20);

--오류
INSERT INTO ex3_1(col2, col1, col3)
VALUES (SYSDATE,'DEF',20);

--컬럼명 생략가능(단 컬럼의 데이터타입 순서대로 VALUES의 데이터타입을 맞춰줘야함)
INSERT INTO ex3_1
VALUES ('QWE',75,SYSDATE);

INSERT INTO ex3_1(col2,col3)
VALUES (50, SYSDATE);

--오류
INSERT INTO ex3_1
VALUES ('QSX',30);

--INSERT ~ SELECT 형태
--새로운 테이블 생성
CREATE TABLE ex3_2(
    emp_id      NUMBER,
    emp_name    VARCHAR2(100)
);

INSERT INTO ex3_2 (emp_id, emp_name)
SELECT  employee_id, emp_name
FROM    employees
WHERE   salary >5000;

--묵시적형변환: 내부에서 데이터타입을 형변환해주는 것(데이터형식에 맞춰 주는게 제일 좋음)
INSERT INTO ex3_1
VALUES (10,'10','2021-05-25');
