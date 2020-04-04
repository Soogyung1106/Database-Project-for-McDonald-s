-- SELECT���� FROM���� �ʼ����� ��, �������� ���� ����

--���� : ��ü �μ��� ��� ��Ʈ����� �˻��϶�.
SELECT * 
FROM DEPARTMENT;

--���� : ��� �μ��� �μ���ȣ�� �μ��̸��� �˻��϶�.
SELECT DEPTNO,DEPTNAME
FROM DEPARTMENT;

-- <������ ������ �˻�> -> DISTINCT
--���� : ��� ������� ������ �˻��϶� (�������� ����)
SELECT TITLE
FROM EMPLOYEE;
-- ���� : ��� ������� ������ ������ �˻��϶�. (�������� ����)
SELECT DISTINCT TITLE
FROM EMPLOYEE;

-- <Ư���� ���õ��� �˻�>
-- ���� : (2�� �μ�)�� �ٹ��ϴ� (���)�鿡 ���� (��� ����)�� �˻��϶�.
-- (�Ƿ��� �� �������� ����)
SELECT *
FROM EMPLOYEE
WHERE DNO=2;

-- SELECT�� �Ƿ���, �������� �� �����ִ� ����  

-- <���ڿ� ��> -> LIKE '��%'
-- ���� : (�̾� ��)�� ���� (���)���� (�̸�, ����, �Ҽ� �μ���ȣ)�� �˻��϶�.
SELECT EMPNAME, TITLE, DNO 
FROM  EMPLOYEE
WHERE EMPNAME LIKE '��%';

-- <�ټ��� �˻� ����> -> '�����ڵ��� �켱����' �����ؾ�!
-- �� ������ -> NOT -> AND -> OR   
--���� : (������ ����)�̸鼭 (1�� �μ�)���� �ٹ��ϴ� (���)���� (�̸��� �޿�)�� �˻��϶�.
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '����' AND DNO = 1;

--<���� �˻� ����> -> DNO <> 1
--���� : (������ ����)�̸鼭 (1�� �μ��� ������ ���� ���)���� (�̸��� �޿�)�� �˻��϶�.
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '����' AND DNO <> 1;

--<������ ����� �˻�> -> BETWEEN 3000000 AND 4500000
-- BETWEEN�� ��谪 ����
--���� : (�޿��� 3000000�� �̻��̰�, 4500000�� ����)�� (���)���� (�̸�, ����, �޿�)�� �˻��϶�.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 4500000;

-- �Ʒ� ���ǿ� ������
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000 AND SALARY <= 4500000;

-- <����Ʈ�� ����� �˻�> -> IN (1, 3)
--���� : (1�� �μ��� 3�� �μ�)�� �Ҽӵ� (���)�鿡 ���� (��� ����)�� �˻��϶�.
SELECT *
FROM EMPLOYEE
WHERE DNO IN (1, 3);

-- <SELECT������ ��� ������(+, -, *, /)���>
--�����ͺ��̽��� ���� ����Ǵ� ���� �ƴ�
--���� : (������ ����)�� (���)�鿡 ���Ͽ� (�̸��� ������ �޿�, �޿��� 10% �λ���� ���� ��)�� �˻��϶�.
-- UPSALARY = SALATY * 1.1 ��� ���ο� ��Ʈ����Ʈ �����ϴ� ����!
SELECT EMPNAME, SALARY, SALARY * 1.1 AS UPSALARY
FROM EMPLOYEE
WHERE TITLE = '����';

-- EMPLOYEE �����̼ǿ� ���� ��� ���� ���  
SELECT * FROM EMPLOYEE; 

--<�� ��>
-- �� ���� 'DNO = NULL' ó���񱳿����� ���X -> DNO IS NULL
SELECT EMPNO, EMPNAME
FROM EMPLOYEE
WHERE MANAGER IS NULL;

