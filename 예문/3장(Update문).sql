--3. Update ��

--���̺� Ȯ��
SELECT *
FROM EX3_1;

--Update �÷��� ������ �������ִ� �Լ�
UPDATE  ex3_1
SET     col2 = 50;

--where�� �� ������ ������ �����ش�
--''�� ���� �ٸ� DBMS�� IS NULL�� �ν�
UPDATE  ex3_1
SET     col3 = SYSDATE
WHERE   col3 = '';

--�� ���̺� ������ ����Ŭ�� IS NULL�� �Է�������Ѵ�.
UPDATE  ex3_1
SET     col1 = 'PCJ'
WHERE   col1 IS NULL;

