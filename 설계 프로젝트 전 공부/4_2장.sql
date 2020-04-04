-- SELECT절과 FROM절만 필수적인 절, 나머지는 선택 사항

--질의 : 전체 부서의 모든 애트뷰들을 검색하라.
SELECT * 
FROM DEPARTMENT;

--질의 : 모든 부서의 부서번호와 부서이름을 검색하라.
SELECT DEPTNO,DEPTNAME
FROM DEPARTMENT;

-- <상이한 값들을 검색> -> DISTINCT
--질의 : 모든 사원들의 직급을 검색하라 (프로젝션 적용)
SELECT TITLE
FROM EMPLOYEE;
-- 질의 : 모든 사원들의 상이한 직급을 검색하라. (프로젝션 적용)
SELECT DISTINCT TITLE
FROM EMPLOYEE;

-- <특정한 투플들의 검색>
-- 질의 : (2번 부서)에 근무하는 (사원)들에 관한 (모든 정보)를 검색하라.
-- (실렉션 후 프로젝션 적용)
SELECT *
FROM EMPLOYEE
WHERE DNO=2;

-- SELECT는 실렉션, 프로젝션 다 섞여있는 개념  

-- <문자열 비교> -> LIKE '이%'
-- 질의 : (이씨 성)을 가진 (사원)들의 (이름, 직급, 소속 부서번호)를 검색하라.
SELECT EMPNAME, TITLE, DNO 
FROM  EMPLOYEE
WHERE EMPNAME LIKE '이%';

-- <다수의 검색 조건> -> '연산자들의 우선순위' 생각해야!
-- 비교 연산자 -> NOT -> AND -> OR   
--질의 : (직급이 과장)이면서 (1번 부서)에서 근무하는 (사원)들의 (이름과 급여)를 검색하라.
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '과장' AND DNO = 1;

--<부정 검색 조건> -> DNO <> 1
--질의 : (직급이 과장)이면서 (1번 부서에 속하지 않은 사원)들의 (이름과 급여)를 검색하라.
SELECT EMPNAME, SALARY
FROM EMPLOYEE
WHERE TITLE = '과장' AND DNO <> 1;

--<범위를 사용한 검색> -> BETWEEN 3000000 AND 4500000
-- BETWEEN은 경계값 포함
--질의 : (급여가 3000000원 이상이고, 4500000원 이하)인 (사원)들의 (이름, 직급, 급여)를 검색하라.
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE SALARY BETWEEN 3000000 AND 4500000;

-- 아래 질의와 동일함
SELECT EMPNAME, TITLE, SALARY
FROM EMPLOYEE
WHERE SALARY >= 3000000 AND SALARY <= 4500000;

-- <리스트를 사용한 검색> -> IN (1, 3)
--질의 : (1번 부서나 3번 부서)에 소속된 (사원)들에 관한 (모든 정보)를 검색하라.
SELECT *
FROM EMPLOYEE
WHERE DNO IN (1, 3);

-- <SELECT절에서 산술 연산자(+, -, *, /)사용>
--데이터베이스의 값이 변경되는 것은 아님
--질의 : (직급이 과장)인 (사원)들에 대하여 (이름과 현재의 급여, 급여가 10% 인상됐을 때의 값)을 검색하라.
-- UPSALARY = SALATY * 1.1 라는 새로운 애트리뷰트 생성하는 것임!
SELECT EMPNAME, SALARY, SALARY * 1.1 AS UPSALARY
FROM EMPLOYEE
WHERE TITLE = '과장';

-- EMPLOYEE 릴레이션에 대한 모든 정보 출력  
SELECT * FROM EMPLOYEE; 

--<널 값>
-- 널 값은 'DNO = NULL' 처럼비교연산자 사용X -> DNO IS NULL
SELECT EMPNO, EMPNAME
FROM EMPLOYEE
WHERE MANAGER IS NULL;

