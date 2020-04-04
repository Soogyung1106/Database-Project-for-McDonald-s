
-- 요구사항1-1번 : 전국의 매장별 매출 랭킹 검색 -> 그에 해당하는 점장과 점장 전화번호
SELECT X.STORE_NO,X.TOTAL_INCOME, Y.STAFF_NAME, X.MANAGER_NO, Y.STAFF_PHONE
FROM STORE X, STORE_STAFF Y
WHERE X.MANAGER_NO = Y.STAFF_NO
ORDER BY TOTAL_INCOME DESC;


--(STORE 테이블): 매장에 관한 정보가 저장되어있음
--매장번호, 점장번호, 매장의 누적 총수익,서비스 품질평가

-- 요구사항1-2번 : 전국의 매장별 매출 순위 검색(서비스품질평가점수와 점장번호 같이 출력해서 상관관계 분석) 
SELECT X.STORE_NO,X.TOTAL_INCOME, X.MANAGER_NO, X.SERV_QUAL, Y.STAFF_NAME, Y.STAFF_PHONE
FROM STORE X, STORE_STAFF Y
WHERE X.MANAGER_NO = Y.STAFF_NO
ORDER BY TOTAL_INCOME DESC;



-- 요구사항2번 : 전국에 있는 각 매장 직원의 실적에 따른 랭킹 검색
-- 근무 점수가 높으 사람중에 월급이 낮은 사람들의 월급을 올려준는 것 지시)
SELECT *
FROM STORE_STAFF
ORDER BY WORK_SCORE DESC, SALARY; --근무평가점수가 높은순(내림차순), 월급이 낮은순(오름차순)으로 정렬
--(STORE_STAFF테이블) : 전국에 있는 매장의 모든 직원에 관한 정보 
--매장직원번호, 매장번호, 직급, 직원이름, 월급, 직원번호, 근무평가점수 



--요구사항3번 : 매출 결정 요인 분석(각 매장의 매출 결정 요인들의 값과 총수익들을 출력해냄으로써 상관관계 분석)
SELECT X.MAC_DELIVERY, X.MAC_DRIVE, X.LABOR_COST, X.MFY, Y.TOTAL_INCOME, Y.STORE_NO
FROM PROFIT_FACTOR X, STORE Y
WHERE X.STORE_NO = Y.STORE_NO
ORDER BY Y.TOTAL_INCOME DESC;  -- 보기 편하게 총수익 높은순으로 정렬
-- (PROFIT_FACTOR 테이블) : 매출을 결정할 수 있는 요인들을 선별해서 그에 대한 정보를 나타내는 테이블
-- 매장번호, 맥딜리버리, 맥드라이브, 인건비상승여부, MFY 시스템 도입여부 (본사에서 컨트롤하지 않는 요소들)
--(STORE 테이블): 매장에 관한 정보가 저장되어있음
--매장번호, 점장번호, 매장의 누적 총수익,서비스 품질평가




-- 요구사항 4-1번 : 운영부에서 매장 입지선정을 위한 상권분석 용도 (도, 시, 동, 유동인구, 교통량, 주변시설)
SELECT X.DO, X.SI, X.DONG, X.POPULATION, X.TRAFFIC, Y.SURROUNDINGS
FROM COMMERCIALZONE X, SURROUNDINGS_ZONE Y
WHERE X.DO = Y.DO AND  X.SI = Y.SI AND X.DONG = Y.DONG;



--요구사항 4-2번: A에서 유동인구와 교통량 특정 수치 넘는 등 조건을 가지고 검색할 경우 
SELECT X.DO, X.SI, X.DONG, X.POPULATION, X.TRAFFIC, Y.SURROUNDINGS
FROM COMMERCIALZONE X, SURROUNDINGS_ZONE Y
WHERE X.DO = Y.DO AND  X.SI = Y.SI AND X.DONG = Y.DONG AND X.TRAFFIC > 50 AND 
X.POPULATION > 50 AND (Y.SURROUNDINGS = '현대백화점' OR Y.SURROUNDINGS='CGV')
ORDER BY POPULATION DESC, TRAFFIC DESC; --유동인구와 교통량 높은 순으로 출력


                                                                                                                
--요구사항5-1 : 원하는 매장의 월별 각 메뉴 판매량 검색을 통해 인기메뉴 분석 (판매량을 기준으로 정렬)
select Y.STORE_NO, Y.MENU_NAME, X.SALES,X.SALES_DATE
from DATE_SALES X, STORE_MENU Y
where X.SUPPORT = Y.SUPPORT AND TO_CHAR(SALES_DATE, 'MM') = '12' AND STORE_NO =2
ORDER BY X.SALES DESC;
--(설명) 2번 매장의 12월달 메뉴별 판매량 출력



--요구사항5-2 : 원하는 매장의 연간 각 메뉴 판매량 검색을 통해 인기메뉴 분석 (판매량을 기준으로 정렬)
select Y.STORE_NO, Y.MENU_NAME, X.SALES,X.SALES_DATE
from DATE_SALES X, STORE_MENU Y
where X.SUPPORT = Y.SUPPORT AND TO_CHAR(SALES_DATE, 'YY') = '18' AND STORE_NO =2
ORDER BY X.SALES DESC;

--(설명) 2번 매장의 18년도 

--요구사항5-3 : 원하는 매장의 일간 각 메뉴 판매량 검색을 통해 인기메뉴 분석 (판매량을 기준으로 정렬)

select Y.STORE_NO, Y.MENU_NAME, X.SALES,X.SALES_DATE
from DATE_SALES X, STORE_MENU Y
where X.SUPPORT = Y.SUPPORT AND TO_CHAR(SALES_DATE, 'DD') = '01' AND STORE_NO =2
ORDER BY X.SALES DESC;
--(설명) 2번 매장의 매월 1일 