--<ORDER BY��> -> ORDER BY DNO, SALARY DESC
--1. DESC �� ������ �⺻������ ������������ ����
--2. ���� ������ ������ ���� �� ������, �켱������ '���� ����' ����
--3. DESC�� ORDER BY ù ��° ���� ���ؿ� �������� �ְ�, �� ��° ���ı��ؿ� �������� �ִ�.
--���� : (2�� �μ�)�� �ٹ��ϴ� (���)���� (�޿�, ����, �̸�)�� �˻��Ͽ� (�޿��� ��������)���� �����Ͽ���.
SELECT SALARY, TITLE, EMPNAME
FROM EMPLOYEE
WHERE DNO = 2
ORDER BY SALARY;

--ORDER BY DNO, SALARY DESC �����ϱ�
-- : DNO ������������ ���� ���� �����ϰ�,  �� ���¿��� DESC ������������ 2�� ����
SELECT SALARY, DNO, EMPNAME
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC;

-- ORDER BY DNO DESC, SALARY �����ϱ�
-- : DNO ������������ ���� 1�� ����, 2���� SALARY ������������ ����
SELECT SALARY, DNO, EMPNAME
FROM EMPLOYEE
ORDER BY DNO DESC, SALARY;

-- <���� �Լ�> -> COUNT, SUM, AVG, MAX, MIN
--1. '[���� ���õ鿡 ����������] ������� [�ϳ��� ���ϰ��� ��ȯ]��Ű�� �Լ�'�� �Ͽ� �����Լ���� ������
--2. ���� �Լ� 5�� ��� ���ϰ� ��ȯ�ϴ� �Լ��� 
--3. SELCECT���� HAVING������ �� �� ����

-- ���� : (���) (���)���� (��� �޿�)�� (�ִ� �޿�)�� �˻��ض�.
SELECT AVG(SALARY) AS AVG_SAL, MAX(SALARY) AS MAX_SAL 
FROM EMPLOYEE;
--���� : ���ÿ� �����Լ� ����� ��� AS�� ��Ī �����ֱ�
-- ������ ��Ī�� �̸����� �ϴ� ��Ʈ����Ʈ�� ������

-- <�׷�ȭ> -> GROUP BY
-- ������ ��Ʈ����Ʈ ���� ���� �ִ� �ͳ��� ���õ��� ������ ���ĵ�

--(���̵� ��)
--���� : (���) (���)�鿡 ���ؼ� ������� ���� (�μ���ȣ���� �׷�ȭ)�ϰ�, (�� �μ����� �μ���ȣ, ��� �޿�, �ִ� �޿�)�� �˻��϶�.
SELECT DNO, AVG(SALARY) AS AVG_SAL, MAX(SALARY) AS MAX_SAL
FROM EMPLOYEE
GROUP BY DNO;
--��� �����̼� �ؼ� : SELECT���� ���� �Լ��� ���Ǹ� �ϴ� ��� �����̼��� Ʃ�� �ϳ��� ��µ�! �� �׷츶�� �ϳ��� ���� ���� ��Ʈ����Ʈ�� ����� �� ����.
--�׷��� DNO�������� �׷�ȭ�� �� �׷�ȭ �� �͵鿡 ���� �Լ� �ۿ��� -> ���� �� ���� ��µǼ� �� 3�� ��µ� 

--<HAVING��>
-- ���� ����� ��Ÿ�� �׷���� �����ϴ� ������ ��� 

--(���̵� ��)
--���� : (���) (���)�鿡 ���ؼ� ������� ���� (�μ���ȣ���� �׷�ȭ)�ϰ�, (��� �޿��� 2500000�� �̻�)�� �μ��� ���ؼ�
--(�μ���ȣ, ��� �޿�, �ִ� �޿�)�� �˻��϶�.
SELECT DNO, AVG(SALARY) AS AVG_SAL, MAX(SALARY) AS MAX_SAL
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) >= 2500000; 

--<��� ����!>
--������ ���Ǿ� : CREATE, DROP, ALTER (CDA)
--������ ���۾� : INSERT, DELETE, UPDATE (IDU)

--<���� ����>
--��, ������ ȣȯ���� ������ ��. -> ���� ������ �ϰ� ������
--UNION(������), UNION ALL, INTERSECT(������), MINUS(������)

