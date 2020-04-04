CREATE TABLE STORE
(STORE_NO NUMBER NOT NULL, --�����ȣ(��Ű)
MANAGER_NO NUMBER, -- �����ȣ
TOTAL_INCOME NUMBER NOT NULL,--��S`����
SERV_QUAL NUMBER, --���� ǰ�� ��(5���� ����)
DO CHAR(10), --��
SI CHAR(10), --��
DONG CHAR(10), --��

PRIMARY KEY (STORE_NO)); 


--<��������>  -- �� ������� // ���� �� �Ѵٰ� ����
CREATE TABLE STORE_STAFF
(STAFF_NO NUMBER, --����������ȣ(��Ű)
STORE_NO NUMBER, --�����ȣ(�ܷ�Ű)
STAFF_TITLE CHAR(10), --����(�ܷ�Ű)
STAFF_NAME CHAR(10), --�����̸� 
SALARY NUMBER, --����
STAFF_PHONE CHAR(15), --������ȣ
WORK_SCORE NUMBER, -- �ٹ���

PRIMARY KEY (STAFF_NO), 
FOREIGN KEY(STORE_NO)REFERENCES STORE(STORE_NO),
FOREIGN KEY(STAFF_TITLE)REFERENCES TITLE(TITLE));

--<����μ�>
CREATE TABLE DEPARTMENT
(DEP_NO NUMBER, -- �μ���ȣ(��Ű)
DEP_NAME CHAR(10), -- �μ��̸�
DEP_SCORE NUMBER, --�μ�����

PRIMARY KEY (DEP_NO)); 

--<��������> 
CREATE TABLE EMPLOYEE
(EMP_NO NUMBER, -- ������ȣ(��Ű)
EMP_TITLE CHAR(10),--�����̸�(�ܷ�Ű)
DEP_NO NUMBER, --�μ���ȣ(�ܷ�Ű)
EMP_NAME CHAR(10), --�����̸�
EMP_SALARY NUMBER, --����
EMP_PHONE CHAR(15),--��ȭ��ȣ
WORK_SCORE NUMBER,--�ٹ���

PRIMARY KEY (EMP_NO),
FOREIGN KEY (EMP_TITLE)REFERENCES TITLE(TITLE), --<��������>�� ������ ����
FOREIGN KEY (DEP_NO)REFERENCES DEPARTMENT(DEP_NO)); --<����μ�>�� �μ���ȣ(��Ű)�� ����

--<����>
CREATE TABLE TITLE
(TITLE CHAR(10), --����
PRIMARY KEY (TITLE));

--<�����������>
CREATE TABLE PROFIT_FACTOR
(STORE_NO NUMBER,--�����ȣ(��Ű)
MAC_DELIVERY CHAR(10), --�Ƶ�����������
MAC_DRIVE CHAR(10), --�Ƶ���̺꿩��
LABOR_COST CHAR(10), --�ΰź��¿���
MFY CHAR(10),--MFY����

PRIMARY KEY (STORE_NO));

--<���>
CREATE TABLE COMMERCIALZONE
(DO CHAR(10),--��(����Ű�� Ű1)
SI CHAR(10), --��(����Ű�� Ű2)
DONG CHAR(10),--��(����Ű�� Ű3)
TRAFFIC NUMBER,--���뷮
POPULATION NUMBER,--�����α�

PRIMARY KEY (DO, SI, DONG));

--<�޴�>
CREATE TABLE MENU
(MENU_NO NUMBER,--�޴���ȣ(��Ű)
MENU_NAME CHAR(10), --�޴��̸�
MENU_PRICE NUMBER, --����
SALES NUMBER,--�Ǹŷ�

PRIMARY KEY (MENU_NO));

--<���>
CREATE TABLE MENU_INGREDIENT
(MENU_NO NUMBER, --�޴���ȣ(�ܷ�Ű)
INGR_NAME CHAR(10),--�̸�(�κ�Ű)  
INGR_PRICE NUMBER,--����
QUANTITY NUMBER,--����

FOREIGN KEY (MENU_NO)REFERENCES MENU(MENU_NO),
PRIMARY KEY (MENU_NO, INGR_NAME));

-- <���庰 �޴�> 
CREATE TABLE STORE_MENU
(STORE_NO NUMBER,--�����ȣ(�ܷ�Ű)
MENU_NO NUMBER, --�޴���ȣ(�ܷ�Ű)
NO NUMBER, --�븮Ű(�⺻Ű) : �Ϻη� �߰��� Ű

FOREIGN KEY (STORE_NO) REFERENCES STORE(STORE_NO),
FOREIGN KEY (MENU_NO) REFERENCES MENU(MENU_NO),
PRIMARY KEY (STORE_NO));

--<�븮 ���̺�> : �븮Ű ������ ������ ������� ���̺� 
CREATE TABLE SUPPORT 
(SUPPORT NUMBER, --�븮Ű(�⺻Ű)

PRIMARY KEY (SUPPORT));

--<��¥�� �Ǹŷ�> 
CREATE TABLE DATE_SALES
(SUPPORT NUMBER, --�븮Ű(�⺻Ű)
SALES_DATE DATE, --��¥(�κ�Ű)
SALES NUMBER, --�Ǹŷ�

PRIMARY KEY(SUPPORT, SALES_DATE)); --�⺻Ű : �븮Ű�� ��¥�� �������� �������

--<��Ǻм�>
CREATE TABLE ANALYZE_ZONE
(EMP_NO NUMBER,--������ȣ(�ܷ�Ű)
DO CHAR(10),--��(�ܷ�Ű) -> ��Ű
SI CHAR(10),--��(�ܷ�Ű) -> ��Ű
DONG CHAR(10),--��(�ܷ�Ű) -> ��Ű

PRIMARY KEY(DO,SI, DONG),
FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO),
FOREIGN KEY (DO,SI,DONG) REFERENCES COMMERCIALZONE(DO, SI, DONG)
);

--<����ֺ��ü�>
CREATE TABLE SURROUNDINGS_ZONE
(DO CHAR(10),--��(�ܷ�Ű)
SI CHAR(10),--��(�ܷ�Ű)
DONG CHAR(10),--��(�ܷ�Ű)
SURROUNDINGS CHAR(15),--�ֺ��ü� (��ġ)

FOREIGN KEY(DO, SI, DONG) REFERENCES COMMERCIALZONE(DO, SI, DONG),
PRIMARY KEY(DO,SI,DONG)
);

--<�����ֺ��ü�>
CREATE TABLE SURROUNDINGS_STORE
(STORE_NO NUMBER,--�����ȣ(�ܷ�Ű) -> ����Ű1
SURROUNDING CHAR(15), --�ֺ��ü� -> ����Ű2

PRIMARY KEY(STORE_NO, SURROUNDING), --����Ű : �����ȣ�� �ֺ��ü� �� ���� �⺻Ű ���� 
FOREIGN KEY(STORE_NO) REFERENCES STORE(STORE_NO)
);


INSERT INTO menu_time_test(menu_time) VALUES (TO_DATE('2018-12-01', 'YYYY-MM-DD'));
select * from menu_time_test where TO_CHAR(MENU_TIME, 'MM') = '12';