--테이블 초기화
DROP TABLE ANALYZE_ZONE;
DROP TABLE COMMERCIALZONE;
DROP TABLE DATE_SALES;
DROP TABLE DEPARTMENT;
DROP TABLE EMPLOYEE;
DROP TABLE MENU;
DROP TABLE MENU_INGREDIENT;
DROP TABLE PROFIT_FACTOR;
DROP TABLE STORE;
DROP TABLE STORE_MENU;
DROP TABLE STORE_STAFF;
DROP TABLE SUPPORT;
DROP TABLE SURROUNDINGS_STORE;
DROP TABLE SURROUNDINGS_ZONE;
DROP TABLE TITLE;

CREATE TABLE STORE
(STORE_NO INT NOT NULL, --매장번호(주키), UNIQUE줘야
MANAGER_NO INT UNIQUE, -- 점장번호, UNIQUE줘야
TOTAL_INCOME NUMBER NOT NULL,--총수익
SERV_QUAL NUMBER, --서비스 품질 평가(5가지 기준)
DO VARCHAR(50), --도
SI VARCHAR(50), --시
DONG VARCHAR(50), --동

PRIMARY KEY (STORE_NO)); 


INSERT INTO STORE VALUES(1, 10, 700000, 50, '경기도', '부천시', '중1동');
INSERT INTO STORE VALUES(2, 25, 7100, 40, '경기도', '부천시', '중1동');
INSERT INTO STORE VALUES(3, 40, 300, 90, '경기도', '부천시', '상동');
INSERT INTO STORE VALUES(4, 55, 500, 100, '서울', '서울시', '목동');
INSERT INTO STORE VALUES(5, 70, 200, 10, '경기도', '수원시', '정자동');
INSERT INTO STORE VALUES(6, 85, 30000, 70, '경기도', '안양시', '비산1동');
INSERT INTO STORE VALUES(7, 100, 7100, 70, '경기도', '안양시', '비산2동');
INSERT INTO STORE VALUES(8, 115, 308000, 20, '경기도', '시흥시', '정왕2동');
INSERT INTO STORE VALUES(9, 130, 30000, 30, '경기도', '시흥시', '정왕3동');
INSERT INTO STORE VALUES(10, 145, 5000, 40, '경기도', '시흥시', '정왕4동');

SELECT * FROM STORE;



--<매장직원> 
CREATE TABLE STORE_STAFF
(STAFF_NO INT, --매장직원번호(주키)
STORE_NO INT, --매장번호(외래키)
STAFF_TITLE VARCHAR(50), --직급(외래키)
STAFF_NAME VARCHAR(50), --직원이름 
SALARY NUMBER, --월급
STAFF_PHONE VARCHAR(50), --직원번호
WORK_SCORE NUMBER, -- 근무평가

PRIMARY KEY (STAFF_NO), 
FOREIGN KEY(STORE_NO)REFERENCES STORE(STORE_NO),
FOREIGN KEY(STAFF_TITLE)REFERENCES TITLE(TITLE));

-- 매장직원(매장1~매장10).sql 문서에 인서트문 따로 정리
SELECT * FROM STORE_STAFF;

--//데이터 타입 수정하고 싶을 경우 : ALTER TABLE STORE_STAFF MODIFY (STAFF_TITLE VARCHAR2(50)); 

--<본사부서>
CREATE TABLE DEPARTMENT
(DEP_NO INT, -- 부서번호(주키)
DEP_NAME VARCHAR(50), -- 부서이름
DEP_SCORE NUMBER, --부서실적

PRIMARY KEY (DEP_NO)); 

INSERT INTO DEPARTMENT VALUES(1, '운영부', 60);
INSERT INTO DEPARTMENT VALUES(2, '개발부', 50); 
INSERT INTO DEPARTMENT VALUES(3, '기획부', 80);
INSERT INTO DEPARTMENT VALUES(4, '마케팅부', 80); 
INSERT INTO DEPARTMENT VALUES(5, '인사부', 70);
INSERT INTO DEPARTMENT VALUES(6, '회계부', 95);
INSERT INTO DEPARTMENT VALUES(7, '교육부', 80);
INSERT INTO DEPARTMENT VALUES(8, '경영부', 80);


