-- MySQL 의 내장함수

-- 숫자 관련 함수
-- abs(숫자) - 절대값 계산
-- CEIILING(숫자) - 값보다 큰 정수 중 가장 작은 수.
-- FLOOR(숫자) - 값보다 작은 정수 중 가장 큰 수[실수를 무조건 버림(음수일 경우는 제외)]
-- round(숫자, 자리수) - 소수점 자리수만큼 남기고 아래서 반올림
-- truncate(숫자, 자리수) - round 와 같은 동작이지만 반올림이 아닌 버림
-- pow(x, y) - x 의 y 자승
-- mod(x, y) - x를 y 로 나눈 나머지 계산
-- greatest(x, y, z, ...) - 주어진 숫자 중에서 가장 큰 숫자
-- least(x, y, z, ...) - 주어진 숫자 중에서 가장 작은 숫자

SELECT FLOOR(123.1235) FROM dual; -- 123
-- 특정 테이블을 대상으로 하면서 필드값이 함수의 입력값이 아니라면 from 뒤에 dual 을 써서 함수의 결과를 볼 수 있습니다.

SELECT ROUND(12345, 2) FROM dual;
SELECT ROUND(12345.2345, 2) FROM dual; -- 12345.23
SELECT ROUND(12345.9876, 2) FROM dual; -- 12345.99

SELECT TRUNCATE(123.2345, 3) FROM dual;-- 123.234
--
SELECT POW(5, 3) FROM dual; -- 125.0

SELECT MOD(5, 3) FROM dual; -- 2

SELECT GREATEST(1, 2, 3, 4, 5) FROM dual; -- 5
SELECT GREATEST(9, 8, 6, 7, 4, 3, 2, 1) FROM dual; -- 9
SELECT LEAST(1, 2, 3, 4, 5) FROM dual; -- 1
SELECT LEAST(9, 8, 6, 7, 4, 3, 2, 1) FROM dual; -- 1

-- 문자 관련 함수 
-- ASCII(문자) - 해당 문자의 아스키 코드값
SELECT ASCII('A') FROM dual; -- 65
-- CONCAT(문자열1, 문자열2, 문자열3...) - 주어진 문자열들 이어붙이기 연산
SELECT CONCAT('abcd', 'EFG', 'hijk') FROM dual; -- abcdEFGhijk
-- SELECT 'abcd' || 'EFG' || 'hijk' FROM dual;
-- INSERT(문자열, 시작위치, 길이, 바꿀문자열) - 문ㄴ자열의 시작위치부터 길이만큼 바꿀문자열로 대치
SELECT INSERT('나는 버스를 타고 갑니다', 4, 3, '승용차를') FROM dual; -- 나는 승용차를 타고 갑니다
-- REPLACE(문자열, 기본문자열, 바꿀문자열) - 문자열 안에 있는 기본 문자열을 바꿀 문자열로 대치
SELECT REPLACE('나는 버스를 타고 갑니다', '버스', '승용차') FROM dual; -- 나는 승용차를 타고 갑니다
-- INSTR('문자열', '찾는문자열') - 문자열 중 찾는 문자열의 위치값을 출력
SELECT INSTR('나는 버스를 타고 갑니다', '버스') FROM dual; -- 4
-- LEFT('문자열', 개수) - 문자열 중 왼쪽에서 개수만큼을 추출
SELECT LEFT('가나다라마바사아자차카타파하', 5) FROM dual; -- 가나다라마
-- RIGHT('문자열', 개수) - 문자열 중 오른쪽에서 개수만큼을 추출
SELECT RIGHT('가나다라마바사아자차카타파하', 5) FROM dual; -- 차카타파하
-- MID('문자열', 시작위치, 개수) - 문자열 중 시작위치부터 개수만큼 출력
SELECT MID('가나다라 마바사아 자차카', 8, 3) FROM dual; -- [사아 ]
-- SUBSTRING('문자열', 시작위치, 개수) - 문자열 중 시작위치부터 개수만큼 출력
-- LTRIM('문자열') - 문자열 중 왼쪽의 공백을 없앤다.
-- RTRIM('문자열') - 문자열 중 오른쪽의 공백을 없앤다.
-- TRIM('문자열') - 양쪽 모두의 공백을 없앤다.
-- LCASE('문자열') or LOWER('문자열') - 소문자로 바꾼다
-- UCASE('문자열') or UPPER('문자열') - 대문자로 바꾼다
-- REVERSE('문자열') - 문자열을 반대로 나열한다.

