SELECT table_name
    FROM user_tables;
    

CREATE TABLE ex2_1 (
    COLUMN1     CHAR(10),
    COLUMN2     VARCHAR2(10),
    COLUMN3     NVARCHAR2(10),
    COLUMN4     NUMBER
);

    
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
    
INSERT INTO ex2_2 VALUES ('È«±æµ¿', 'È«±æµ¿', 'È«±æµ¿');

INSERT INTO ex2_2 (column3) VALUES('È«±æµ¿');

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


CREATE TABLE ex2_4 (
    COL_FLOT1 FLOAT(32),
    COL_FLOT2 FLOAT
);

INSERT INTO ex2_4 (col_flot1, col_flot2) VALUES (1234567891234, 1234567891234);

CREATE TABLE ex2_5 (
    COL_DATE DATE,
    COL_TIMESTAMP TIMESTAMP
);

INSERT INTO ex2_5 VALUES (SYSDATE, SYSTIMESTAMP);

SELECT *
    FROM ex2_5;
    
CREATE TABLE ex2_6 (
    COL_NULL        VARCHAR2(10),
    COL_NOT_NULL    VARCHAR2(10) NOT NULL
);

INSERT INTO ex2_6 VALUES ('AA', '');

INSERT INTO ex2_6 VALUES ('AA','BB');

SELECT constraint_name, constraint_type, table_name, search_condition
    FROM user_constraints
WHERE table_name = 'EX2_6';

CREATE TABLE ex2_7 (
    COL_UNIQUE_NULL     VARCHAR2(10) UNIQUE,
    COL_UNIQUE_NULLL    VARCHAR2(10) UNIQUE NOT NULL,
    COL_UNIQUE          VARCHAR2(10),
    CONSTRAINTS unique_nm1 UNIQUE (COL_UNIQUE)
);

SELECT constraint_name, constraint_type, table_name, search_condition
    FROM user_constraints
WHERE table_name = 'EX2_7';

INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES ('AA', 'AA', 'AA');

INSERT INTO ex2_7 VALUES ('', 'BB', 'BB');

INSERT INTO ex2_7 VALUES ('', 'CC', 'CC');

CREATE TABLE ex2_8 (
    COL1 VARCHAR2(10) PRIMARY KEY,
    COL2 VARCHAR2(10)
);

SELECT constraint_name, constraint_type, table_name, search_condition
    FROM user_constraints
  WHERE table_name = 'EX2_8';

INSERT INTO ex2_8 VALUES ('', 'AA'); --¿À·ù

INSERT INTO ex2_8 VALUES ('AA', 'AA'); 

INSERT INTO ex2_8VALUES ('AA', 'AA'); --¿À·ù

CREATE TABLE ex2_9 (
    num1    NUMBER 
    CONSTRAINTS check1 CHECK ( num1 BETWEEN 1 AND 9),
    gender  VARCHAR2(10)
    CONSTRAINTS check2 CHECK ( gender IN ('MALE', 'FEMALE'))
);

SELECT constraint_name constraint_type, table_name, search_condition
    FROM user_constraints
WHERE table_name = 'EX2_9';

INSERT INTO ex2_9 VALUES (10, 'MAN');

INSERT INTO ex2_9 VALUES (5, 'FEMALE');

CREATE TABLE ex2_10 (
    Col1 VARCHAR2(10) NOT NULL,
    Col2 VARCHAR2(10) NULL,
    Create_date DATE DEFAULT SYSDATE);

INSERT INTO ex2_10 (col1, col2) VALUES ('AA', 'BB');

SELECT *
    FROM ex2_10;
    
DROP TABLE ex2_10;

CREATE TABLE ex2_10 (
    Col1 VARCHAR2(10) NOT NULL,
    Col2 VARCHAR2(10) NULL,
    Create_date DATE DEFAULT SYSDATE);
    
ALTER TABLE ex2_10 RENAME COLUMN Col1 TO Col11;

DESC ex2_10;

ALTER TABLE ex2_10 MODIFY Col2 VARCHAR2(30);

DESC ex2_10;

ALTER TABLE ex2_10 ADD Col3 NUMBER;

DESC ex2_10;

ALTER TABLE ex2_10 DROP COLUMN Col3 ;]

DESC ex2_10;

ALTER TABLE ex2_10 ADD CONSTRAINTS pk_ex2_10 PRIMARY KEY (Col11);

SELECT constraint_name, constraint_type, table_name, search_condition
    FROM user_constraints
WHERE table_name = 'EX2_10';