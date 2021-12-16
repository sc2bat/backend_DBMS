-- 라이브러리 함수 요약
-- * 오라클 명령어 : 내장 함수

-- [1] 샘플 테이블인 DUAL 테이블
SELECT * FROM TAB;
SELECT * FROM DUAL;

-- DUAL : 테이블이 대상이 아닌 연산을 하려고 할때 FROM 다음에 형식적으로 붙이는 실제로는 없는 테이블의 이름

-- [2] 임시 데이터 출력
SELECT 1234* 1234 FROM DUAL;

-- *** 문자열 처리 관련 함수 ***
-- [3] LOWER() : 모든 문자를 소문자로 변환
SELECT LOWER('Hong Kil Dong') AS "소문자" FROM DUAL;
-- [4] UPPER() : 모든 문자를 대문자로 변환
SELECT UPPER('Hong Kil Dong') AS "대문자"	FROM DUAL;
-- [5] INITCAP() : 첫자만 대문자로 변환
SELECT INITCAP('hong kil dong') AS "첫글자만 대문자" FROM DUAL;

-- 해당 함수는 입력값이 필드명일때 FROM 뒤에 테이블 이름이 쓰여지며, 연산의 대상은 써놓은 필드값들이 됩니다
-- 다만 위와 같이 SELECT 와 FROM 사이에서 필드값이 아닌 일반 데이터를 대상으로 함수가 쓰인다면 
-- FROM 뒤에 DUAL 이 쓰여지게 됩니다
SELECT UPPER(ename) FROM emp;
SELECT LOWER(job) FROM emp;
SELECT INITCAP(job) FROM emp;
-- 함수 연산의 결과는 홤녀에 결과로 보여질 뿐 테이블의 값을 변경하는 것은 아닙니다.

SELECT LOWER('Hong Kil Dong') AS "소문자" FROM emp;
-- 일반데이터 연산에서 from 뒤에 테이블 이름을 쓴다면 결과가 테이블의 레코드 갯수만큼 출력됩니다
SELECT ename, lower('Hong Kil Dong') AS "소문자" FROM emp;

-- [6] CONCAT() : 문자열 연결
SELECT CONCAT('이젠IT', '아카데미') FROM DUAL;
SELECT '이젠IT' || '아카데미' AS 문자열연결 FROM DUAL;

-- [7] LENGTH(): 문자열 길이
SELECT LENGTH('이젠 아이티 아카데미'), LENGTH('The ezen IT') FROM DUAL;
SELECT ename, LENGTH(ename) FROM emp;

-- [8] SUBSTR() : 문자열 추출(데이터, 인덱스(1), 카운트)
SELECT SUBSTR('홍길동 만세', 2, 4) FROM DUAL;
-- SUBSTR 의 경우 자바의 substring 처럼 시작번째부터 끝번째 +1이 아니라
-- 시작 번재부터 글자수를 나타냅니다. 위의 예경우 2번재 글자부터 네글자 표시(공백포함)

-- [9] INSTR() : 문자열 시작 위치
SELECT INSTR('홍길동 만세 동그라미', '동') FROM DUAL; -- 3

-- [10] LPAD(), RPAD() : 자리 채우기
SELECT LPAD('Oracle', 20, '#') FROM DUAL; -- ##############Oracle
SELECT RPAD('Oracle', 20, '*') FROM DUAL; -- Oracle************** 

-- [11] TRIM() : 칼럼이나 대상문자열에서 특정 문자가 첫번째 글자이거나 마지막 글자이면 잘라내고 남은 문자열만 반환
SELECT TRIM('a' FROM 'aaaOracleaaaaaaaa') AS result FROM DUAL; -- Oracle
SELECT TRIM(' ' FROM '   Oracle    ') AS result FROM DUAL;  -- Oracle