SELECT * FROM DEPARTMENT;


--<본사직원> 
CREATE TABLE EMPLOYEE
(EMP_NO INT, -- 직원번호(주키)
EMP_TITLE VARCHAR(50),--직급이름(외래키)
DEP_NO INT, --부서번호(외래키)
EMP_NAME VARCHAR(50), --직원이름
EMP_SALARY NUMBER, --월급
EMP_PHONE VARCHAR(50),--전화번호
WORK_SCORE NUMBER,--근무평가

PRIMARY KEY (EMP_NO),
FOREIGN KEY (EMP_TITLE)REFERENCES TITLE(TITLE), --<본사직원>의 직급을 참조
FOREIGN KEY (DEP_NO)REFERENCES DEPARTMENT(DEP_NO)); --<본사부서>의 부서번호(주키)를 참조


INSERT INTO EMPLOYEE VALUES(1,'팀장', 1, '정인수', 2500000, '010-9032-3040', 90);
INSERT INTO EMPLOYEE VALUES(2, '과장', 1, '강인수', 2500000, '010-9032-3041', 80);
INSERT INTO EMPLOYEE VALUES(3,'부장', 1, '강인숙', 300000, '010-9032-3042', 90);
INSERT INTO EMPLOYEE VALUES(4,'대리', 1, '선혜란', 3000000, '010-9032-3043', 80);
INSERT INTO EMPLOYEE VALUES(5,'팀장', 2, '선혜경', 2500000, '010-9032-3044', 30);
INSERT INTO EMPLOYEE VALUES(6, '과장', 2, '신용순',2500000, '010-9032-3045', 40);
INSERT INTO EMPLOYEE VALUES(7,'부장', 2, '정인철', 2500000, '010-9032-3046', 50);
INSERT INTO EMPLOYEE VALUES(8,'대리', 2, '정연우', 2500000, '010-9032-3047', 60);
INSERT INTO EMPLOYEE VALUES(9,'팀장', 3, '선의현', 2500000, '010-9032-3048', 80);
INSERT INTO EMPLOYEE VALUES(10, '과장',3, '선영원', 2500000, '010-9032-1049',70);
INSERT INTO EMPLOYEE VALUES(11,'부장', 3, '정흥조', 2500000, '010-9032-2040', 35);
INSERT INTO EMPLOYEE VALUES(12,'대리', 3, '정흥북', 2500000, '010-9032-3340', 25);
INSERT INTO EMPLOYEE VALUES(13,'팀장', 4, '선의원', 2500000, '010-9032-4040', 15);
INSERT INTO EMPLOYEE VALUES(14, '과장', 4, '빛나라', 2500000, '010-9032-5040', 8);
INSERT INTO EMPLOYEE VALUES(15,'부장', 4, '송대한', 2500000, '010-9032-6040', 79);
INSERT INTO EMPLOYEE VALUES(16,'대리', 4, '송민국', 2500000, '010-9032-7040', 81);
INSERT INTO EMPLOYEE VALUES(17,'팀장', 5, '송만세', 2500000, '010-9032-8040', 82);
INSERT INTO EMPLOYEE VALUES(18, '과장', 5, '정민국', 2500000, '010-9032-9040', 89);
INSERT INTO EMPLOYEE VALUES(19,'부장', 5, '정만세', 2500000, '010-9031-3040', 76);
INSERT INTO EMPLOYEE VALUES(20,'대리', 5, '정대한', 2500000, '010-9022-3040', 49);
INSERT INTO EMPLOYEE VALUES(21,'팀장', 6, '정인숙', 2500000, '010-9033-3040', 69);
INSERT INTO EMPLOYEE VALUES(22, '과장', 6, '정인선', 2500000, '010-9034-3040', 80);
INSERT INTO EMPLOYEE VALUES(23,'부장', 6, '박근혜', 2500000, '010-9035-3040', 69);
INSERT INTO EMPLOYEE VALUES(24,'대리', 6, '박예린', 2500000, '010-9036-3040', 90);
INSERT INTO EMPLOYEE VALUES(25,'팀장', 7, '박철범', 2500000, '010-9037-3040', 98);
INSERT INTO EMPLOYEE VALUES(26, '과장', 7, '정도이', 2500000, '010-9038-3040', 100);
INSERT INTO EMPLOYEE VALUES(27,'부장', 7, '정도익', 2500000, '010-9039-3040', 100);
INSERT INTO EMPLOYEE VALUES(28,'대리', 7, '김예지', 2500000, '010-9030-3040', 90);
INSERT INTO EMPLOYEE VALUES(29,'OC', 8, '이주원', 40000000, '010-1032-3040', 28);
INSERT INTO EMPLOYEE VALUES(30,'OM', 8, '이주한', 5500000, '010-2032-3040', 59);
INSERT INTO EMPLOYEE VALUES(31,'DO', 8, '정도일', 5500000, '010-3032-3040', 79);
INSERT INTO EMPLOYEE VALUES(32,'DO', 8, '정도삼', 800000, '010-4032-3040', 38);
-- 중간관리계층 : OC 1명(6~7명), OM 1명(30~35명), DO 2명(2명) -> 경영부