-- 집계 함수
-- COUNT(필드명) - NULL 값이 아닌 레코드 수를 구한다
-- COUNT(*) - 모든 레코드 갯수를 구한다
-- SUM(필드명) - 필드명의 합계를 구한다
-- AVG(필드명) - 각각의 그룹 안에서 필드명의 평균을 구한다.
-- MAX(필드명) - 최대값을 구한다
-- MIN(필드명) - 최소값을 구한다

-- 날짜 관련 함수
-- NOW() - 현재 날짜와 시간(datetime 형식)
-- CURDATE() or CURRENT_DATE() - 현재 날짜 (date형식)
-- CURTIME() or CURRENT_TIME() - 현재 날짜 (time형식)
-- DATE_ADD(날짜, INTERVAL 기준값 더할숫자) - 날짜에서 기준값만큼 더한다
-- ※ 기준값 : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
SELECT DATE_ADD(NOW(), INTERVAL 2 day) FROM dual; -- 2021-12-29 10:16:02.0
SELECT DATE_ADD(NOW(), INTERVAL 3 MONTH) FROM dual; --  2022-03-27 10:20:22.0
-- DATE_SUB(날짜, INTERVAL 기준값 뺄숫자) - 날짜에서 기준값 만큼 빼준다
-- ※ 기준값 : YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
SELECT DATE_SUB(NOW(), INTERVAL 1 MONTH) FROM dual; --  2021-11-27 10:17:02.0

-- YEAR(날짜) - 날짜의 연도 출력
-- MONTH(날짜) - 날짜의 월 출력
-- MONTHNAME(날짜) - 날짜의 월을 영어로 출력
-- DAYNAME(날짜) - 날짜의 요일을 영어로 출력
-- DAYOFMONTH(날짜) - 날짜의 월별 일자 출력
-- DAYOFWEEK(날짜) - 날짜의 주별 일자 출력(일요일(1), 월요일(2)... 토요일 (7))
-- WEEKDAY(날짜) - 날짜의 주별 일자 출력(월요일(0), 화요일(1)... 일요일(6))
-- DAYOFYEAR(날짜) - 일년을 기준으로 한 날짜까지의 날 수 
-- WEEK(날짜) - 일년 중 몇 번째 주
-- FROM_DAYS(날짜) - 00년 00월 00일부터 날 수 만큼 경과한 날의 날짜 출력
-- TO_DAYS(날짜) - 00년 00월 00일부터 날짜까지의 일자 수 출력
-- DATE_FORMAT(날짜, '형식') : 날짜를 형식에 맞게 출력

-- 오라클의 TO_CHAR() 날짜 -> 문자
DATE_FORMAT(NOW(), '%Y%m%d')
-- 오라클의 TO_DATE() 문자 -> 날짜
STR_TO_DATE('20211013', '%Y%m%d')

SELECT DATE_FORMAT(NOW(), '%Y%m%d') FROM dual; --  20211227
SELECT STR_TO_DATE('20211227', '%Y%m%d') FROM dual; --  2021-12-27

-- %a 일(Sun ~ Sat)
-- %b 월(Jan ~ Dec)
-- %c 월(0 ~ 12)
-- %D 일(1st, 2nd, 3rd, ...)
-- %d 일(01 ~ 31)
-- %e 일(0 ~ 31)
-- %f Microseconds (000000 to 999999)
-- %H 시간(00 ~ 23)
-- %h 시간(00 ~ 12)
-- %I 시간(00 ~ 12)
-- %i 분(00 ~ 59)
-- %j Day of the year(001 to 366)
-- %k 시간(0 ~ 23)
-- %l 시간(1 ~ 12)
-- %M 월(January ~ December
-- %m 월(00 ~12)
-- %p AM or PM
-- %r 시간(12시)을 hh:mm:ss AM/PM 형식으로
-- %S 초(00 ~ 59)
-- %s 초(00 ~ 59)
-- %T 시간(24시)을 hh:mm:ss 형식으로




