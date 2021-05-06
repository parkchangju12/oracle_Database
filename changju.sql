SELECT table_name
    FROM user_tables;
    

CREATE TABLE ex2_1 (
    COLUMN1     CHAR(10),
    COLUMN2     VARCHAR2(10),null
    COLUMN3     NVARCHAR2(10),
    COLUMN4     NUMBER
);

CREATE TABLE employees (
    EMPLOYEE_ID    NUMBER(6,0)   NOT NULL,
    EMP_NAME      VARCHAR2(80) NOT NULL,
    ...
    SALARY        NUMBER(8,2) ,
    HIRE_DATE     DATE         NOT NULL,
    ...
    ... );
    
    
INSERT INTO ex2_1 (column1, column2) VALUES ('abc', 'abc');

SELECT column1, LENGTH(column1) as len1,
       column2, LENGTH(column2) as len2
    FROM ex2_1;
    
CREATE TABLE ex2_2(
    COLUMN1 VARCHAR2(3),
    COLUMN2 VARCHAR2(3 byte),
    COLUMN3 VARCHAR2(3 char)
);

INSERT INTO ex2_2 VALUES ('abc', 'abc', 'abc');

SELECT column1, LENGTH(column1) AS len1,
       column2, LENGTH(column2) AS len2,
       column3, LENGTH(column3) AS len3
    FROM ex2_2;
    
INSERT INTO ex2_2 VALUES ('ȫ�浿', 'ȫ�浿', 'ȫ�浿');

INSERT INTO ex2_2 (column3) VALUES('ȫ�浿');

SELECT column3, LENGTH(column3) AS len3, LENGTHB(column3) AS bytelen
 FROM ex2_2;
 
 CREATE TABLE ex2_3 (
    COL_INT INTEGER,
    COL_DEC DECIMAL,
    COL_NUM NUMBER
);

SELECT column_id, column_name, data_type, data_length
  FROM user_tab_cols
WHERE table_name = 'EX2_3'
ORDER BY column_id;