SELECT * FROM EMPLOYEE;

--<직급> : 본사 + 매장 
CREATE TABLE TITLE
(TITLE VARCHAR(50), --직급
PRIMARY KEY (TITLE));

INSERT INTO TITLE VALUES('크루');
INSERT INTO TITLE VALUES('메인터넌스');
INSERT INTO TITLE VALUES('호스테스');
INSERT INTO TITLE VALUES('라이더');
INSERT INTO TITLE VALUES('크루트레이너');
INSERT INTO TITLE VALUES('라이더트레이너');
INSERT INTO TITLE VALUES('스윙');
INSERT INTO TITLE VALUES('트레이니');
INSERT INTO TITLE VALUES('2nd');
INSERT INTO TITLE VALUES('1st');
INSERT INTO TITLE VALUES('RM');
INSERT INTO TITLE VALUES('팀장');
INSERT INTO TITLE VALUES('과장');
INSERT INTO TITLE VALUES('부장');
INSERT INTO TITLE VALUES('대리');
INSERT INTO TITLE VALUES('OC');
INSERT INTO TITLE VALUES('OM');
INSERT INTO TITLE VALUES('DO');


SELECT * FROM TITLE;

--ALTER TABLE TITLE MODIFY (TITLE VARCHAR2(50));
--TITLE과 NEW TITLE 열 삭제하기


--<매출결정요인>
CREATE TABLE PROFIT_FACTOR
(STORE_NO INT,--매장번호(주키, 외래키)
MAC_DELIVERY VARCHAR(50), --맥딜리버리여부
MAC_DRIVE VARCHAR(50), --맥드라이브여부
LABOR_COST VARCHAR(50), --인거비상승여부
MFY VARCHAR(50),--MFY여부
               
PRIMARY KEY (STORE_NO),
FOREIGN KEY(STORE_NO)REFERENCES STORE(STORE_NO));

-- 외래키 조건 추가한 뒤에 밑에 인서트문 다시 돌려봐야
--ALTER TABLE PROFIT_FACTOR ADD FOREIGN KEY(STORE_NO) REFERENCES STORE(STORE_NO);

INSERT INTO PROFIT_FACTOR VALUES(1,'O', 'O', 'O', 'O');
INSERT INTO PROFIT_FACTOR VALUES(2,'O', 'X', 'X', 'O');
INSERT INTO PROFIT_FACTOR VALUES(3,'X', 'O', 'O', 'O');
INSERT INTO PROFIT_FACTOR VALUES(4,'O', 'O', 'O', 'O');
INSERT INTO PROFIT_FACTOR VALUES(5,'O', 'X', 'O', 'X');
INSERT INTO PROFIT_FACTOR VALUES(6,'O', 'O', 'O', 'X');
INSERT INTO PROFIT_FACTOR VALUES(7,'O', 'O', 'X', 'X');
INSERT INTO PROFIT_FACTOR VALUES(8,'X', 'X', 'O', 'O');
INSERT INTO PROFIT_FACTOR VALUES(9,'X', 'O', 'O', 'O');
INSERT INTO PROFIT_FACTOR VALUES(10,'X', 'O', 'X', 'O');