-- *** 수식 처리 관련 함수 ***
-- [12] ROUND() : 반올림( 음수: 소수점 이상 자리)
SELECT ROUND(12.3456, 3) FROM DUAL; --  12.346
-- 12.3456 : 반올림하려는 대상 숫자 3: 반올림하여 표시하고자하는 마지막 자리수

-- 3 : 소수점 넷째자리에서 반올림하여 셋째자리까지 남김
-- 2 : 소수점 셋째자리에서 반올림하여 둘째자리까지 남김
-- 1 : 소수점 둘째자리에서 반올림하여 첫째자리까지 남김
-- 0 : 소수점 첫째자리에서 반올림하여 소수점 자리수 없앰
-- -1 : 1의 자리에서 반올림하여 10 자리까지 남김
-- -2 : 10 의 자리에서 반올림하여 100의 자리까지 남
-- -3 : 100의 자리에서 반올림하여 1000의 자리까지 남김

SELECT ROUND(1728.9382, 3) FROM DUAL; -- 1728.938
SELECT ROUND(1728.9382, 2) FROM DUAL; -- 1728.94
SELECT ROUND(1728.9382, 1) FROM DUAL; -- 1728.9
SELECT ROUND(1728.9382, 0) FROM DUAL; -- 1729
SELECT ROUND(1728.9382, -1) FROM DUAL; -- 1730
SELECT ROUND(1728.9382, -2) FROM DUAL; -- 1700
SELECT ROUND(1728.9382, -3) FROM DUAL; -- 2000

-- [13] ABS() : 절대값
SELECT ABS(-10) FROM DUAL; -- 10

-- [14] FLOOR() : 소수점 아래 절사 - 반올림 없음. 
SELECT FLOOR(12.94567) FROM DUAL; --12
-- CEIL() : 소수점 아래에서 올림
SELECT CEIL(12.94567) FROM DUAL; -- 13

-- [15] TRUNC(): 특정 자리 자르기 - 반올림 없음, 3은 남기고 싶은 소수점 아래 자리수
SELECT TRUNC(12.34567, 3) FROM DUAL; -- 12.345
SELECT TRUNC(12.34567, 4) FROM DUAL; -- 12.3456

-- [16] MOD() : 나머지  -- 8 을 5로 나눈 나머지
SELECT MOD(8, 5) FROM DUAL; -- 3

-- ***  날짜 처리 관련 함수 ***
-- [17] SYSDATE : 날짜
SELECT SYSDATE FROM DUAL; -- 2021-12-16 11:42:08.0
-- 오늘 날짜화 현재 시간

-- [18] MONTHS_BETWEEN() : 개월 수 구하기
SELECT FLOOR(MONTHS_BETWEEN('2021-12-31', '2020-07-10')) FROM DUAL; --  17
SELECT TRUNC(MONTHS_BETWEEN('2021-12-31', '2020-07-10'), 5) FROM DUAL; --17.67741
SELECT MONTHS_BETWEEN('2021-12-31', '2020-07-10') FROM DUAL; -- 17.67741935483870967741935483870967741935

-- [19] ADD_MONTHS() : 개월 수 더하기
SELECT ADD_MONTHS(SYSDATE, 200) FROM DUAL; -- 2038-08-16 11:47:41.0

-- [20] NEXT_DAY() : 다가올 요일에 해당하는 날짜 - 오늘 날짜(SYSDATE) 에서 가장 가까운 일요일
SELECT NEXT_DAY(SYSDATE, '일요일') FROM DUAL; --2021-12-19 11:50:56.0

-- [21] LAST_DAY() : 해당 월의 마지막 일 수
SELECT LAST_DAY(SYSDATE) FROM DUAL; -- 2021-12-31 11:51:45.0
SELECT LAST_DAY('2020-02-15') FROM DUAL; -- 2020-02-29 00:00:00.0

-- [22] TO_CHAR() : 날짜형식을 문자열로 반환
SELECT TO_CHAR(SYSDATE, 'yyyy-mm-dd') FROM DUAL; -- 2021-12-16