--<ORDER BY절> -> ORDER BY DNO, SALARY DESC
--1. DESC 안 붙히면 기본적으로 오름차순으로 정렬
--2. 정렬 기준을 여러개 정할 수 있지만, 우선순위는 '먼저 적은' 순서
--3. DESC를 ORDER BY 첫 번째 정렬 기준에 붙힐수도 있고, 두 번째 정렬기준에 붙힐수도 있다.
--질의 : (2번 부서)에 근무하는 (사원)들의 (급여, 직급, 이름)을 검색하여 (급여의 오름차순)으로 정렬하여라.
SELECT SALARY, TITLE, EMPNAME
FROM EMPLOYEE
WHERE DNO = 2
ORDER BY SALARY;

--ORDER BY DNO, SALARY DESC 이해하기
-- : DNO 오름차순으로 먼저 투플 정렬하고,  그 상태에서 DESC 내림차순으로 2차 정렬
SELECT SALARY, DNO, EMPNAME
FROM EMPLOYEE
ORDER BY DNO, SALARY DESC;

-- ORDER BY DNO DESC, SALARY 이해하기
-- : DNO 내림차순으로 먼저 1차 정렬, 2차로 SALARY 오름차순으로 정렬
SELECT SALARY, DNO, EMPNAME
FROM EMPLOYEE
ORDER BY DNO DESC, SALARY;

-- <집단 함수> -> COUNT, SUM, AVG, MAX, MIN
--1. '[여러 투플들에 집단적으로] 적용시켜 [하나의 단일값을 반환]시키는 함수'라 하여 집단함수라고 일컬음
--2. 집단 함수 5개 모두 단일값 반환하는 함수임 
--3. SELCECT절과 HAVING절에만 쓸 수 있음

-- 질의 : (모든) (사원)들의 (평균 급여)와 (최대 급여)를 검색해라.
SELECT AVG(SALARY) AS AVG_SAL, MAX(SALARY) AS MAX_SAL 
FROM EMPLOYEE;
--주의 : 투플에 집단함수 사용할 경우 AS로 별칭 정해주기
-- 붙혀준 별칭을 이름으로 하는 애트리뷰트가 생성됨

-- <그룹화> -> GROUP BY
-- 동일한 애트리뷰트 값을 갖고 있는 것끼리 투플들이 묶여서 정렬됨

--(난이도 상)
--질의 : (모든) (사원)들에 대해서 사원들이 속한 (부서번호별로 그룹화)하고, (각 부서마다 부서번호, 평균 급여, 최대 급여)를 검색하라.
SELECT DNO, AVG(SALARY) AS AVG_SAL, MAX(SALARY) AS MAX_SAL
FROM EMPLOYEE
GROUP BY DNO;
--결과 릴레이션 해석 : SELECT절에 집단 함수가 사용되면 일단 결과 릴레이션은 튜플 하나만 출력됨! 각 그룹마다 하나의 값을 갖는 애트리뷰트를 사용할 수 있음.
--그래서 DNO기준으로 그룹화한 후 그룹화 된 것들에 집단 함수 작용함 -> 투플 한 개씩 출력되서 총 3개 출력됨 

--<HAVING절>
-- 질의 결과에 나타날 그룹들을 선정하는 조건을 명시 

--(난이도 상)
--질의 : (모든) (사원)들에 대해서 사원들이 속한 (부서번호별로 그룹화)하고, (평균 급여가 2500000원 이상)인 부서에 대해서
--(부서번호, 평균 급여, 최대 급여)를 검색하라.
SELECT DNO, AVG(SALARY) AS AVG_SAL, MAX(SALARY) AS MAX_SAL
FROM EMPLOYEE
GROUP BY DNO
HAVING AVG(SALARY) >= 2500000; 

--<잠깐 정리!>
--데이터 정의어 : CREATE, DROP, ALTER (CDA)
--데이터 조작어 : INSERT, DELETE, UPDATE (IDU)

--<집합 연산>
--단, 합집합 호환성을 가져야 함. -> 집합 연산을 하고 싶으면
--UNION(합집합), UNION ALL, INTERSECT(교집합), MINUS(차집합)