SELECT * FROM PROFIT_FACTOR;

--<상권> : 운영부에서 분석할 상권
CREATE TABLE COMMERCIALZONE
(DO VARCHAR(50),--도(복합키의 키1)
SI VARCHAR(50), --시(복합키의 키2)
DONG VARCHAR(50),--동(복합키의 키3)
TRAFFIC NUMBER,--교통량
POPULATION NUMBER,--유동인구

PRIMARY KEY (DO, SI, DONG));

INSERT INTO COMMERCIALZONE VALUES('경기도', '부천시', '중1동', 80, 90);
INSERT INTO COMMERCIALZONE VALUES('경기도', '부천시', '중2동', 60, 40);
INSERT INTO COMMERCIALZONE VALUES('경기도', '부천시', '상동', 70, 80);
INSERT INTO COMMERCIALZONE VALUES('서울', '서울시', '목동', 60, 70);
INSERT INTO COMMERCIALZONE VALUES('경기도', '수원시', '정자동', 80, 50);
INSERT INTO COMMERCIALZONE VALUES('경기도', '안양시', '비산1동', 79, 50);
INSERT INTO COMMERCIALZONE VALUES('경기도', '안양시', '비산2동', 89, 59);
INSERT INTO COMMERCIALZONE VALUES('경기도', '시흥시', '정왕2동', 90, 100);
INSERT INTO COMMERCIALZONE VALUES('경기도', '시흥시', '정왕3동', 60, 70);
INSERT INTO COMMERCIALZONE VALUES('경기도', '시흥시', '정왕4동', 90, 80);

SELECT * FROM COMMERCIALZONE;

--<메뉴>
CREATE TABLE MENU
(
MENU_NAME CHAR(50), --메뉴이름(주키)
MENU_PRICE NUMBER, --가격
SALES INT,-- 총 누적 판매량 : 인기 메뉴 검색 목적 

PRIMARY KEY (MENU_NAME));

INSERT INTO MENU VALUES('빅맥', 4700, 40);
INSERT INTO MENU VALUES('맥스파이시 상하이버거', 4700, 30);
INSERT INTO MENU VALUES('불고기 버거', 2300, 20);
INSERT INTO MENU VALUES('치즈버거', 2700, 10);
INSERT INTO MENU VALUES('치킨버거', 2300, 60);
INSERT INTO MENU VALUES('맥더블', 3900, 30);
INSERT INTO MENU VALUES('베이컨 토마토 디럭스버거', 5300, 10);
INSERT INTO MENU VALUES('토마토 치즈버거', 2300, 10);
INSERT INTO MENU VALUES('맥스파이시 케이준버거', 3500, 8); --NEW
INSERT INTO MENU VALUES('행운버거', 4300, 3); --NEW

SELECT * FROM MENU;

--<재료>
CREATE TABLE MENU_INGREDIENT
(MENU_NAME CHAR(50), --메뉴이름(외래키)
INGR_NAME VARCHAR(50),--이름(부분키)  
INGR_PRICE NUMBER,--가격
QUANTITY NUMBER,--수량

FOREIGN KEY (MENU_NAME)REFERENCES MENU(MENU_NAME),
PRIMARY KEY (MENU_NAME, INGR_NAME));


