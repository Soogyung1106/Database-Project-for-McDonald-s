
-- �䱸����1-1�� : ������ ���庰 ���� ��ŷ �˻� -> �׿� �ش��ϴ� ����� ���� ��ȭ��ȣ
SELECT X.STORE_NO,X.TOTAL_INCOME, Y.STAFF_NAME, X.MANAGER_NO, Y.STAFF_PHONE
FROM STORE X, STORE_STAFF Y
WHERE X.MANAGER_NO = Y.STAFF_NO
ORDER BY TOTAL_INCOME DESC;


--(STORE ���̺�): ���忡 ���� ������ ����Ǿ�����
--�����ȣ, �����ȣ, ������ ���� �Ѽ���,���� ǰ����

-- �䱸����1-2�� : ������ ���庰 ���� ���� �˻�(����ǰ���������� �����ȣ ���� ����ؼ� ������� �м�) 
SELECT X.STORE_NO,X.TOTAL_INCOME, X.MANAGER_NO, X.SERV_QUAL, Y.STAFF_NAME, Y.STAFF_PHONE
FROM STORE X, STORE_STAFF Y
WHERE X.MANAGER_NO = Y.STAFF_NO
ORDER BY TOTAL_INCOME DESC;



-- �䱸����2�� : ������ �ִ� �� ���� ������ ������ ���� ��ŷ �˻�
-- �ٹ� ������ ���� ����߿� ������ ���� ������� ������ �÷��ش� �� ����)
SELECT *
FROM STORE_STAFF
ORDER BY WORK_SCORE DESC, SALARY; --�ٹ��������� ������(��������), ������ ������(��������)���� ����
--(STORE_STAFF���̺�) : ������ �ִ� ������ ��� ������ ���� ���� 
--����������ȣ, �����ȣ, ����, �����̸�, ����, ������ȣ, �ٹ������� 



--�䱸����3�� : ���� ���� ���� �м�(�� ������ ���� ���� ���ε��� ���� �Ѽ��͵��� ����س����ν� ������� �м�)
SELECT X.MAC_DELIVERY, X.MAC_DRIVE, X.LABOR_COST, X.MFY, Y.TOTAL_INCOME, Y.STORE_NO
FROM PROFIT_FACTOR X, STORE Y
WHERE X.STORE_NO = Y.STORE_NO
ORDER BY Y.TOTAL_INCOME DESC;  -- ���� ���ϰ� �Ѽ��� ���������� ����
-- (PROFIT_FACTOR ���̺�) : ������ ������ �� �ִ� ���ε��� �����ؼ� �׿� ���� ������ ��Ÿ���� ���̺�
-- �����ȣ, �Ƶ�������, �Ƶ���̺�, �ΰǺ��¿���, MFY �ý��� ���Կ��� (���翡�� ��Ʈ������ �ʴ� ��ҵ�)
--(STORE ���̺�): ���忡 ���� ������ ����Ǿ�����
--�����ȣ, �����ȣ, ������ ���� �Ѽ���,���� ǰ����




-- �䱸���� 4-1�� : ��ο��� ���� ���������� ���� ��Ǻм� �뵵 (��, ��, ��, �����α�, ���뷮, �ֺ��ü�)
SELECT X.DO, X.SI, X.DONG, X.POPULATION, X.TRAFFIC, Y.SURROUNDINGS
FROM COMMERCIALZONE X, SURROUNDINGS_ZONE Y
WHERE X.DO = Y.DO AND  X.SI = Y.SI AND X.DONG = Y.DONG;



--�䱸���� 4-2��: A���� �����α��� ���뷮 Ư�� ��ġ �Ѵ� �� ������ ������ �˻��� ��� 
SELECT X.DO, X.SI, X.DONG, X.POPULATION, X.TRAFFIC, Y.SURROUNDINGS
FROM COMMERCIALZONE X, SURROUNDINGS_ZONE Y
WHERE X.DO = Y.DO AND  X.SI = Y.SI AND X.DONG = Y.DONG AND X.TRAFFIC > 50 AND 
X.POPULATION > 50 AND (Y.SURROUNDINGS = '�����ȭ��' OR Y.SURROUNDINGS='CGV')
ORDER BY POPULATION DESC, TRAFFIC DESC; --�����α��� ���뷮 ���� ������ ���


                                                                                                                
--�䱸����5-1 : ���ϴ� ������ ���� �� �޴� �Ǹŷ� �˻��� ���� �α�޴� �м� (�Ǹŷ��� �������� ����)
select Y.STORE_NO, Y.MENU_NAME, X.SALES,X.SALES_DATE
from DATE_SALES X, STORE_MENU Y
where X.SUPPORT = Y.SUPPORT AND TO_CHAR(SALES_DATE, 'MM') = '12' AND STORE_NO =2
ORDER BY X.SALES DESC;
--(����) 2�� ������ 12���� �޴��� �Ǹŷ� ���



--�䱸����5-2 : ���ϴ� ������ ���� �� �޴� �Ǹŷ� �˻��� ���� �α�޴� �м� (�Ǹŷ��� �������� ����)
select Y.STORE_NO, Y.MENU_NAME, X.SALES,X.SALES_DATE
from DATE_SALES X, STORE_MENU Y
where X.SUPPORT = Y.SUPPORT AND TO_CHAR(SALES_DATE, 'YY') = '18' AND STORE_NO =2
ORDER BY X.SALES DESC;

--(����) 2�� ������ 18�⵵ 

--�䱸����5-3 : ���ϴ� ������ �ϰ� �� �޴� �Ǹŷ� �˻��� ���� �α�޴� �м� (�Ǹŷ��� �������� ����)

select Y.STORE_NO, Y.MENU_NAME, X.SALES,X.SALES_DATE
from DATE_SALES X, STORE_MENU Y
where X.SUPPORT = Y.SUPPORT AND TO_CHAR(SALES_DATE, 'DD') = '01' AND STORE_NO =2
ORDER BY X.SALES DESC;
--(����) 2�� ������ �ſ� 1�� 







