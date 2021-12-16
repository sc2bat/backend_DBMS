-- 그룹 함수(Group Function) : 지정된 필드의 값 전체를 대상으로 한번 계산하는 함수

-- SUM() : 특정 필드의 합계
-- 대여가격의 합계
SELECT SUM(rentprice) AS "대여가격 합계"	FROM booklist;   --21450

-- 입고가격이 18000원 이상인 책들의 대여가겨 합계
SELECT SUM(rentprice) AS "대여가격 합계" FROM booklist WHERE inprice >= 18000;    -- 2420

-- COUNT(*) : 필드 내의 데이터 갯수(레코드 갯수)
-- 전체 회원수
SELECT COUNT(*) AS "회원인원수" FROM memberlist;   -- 10

-- 사은 포인트가 2000 이상인 회원의 인원수
SELECT COUNT(*) AS "회원인원수" FROM memberlist WHERE bpoint >= 2000;   -- 8


-- AVG : 평균
SELECT ROUND( AVG(inprice), 0 ) FROM booklist;  --14393

-- MAX : 최대값
SELECT MAX(inprice) FROM booklist; -- 21600

-- MIN : 최소값
SELECT MIN(inprice) FROM booklist --  12000

-- VARIANCE(분산), STDDEV(표준편차)
SELECT VARIANCE(salary), STDDEV(salary) FROM EMPLOYEES;
-- VARIANCE(salary) 15284813.66954681713983424440134015164874 
--STDDEV(salary) 3909.579730552481921059198878167256201202


-- GROUP BY : 하나의 필드를 지목해서 같은 값끼리 그룹을 형성한 결과를 도출합니다
-- 전체 대여건수
SELECT COUNT(*) FROM rentlist;  -- 16

-- 각 도서별 대여건수 : 한번도 대여되지 않은 도서 제외
SELECT booknum, COUNT(*) FROM rentlist GROUP BY booknum;
--       6        1
--       2        1
--       5        1
--       8        5
--       7        5
--       3        1
--       9        1
--      10        1

SELECT booknum, COUNT(*) FROM rentlist GROUP BY booknum ORDER BY booknum;

-- rentlist 날짜별 할인금액의 평균
SELECT rentdate, ROUND( AVG(discount), 0) FROM rentlist GROUP BY rentdate ORDER BY rentdate DESC;
-- 2021-12-18 00:00:00.0                    100
-- 2021-12-17 00:00:00.0                    100
-- 2021-12-16 00:00:00.0                    100
-- 2021-12-15 00:00:00.0                    100
-- 2021-12-01 00:00:00.0                     90

-- rentlist 날짜별 대여 건수
SELECT rentdate, COUNT(*) FROM rentlist GROUP BY rentdate ORDER BY rentdate DESC;
-- 2021-12-18 00:00:00.0        2
-- 2021-12-17 00:00:00.0        2
-- 2021-12-16 00:00:00.0        2
-- 2021-12-15 00:00:00.0        2
-- 2021-12-01 00:00:00.0        8

-- EMPLOYEES 테이블의 부서 ID별 급여의 평균
SELECT * FROM EMPLOYEES;
SELECT FLOOR(AVG(salary)) AS "급여평균" FROM EMPLOYEES GROUP BY department_id;
SELECT department_id, FLOOR(AVG(salary)) AS "급여평균" FROM EMPLOYEES GROUP BY department_id;
SELECT department_id, FLOOR(AVG(salary)) AS "급여평균" FROM EMPLOYEES GROUP BY department_id ORDER BY "급여평균";
--  8601
--  4150
--  7000
--  9500
-- 10000
-- 19333
-- 10154
--  3475
--  6500
--  8955
--  4400
--  5760

--            50  3475
--            30  4150
--            10  4400
--            60  5760
--            40  6500
--          NULL  7000
--           100  8601
--            80  8955
--            20  9500
--            70 10000
--           110 10154
--            90 19333

-- kor_loan_status 테이블의 period(년도와 월) 을 그룹으로 대출 잔액 (loan_jan_amt) 의 합계
SELECT * FROM kor_loan_status;

SELECT period, SUM(loan_jan_amt) FROM KOR_LOAN_STATUS GROUP BY period ORDER BY period;
-- 201111         1023154.6
-- 201112         1031611.1
-- 201210         1050281.8
-- 201211         1052078.4
-- 201212         1064041.5
-- 201310         1087493.9
-- 201311         1095358.2

-- period(년도와 월) 을 1차 그룹으로 region(지역) 을 2차 그룹으로 한
-- 대출 잔액(loan_jan_amt) 의 합계
SELECT period, region, SUM(loan_jan_amt) FROM KOR_LOAN_STATUS GROUP BY 	period, region;
--SELECT period, region, SUM(loan_jan_amt) FROM KOR_LOAN_STATUS GROUP BY 	period ORDER BY period, region; ORA-00979: not a GROUP BY expression

-- HAVING 절 : 그룹핑 된 내용들에 조건을 붙일 때
-- 날짜별 할인금액의 평균을 출력합니다. 다만 그 평균 금액이 100 미만인 그룹만 출력

SELECT rentdate AS 날짜, AVG(discount) AS 할인평균 FROM RENTLIST GROUP BY rentdate HAVING AVG(discount) < 180;
-- HAVING AVG(discount) < 180 -- 그룹 안에서 실행된 조건

-- 2021-12-01 00:00:00.0   90
-- 2021-12-18 00:00:00.0  100
-- 2021-12-15 00:00:00.0  100
-- 2021-12-17 00:00:00.0  100
-- 2021-12-16 00:00:00.0  100

SELECT rentdate AS 날짜, AVG(discount) AS 할인평균 FROM RENTLIST GROUP BY rentdate HAVING AVG(discount) < 180 ORDER BY rentdate DESC;
-- 2021-12-18 00:00:00.0  100
-- 2021-12-17 00:00:00.0  100
-- 2021-12-16 00:00:00.0  100
-- 2021-12-15 00:00:00.0  100
-- 2021-12-01 00:00:00.0   90

-- ★★★ GROUP BY 절에는 SELECT 와 FROM 사이에 쓰여진 함수를 제외한 모든 필드를 반드시 써줘야 합니다



