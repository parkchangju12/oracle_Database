2. Insert��

CREATE TABLE ex3_1(
    col1    VARCHAR2(10),
    col2    NUMBER,
    col3    DATE
);

--INSERT INTO ���̺�(�÷�1,�÷�2.....)
--VALUES (�÷���1,�÷���2,....);

INSERT INTO ex3_1(col1,col2,col3)
VALUES('ABC',10,SYSDATE);

--�÷������� �ٲپ VALUES���� ���� �ٲ������ ���߱⸸ �ϸ� ������ ����

INSERT INTO ex3_1(col3,col1,col2)
VALUES(SYSDATE,'DEF',20);

--����
INSERT INTO ex3_1(col2, col1, col3)
VALUES (SYSDATE,'DEF',20);

--�÷��� ��������(�� �÷��� ������Ÿ�� ������� VALUES�� ������Ÿ���� ���������)
INSERT INTO ex3_1
VALUES ('QWE',75,SYSDATE);

INSERT INTO ex3_1(col2,col3)
VALUES (50, SYSDATE);

--����
INSERT INTO ex3_1
VALUES ('QSX',30);

--INSERT ~ SELECT ����
--���ο� ���̺� ����
CREATE TABLE ex3_2(
    emp_id      NUMBER,
    emp_name    VARCHAR2(100)
);

INSERT INTO ex3_2 (emp_id, emp_name)
SELECT  employee_id, emp_name
FROM    employees
WHERE   salary >5000;

--����������ȯ: ���ο��� ������Ÿ���� ����ȯ���ִ� ��(���������Ŀ� ���� �ִ°� ���� ����)
INSERT INTO ex3_1
VALUES (10,'10','2021-05-25');
