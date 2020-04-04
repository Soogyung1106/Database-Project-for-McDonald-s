-- �����̼� �����ϰ� ���� ��� -> DROP TABLE �����̼��̸�; 
DROP TABLE DEPARTMENT; 
DROP TABLE EMPLOYEE;
-- DEPARTMENT �����̼ǰ� EMPLOYEE �����̼��� ����
CREATE TABLE DEPARTMENT
    (DEPTNO NUMBER  NOT NULL,
     DEPTNAME   CHAR(10),
     FLOOR  NUMBER,
     PRIMARY KEY(DEPTNO));
--�����̼� ���ǿ��� �پ��� ���������� ����غ���     
--��Ʈ����Ʈ �������� : NOT NULL, UNIQUE, DEFAULT, CHECK, PRIMARY KEY, FOREIGN KEY     
CREATE TABLE EMPLOYEE
    (EMPNO  NUMBER  NOT NULL,
     EMPNAME    CHAR(10) UNIQUE,
     TITLE  CHAR(10) DEFAULT '���',
     MANAGER    NUMBER,
     SALARY     NUMBER CHECK (SALARY < 6000000),  
     DNO    NUMBER CHECK (DNO IN (1,2,3,4,5,6)),
--1,2,3,4,5,6 �� �ϳ��� ���� ���࿡ �μ���ȣ �Է����� ������ 1�� ������ ���� �ȴ�.      
     PRIMARY KEY(EMPNO),
     FOREIGN KEY(MANAGER) REFERENCES EMPLOYEE(EMPNO),
     FOREIGN KEY(DNO) REFERENCES DEPARTMENT(DEPTNO)
             ON DELETE CASCADE);
--���� ���� 