--(난이도 상)
--질의 : (김창섭이 속한 부서)이거나 (개발 부서의 부서번호)를 검색하라.
--EMPLOYEE 릴레이션에서 김창섭이 속한 부서는 '부서번호'를 의미 -> 그래서 합집합 UNION이 가능한 것(합집합 호환의 조건)
(SELECT DNO
FROM EMPLOYEE
WHERE EMPNAME = '김창섭')
UNION
(SELECT DEPTNO
FROM DEPARTMENT
WHERE DEPTNAME = '개발');

--<조인> -> D.DEPTNO = E.DNO
--PDF 2장에서 배운 동등조인, 자연조인 떠올리기
--[조인질의가 수행되는 과정] 
--1. 조인 조건을 만족하는 투플들을 찾고,
--2. 이 투플들로부터 SELECT절에 명시된 애트리뷰트들만 프로젝트
--조인 질의를 했다는 HINT : D.DEPTNO = E.DNO

--질의 : (모든) (사원)의 (이름)과 이 사원이 속한 (부서 이름)을 검색하라.
--문제 파악 : '사원의 이름'은 EMPLOYEE 릴레이션에만 존재하고, '부서 이름'은 DEPARTMENT 릴레이션에만 존재하는 애트리뷰트
--두 릴레이션을 연결해주는 애트리뷰트는 부서번호(D.DEPTNO = E.DNO) 
SELECT EMPNAME, DEPTNAME
FROM EMPLOYEE E, DEPARTMENT D
WHERE E.DNO = D.DEPTNO;
--<?> 교수님 질문 -> PDF대로 AS 붙히면 왜 오류 뜨는지 모르겠음

--<자체 조인> -> EMPLOYEE E, EMPLOYEE M 
--한 릴레이션 안에서 조인하는 것 
--대표적 예 : 직원들끼리 그 안에서 상사가 서로 매칭되어 있는 경우
--특이점 : 두 릴레이션이 참조되는 것처럼 하기 위해 한 릴레이션에 대해서 별칭 2개 정해야!

--(난이도 상)
--질의 : (모든) (사원)에 대해서 사원의 (이름)과 (직속 상사의 이름)을 검색하라.
SELECT E.EMPNAME, M.EMPNAME
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER = M.EMPNO;

--<조인과 ORDER BY>
--질의 : 모든 사원에 대해서 (소속 부서이름, 사원의 이름, 직급, 급여)를 검색하라. 
--부서 이름에 대해서 오름차순, 부서이름이 같은 경우에는 SALARY에 대해서 내림차순으로 정렬하라.
SELECT DEPTNAME, EMPNAME, TITLE, SALARY 
FROM DEPARTMENT D, EMPLOYEE E
WHERE D.DEPTNO = E.DNO
ORDER BY DEPTNAME, SALARY DESC;

--<중첩 질의> -> 
--'외부질의'
--WHERE절 안에 다시 SELECT-FROM-WHERE 이중으로 있는 경우

--<한 개의 스칼라값이 반환되는 경우>
--질의 : (박영권과 같은 직급)을 갖는 (모든 사원들의 이름과 직급)을 검색하라.
SELCET EMPNAME, TITLE
FROM EMPLOYEE
WHERE TITLE = 
    (SELECT TITLE
     FROM EMPLOYEE
     WHERE EMPNAME = '박영권');
--TITLE에 '박영권' 스칼라값 한 개가 반환됨


--<한 개의 애트리뷰트로 이루어진 릴레이션이 반환되는 경우>

--(난이도 중상)
-- 질의 : 영업부나 개발부에 근무하는 사원들의 이름을 검색하라.
SELECT EMPNAME
WHERE EMPLOYEE
FROM DNO IN
    (SELECT DEPTNO
     WHERE DEPARTMENT
     FROM DEPTNAME = '영업' OR DEPTNAME = '개발');

--중첩 질의가 아닌 조인 질의 사용

--여러 애트리뷰트들로 이루어진 릴레이션이 반환되는 경우