-- [23] TO_DATE() : 문자형식을 날짜형(DATE) 으로 변환
SELECT TO_DATE('2019/12/31', 'yyyy/mm/dd') FROM DUAL; -- 2019-12-31 00:00:00.0

-- [24] NVL() : NULL 인 데이터를 다른 데이털 변경.
SELECT comm/100 AS comm_pct FROM emp;
-- comm 필드값에 따라서 일부 레코드는 계산결과가 NULL 이 나올 수 있음
SELECT NVL(comm, 1)/100 AS comm_pct FROM emp; 
-- 해당 필드값이 NULL 이면 1로 변경해서 계산에 참여 --  NULL 이면 0.01 출력

-- POWER 함수
SELECT POWER(3, 2), POWER(3, 3), POWER(3, 3.0001) FROM DUAL;
--				 9 				  27				 27.00296641612348063007123449361035089329
-- 첫번째 요소값을 두번째 요소만큼 거듭 제곱

-- 제곱근 SQRT
SELECT SQRT(2), SQRT(5) FROM DUAL;
 -- SQRT(2) 1.41421356237309504880168872420969807857 
 -- SQRT(5) 2.23606797749978969640917366873127623544
--SELECT SQRT(16) FROM DUAL;

SELECT * FROM emp;
-- [25] DECODE() : 자바에서의 switch 의 역할을 하는 함수
SELECT empno, ename, deptno FROM emp;

SELECT empno, ename, deptno, DECODE(deptno, 
	10, 'ACCOUNT',
	20, 'RESEARCH',
	30, 'SALES',
	40, 'OPERATIONS',
	50, 'SH_CLECK',
	60, 'IT_PROG',
	70, 'PR_REP',
	80, 'SA_REP',
	90, 'AD_PRES',
	100, 'FI_ACCOUNT',
	110, 'AC_ACCOUNT'
) AS 부서명 FROM emp;

--  7369 SMITH      20 RESEARCH
--  7499 ALLEN      30 SALES
--  7521 WARD       30 SALES
--  7566 JONES      20 RESEARCH
--  7654 MARTIN     30 SALES
--  7698 BLAKE      30 SALES
--  7782 CLARK      10 ACCOUNT
--  7788 SCOTT      20 RESEARCH
--  7839 KING       10 ACCOUNT
--  7844 TURNER     30 SALES
--  7876 ADAMS      20 RESEARCH
--  7900 JAMES      30 SALES
--  7902 FORD       20 RESEARCH
--  7934 MILLER     10 ACCOUNT


SELECT * FROM EMPLOYEES;

SELECT employee_id, emp_name, department_id, DECODE(department_id,
	10, 'ACCOUNT',
	20, 'RESEARCH',
	30, 'SALES',
	40, 'OPERATIONS',
	50, 'SH_CLECK',
	60, 'IT_PROG',
	70, 'PR_REP',
	80, 'SA_REP',
	90, 'AD_PRES',
	100, 'FI_ACCOUNT',
	110, 'AC_ACCOUNT'
) AS "부서명" FROM EMPLOYEES;



-- [26] CASE() : if ~ else if ~ 와 비슷한 구조
SELECT employee_id, emp_name, department_id,
			CASE WHEN department_id = 10 THEN 'ACCOUNT'
				 WHEN department_id = 20 THEN 'RESEARCH'
				 WHEN department_id = 30 THEN 'SALES'
				 WHEN department_id = 40 THEN 'OPERATIONS'
				 WHEN department_id = 50 THEN 'SH_CLECK'
				 WHEN department_id = 60 THEN 'IT_PROG'
				 WHEN department_id = 70 THEN 'PR_REP'
				 WHEN department_id = 80 THEN 'SA_REP'
				 WHEN department_id = 90 THEN 'AD_PRES'
				 WHEN department_id = 100 THEN 'FI_ACCOUNT'
				 WHEN department_id = 110 THEN 'AC_ACCOUNT'
			END AS "부서명" FROM EMPLOYEES;

-- MOD 와 REMAINDER
-- 둘다 첫번째 요소를 두번째 요소로 나눈 나머지를 계산하지만 내부적 계산방법이 조금 다름
SELECT MOD(19, 4), MOD(19.123, 4.2) FROM DUAL; -- 3 -- 2.323
SELECT REMAINDER(19, 4), REMAINDER(19.123, 4.2) FROM DUAL; -- -1 -- -1.877
-- MOD : 19 - 4 * FLOOR(19/4)
-- REMAINDER : 19 - 4 * ROUND(19/4)

-- 10.5 FMF 4.2 로 나눈 나머지 : 10.5 - (4.2 * 2) = 2.1

-- 문자 함수 REPLACE
SELECT REPLACE('나는 너를 모르는데 너는 나를 알겠는가?', '나', '너') FROM DUAL; -- 너는 너를 모르는데 너는 너를 알겠는가?

-- REPLACE(문자열1, 문자열2, 문자열3)
-- 문자열1 내에 있는 글자 중에 문자열2 를 찾아서 문자열 3으로 대체

SELECT REPLACE(' ABC DEF ', ' ', '') FROM DUAL; -- ABCDEF

-- 변환함수
SELECT TO_CHAR(123456789, '999,999,999') FROM DUAL; -- 숫자 -> 문자  123,456,789
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL; -- 날짜 -> 문자 2021-12-16
SELECT TO_NUMBER('123456') FROM DUAL; -- 문자 -> 숫자    123456
SELECT TO_DATE('20140101', 'YYYY-MM-DD') FROM DUAL; -- 문자 -> 날짜(년월일 자동인식) 2014-01-01 00:00:00.0
SELECT TO_DATE('20140101 13:44:50', 'YYYY-MM-DD HH24:MI:SS') FROM DUAL; -- 2014-01-01 13:44:50.0

-- 'AM' or 'PM' 오전 오후 표시 -> TO_CHAR(SYSDATE, 'AM')
SELECT TO_CHAR(SYSDATE, 'AM') FROM DUAL; -- YYYY -> 년도 표시  -- 오후
SELECT TO_CHAR(SYSDATE, 'YY"년"') FROM DUAL; --  -> 21년
SELECT TO_CHAR(SYSDATE, 'Y"년"') FROM DUAL; -- -> 1년
-- month, mon -> 월 표시
SELECT TO_CHAR(SYSDATE, 'MONTH') FROM DUAL; -- -> 10월  --  12월
SELECT TO_CHAR(SYSDATE, 'MON') FROM DUAL; -- -> 10월  --  12월

-- D 요일 1~7 로 표시
SELECT TO_CHAR(SYSDATE,'D') FROM DUAL; --> 5 (목요일에 해당하는 3) DD 의 날짜와 다름
SELECT TO_CHAR(SYSDATE,'DAY') FROM DUAL; --> 목요일
-- DD 일자를 01~31 로 표시
SELECT TO_CHAR(SYSDATE,'DD') FROM DUAL; --> 16
-- DDD 일자를 001~365 형태로 표시 
SELECT TO_CHAR(SYSDATE,'DDD') FROM DUAL; -->  350
-- DL 오늘 날짜를 요일까지 표시
SELECT TO_CHAR(SYSDATE,'DL') FROM DUAL; -->  2021년 12월 16일 목요일
-- WW : 주를 01~53 주 형태로 표시
-- HH, HH12 : 시간을 01~12 시로
-- HH24 : 시간을 01~23 시로 표시
-- MI : 분을 01~59 형태로 표시
SELECT TO_CHAR(SYSDATE, 'MI"분"') FROM DUAL; -->  14분
-- SS : 초를 01~59 형태로 표시
SELECT TO_CHAR(SYSDATE, 'HH24"시 "MI"분 "SS"초 "') FROM DUAL; -->  14시 15분 13초 