-- <매장별 메뉴> 
CREATE TABLE STORE_MENU
(SUPPORT INT, --대리키(기본키, 외래키) : 일부러 추가한 키  
MENU_NAME CHAR(50), --메뉴이름(외래키)
STORE_NO INT,--매장번호(외래키)

FOREIGN KEY (STORE_NO) REFERENCES STORE(STORE_NO),
FOREIGN KEY (MENU_NAME) REFERENCES MENU(MENU_NAME),
FOREIGN KEY (SUPPORT) REFERENCES SUPPORT(SUPPORT),
PRIMARY KEY (SUPPORT)); 

-- 인서트문 STORE_MENU.sql문에 작성함

SELECT * FROM STORE_MENU;

--<대리 테이블> : 대리키 때문에 억지로 만들어진 테이블 
CREATE TABLE SUPPORT 
(SUPPORT INT, --대리키(기본키)

PRIMARY KEY (SUPPORT));

-- 대리키 INSERT문은 SUPPROT.sql에 따로 작성함
SELECT * FROM SUPPORT;

--<날짜별 판매량> 
CREATE TABLE DATE_SALES
(SUPPORT INT, --대리키(기본키)
SALES_DATE DATE, --날짜(부분키) : 년, 월, 일
SALES INT, --판매량

PRIMARY KEY(SUPPORT, SALES_DATE)); --기본키 : 대리키랑 날짜가 합쳐져서 만들어짐

--인서트문 DATE_SALE.sql에 작성함

SELECT * FROM DATE_SALES;

--<상권분석>
CREATE TABLE ANALYZE_ZONE
(EMP_NO INT,--직원번호(외래키)
DO VARCHAR(50),--도(외래키) -> 주키
SI VARCHAR(50),--시(외래키) -> 주키
DONG VARCHAR(50),--동(외래키) -> 주키

PRIMARY KEY(DO,SI, DONG),
FOREIGN KEY(EMP_NO)REFERENCES EMPLOYEE(EMP_NO),
FOREIGN KEY (DO,SI,DONG) REFERENCES COMMERCIALZONE(DO, SI, DONG)
);

INSERT INTO ANALYZE_ZONE VALUES(1, '경기도', '부천시', '중1동');
INSERT INTO ANALYZE_ZONE VALUES(1, '경기도', '부천시', '중2동');
INSERT INTO ANALYZE_ZONE VALUES(1, '경기도', '부천시', '상동');
INSERT INTO ANALYZE_ZONE VALUES(2, '서울', '서울시', '목동');
INSERT INTO ANALYZE_ZONE VALUES(2, '경기도', '수원시', '정자동');
INSERT INTO ANALYZE_ZONE VALUES(2, '경기도', '안양시', '비산1동');
INSERT INTO ANALYZE_ZONE VALUES(3, '경기도', '안양시', '비산2동');
INSERT INTO ANALYZE_ZONE VALUES(3, '경기도', '시흥시', '정왕2동');
INSERT INTO ANALYZE_ZONE VALUES(4, '경기도', '시흥시', '정왕3동');
INSERT INTO ANALYZE_ZONE VALUES(4, '경기도', '시흥시', '정왕4동');



SELECT * FROM ANALYZE_ZONE;

--<상권주변시설>
CREATE TABLE SURROUNDINGS_ZONE
(DO VARCHAR(50),--도(외래키, 복합키1)
SI VARCHAR(50),--시(외래키, 복합키2)
DONG VARCHAR(50),--동(외래키, 복합키3)
SURROUNDINGS VARCHAR(50),--주변시설(복합키4): 다치여서 쪼개

FOREIGN KEY(DO, SI, DONG) REFERENCES COMMERCIALZONE(DO, SI, DONG),
PRIMARY KEY(DO,SI,DONG, SURROUNDINGS)
);


INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '부천시', '중1동', '부천시청역');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '부천시', '중1동', '현대백화점');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '부천시', '중1동', '이마트');

INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '부천시', '중2동', '홈플러스');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '부천시', '중2동', '스타벅스');

INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '부천시', '상동', '상동역');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '부천시', '상동', '롯데백화점');

INSERT INTO SURROUNDINGS_ZONE VALUES('서울', '서울시', '목동', '현대백화점');
INSERT INTO SURROUNDINGS_ZONE VALUES('서울', '서울시', '목동', '목동역');
INSERT INTO SURROUNDINGS_ZONE VALUES('서울', '서울시', '목동', '오목교역');

INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '수원시', '정자동', '쇼핑몰');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '안양시', '비산1동', '쇼핑몰');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '안양시', '비산1동', '스타벅스');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '안양시', '비산1동', '롯데리아');

INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '안양시', '비산2동', '롯데리아');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '안양시', '비산2동', '스타벅스');

INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '시흥시', '정왕2동', '정왕역');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '시흥시', '정왕2동', 'CGV');

INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '시흥시', '정왕3동', '시흥중앙공원');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '시흥시', '정왕3동', '쇼핑몰');

INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '시흥시', '정왕4동', '롯데리아');
INSERT INTO SURROUNDINGS_ZONE VALUES('경기도', '시흥시', '정왕4동', '투썸플레이스');

SELECT * FROM SURROUNDINGS_ZONE;

--<매장주변시설>
CREATE TABLE SURROUNDINGS_STORE
(STORE_NO INT,--매장번호(외래키) -> 복합키1
SURROUNDING VARCHAR(50), --주변시설 -> 복합키2

PRIMARY KEY(STORE_NO, SURROUNDING), --복합키 : 매장번호와 주변시설 두 개가 기본키 만듬 
FOREIGN KEY(STORE_NO) REFERENCES STORE(STORE_NO)
);

INSERT INTO SURROUNDINGS_STORE VALUES(1, '롯데리아');
INSERT INTO SURROUNDINGS_STORE VALUES(1, '롯데백화점');
INSERT INTO SURROUNDINGS_STORE VALUES(1, '롯데월드');

INSERT INTO SURROUNDINGS_STORE VALUES(2, '현대백화점');
INSERT INTO SURROUNDINGS_STORE VALUES(2, 'CGV');
INSERT INTO SURROUNDINGS_STORE VALUES(2, '메가박스');

INSERT INTO SURROUNDINGS_STORE VALUES(3, '까페베네');
INSERT INTO SURROUNDINGS_STORE VALUES(3, '엔젤리너스');

INSERT INTO SURROUNDINGS_STORE VALUES(4, '롯데리아');
INSERT INTO SURROUNDINGS_STORE VALUES(4, 'CGV');

INSERT INTO SURROUNDINGS_STORE VALUES(5, '메가박스');

INSERT INTO SURROUNDINGS_STORE VALUES(6, '현대백화점');
INSERT INTO SURROUNDINGS_STORE VALUES(6, '병원');
INSERT INTO SURROUNDINGS_STORE VALUES(6, '롯데리아');

INSERT INTO SURROUNDINGS_STORE VALUES(7, 'CGV');

INSERT INTO SURROUNDINGS_STORE VALUES(8, 'CGV');
INSERT INTO SURROUNDINGS_STORE VALUES(8, '롯데리아');
INSERT INTO SURROUNDINGS_STORE VALUES(8, '메가박스');

INSERT INTO SURROUNDINGS_STORE VALUES(9, '병원');
INSERT INTO SURROUNDINGS_STORE VALUES(10, '현대백화점');

SELECT * FROM SURROUNDINGS_STORE;

--요구사항3번 : 매출 결정 요인 검색 
SELECT X.MAC_DELIVERY, X.MAC_DRIVE, X.LABOR_COST, X.MFY, Y.TOTAL_INCOME, Y.STORE_NO
FROM PROFIT_FACTOR X, STORE Y
WHERE X.STORE_NO = Y.STORE_NO;

--요구사항5 : 원하는 매장의 연간 인기 판매 메뉴 분석 (판매량을 기준으로 정렬)

select Y.STORE_NO, Y.MENU_NAME, X.SALES,X.SALES_DATE
from DATE_SALES X, STORE_MENU Y
where X.SUPPORT = Y.SUPPORT AND TO_CHAR(SALES_DATE, 'YY') = '12' AND STORE_NO =2
ORDER BY X.SALES DESC;