--(���̵� ��)
--���� : (��â���� ���� �μ�)�̰ų� (���� �μ��� �μ���ȣ)�� �˻��϶�.
--EMPLOYEE �����̼ǿ��� ��â���� ���� �μ��� '�μ���ȣ'�� �ǹ� -> �׷��� ������ UNION�� ������ ��(������ ȣȯ�� ����)
(SELECT DNO
FROM EMPLOYEE
WHERE EMPNAME = '��â��')
UNION
(SELECT DEPTNO
FROM DEPARTMENT
WHERE DEPTNAME = '����');

--<����> -> D.DEPTNO = E.DNO
--PDF 2�忡�� ��� ��������, �ڿ����� ���ø���
--[�������ǰ� ����Ǵ� ����] 
--1. ���� ������ �����ϴ� ���õ��� ã��,
--2. �� ���õ�κ��� SELECT���� ��õ� ��Ʈ����Ʈ�鸸 ������Ʈ
--���� ���Ǹ� �ߴٴ� HINT : D.DEPTNO = E.DNO

--���� : (���) (���)�� (�̸�)�� �� ����� ���� (�μ� �̸�)�� �˻��϶�.
--���� �ľ� : '����� �̸�'�� EMPLOYEE �����̼ǿ��� �����ϰ�, '�μ� �̸�'�� DEPARTMENT �����̼ǿ��� �����ϴ� ��Ʈ����Ʈ
--�� �����̼��� �������ִ� ��Ʈ����Ʈ�� �μ���ȣ(D.DEPTNO = E.DNO) 
SELECT EMPNAME, DEPTNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO;
--<?> ������ ���� -> PDF��� AS ������ �� ���� �ߴ��� �𸣰���

--<��ü ����> -> EMPLOYEE E, EMPLOYEE M 
--�� �����̼� �ȿ��� �����ϴ� �� 
--��ǥ�� �� : �����鳢�� �� �ȿ��� ��簡 ���� ��Ī�Ǿ� �ִ� ���
--Ư���� : �� �����̼��� �����Ǵ� ��ó�� �ϱ� ���� �� �����̼ǿ� ���ؼ� ��Ī 2�� ���ؾ�!

--(���̵� ��)
--���� : (���) (���)�� ���ؼ� ����� (�̸�)�� (���� ����� �̸�)�� �˻��϶�.
SELECT E.EMPNAME, M.EMPNAME
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.EMPNO;

--<���ΰ� ORDER BY>
--���� : ��� ����� ���ؼ� (�Ҽ� �μ��̸�, ����� �̸�, ����, �޿�)�� �˻��϶�. 
--�μ� �̸��� ���ؼ� ��������, �μ��̸��� ���� ��쿡�� SALARY�� ���ؼ� ������������ �����϶�.
SELECT DEPTNAME, EMPNAME, TITLE, SALARY 
FROM DEPARTMENT D, EMPLOYEE E
WHERE D.DEPTNO = E.DNO
ORDER BY DEPTNAME, SALARY DESC;

--<��ø ����> -> 
--'�ܺ�����'
--WHERE�� �ȿ� �ٽ� SELECT-FROM-WHERE �������� �ִ� ���

--<�� ���� ��Į���� ��ȯ�Ǵ� ���>
--���� : (�ڿ��ǰ� ���� ����)�� ���� (��� ������� �̸��� ����)�� �˻��϶�.
SELCET EMPNAME, TITLE
FROM EMPLOYEE
WHERE TITLE = 
    (SELECT TITLE
     FROM EMPLOYEE
     WHERE EMPNAME = '�ڿ���');
--TITLE�� '�ڿ���' ��Į�� �� ���� ��ȯ��


--<�� ���� ��Ʈ����Ʈ�� �̷���� �����̼��� ��ȯ�Ǵ� ���>

--(���̵� �߻�)
-- ���� : �����γ� ���ߺο� �ٹ��ϴ� ������� �̸��� �˻��϶�.
SELECT EMPNAME
WHERE EMPLOYEE
FROM DNO IN
    (SELECT DEPTNO
     WHERE DEPARTMENT
     FROM DEPTNAME = '����' OR DEPTNAME = '����');

--��ø ���ǰ� �ƴ� ���� ���� ���

--���� ��Ʈ����Ʈ��� �̷���� �����̼��� ��ȯ�Ǵ� ���































