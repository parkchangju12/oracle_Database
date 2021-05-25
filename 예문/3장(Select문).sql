--1. Select��;

- ����1
select �����ȣ, �����(�÷�) # *�� ��� �÷�
from ������̺� (���)
where �޿�>50000; (����);

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000;

- ����2
order by �÷� : �÷��� ����;

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
ORDER BY employee_id;

- ����3
and �÷� = '����' (�����߰�) # �Ѵ� ��ġ�Ҷ�
����Ŭ�� ����Ʈ�� ��ҹ��ڸ� �����Ͽ� ������ Ʋ���� �����ʹ� ��ȸ���� �ʴ´�.

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
AND job_id = 'IT_PROG'
ORDER BY employee_id;

- ����4
or �÷� = '����' (�����߰�) # ����1 �̰ų� ����2 �϶�

SELECT employee_id, emp_name
FROM employees
WHERE salary > 5000
OR    job_id = 'IT_PROG'
ORDER BY employee_id;

- ����5
���÷��� AS �÷���Ī AS ��������

SELECT  a.employee_id, a.emp_name, a.department_id,
        b.department_name AS dep_name
FROM    employees a,
        departments b
WHERE   a.department_id = b.department_id;