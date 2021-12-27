-- 환경변수 시스템변수에 추가
--C:\Program Files\MySQL\MySQL Server 8.0\bin

-- cmd 실행 command 창에서 운영되는 mysql 프로그램 접속
-- mysql -h localhost -u root -p
-- 비번 입력

-- -h 는 호스트, -u 는 사용자 -p 는 비밀번호 의미
-- mysql 종료는 quit or exit

-- Schema 생성
CREATE SCHEMA scott DEFAULT chracter SET utf8mb4;

-- 사용하려는 스키마로 이동
mysql> use scott;
--Database changed

-- 현재 스키마의 테이블들 보기
mysql> show tables
    -> ;
--+-----------------+
--| Tables_in_scott |
--+-----------------+
--| booklist        |
--| memberlist      |
--| rentlist        |
--+-----------------+
--3 rows in set (0.01 sec)

-- 테이블 구조 보기
mysql> desc booklist;
--+-----------+--------------+------+-----+---------+----------------+
--| Field     | Type         | Null | Key | Default | Extra          |
--+-----------+--------------+------+-----+---------+----------------+
--| num       | int          | NO   | PRI | NULL    | auto_increment |
--| subject   | varchar(100) | NO   |     | NULL    |                |
--| makeyear  | int          | NO   |     | NULL    |                |
--| inprice   | int          | NO   |     | NULL    |                |
--| rentprice | int          | NO   |     | NULL    |                |
--| grade     | varchar(6)   | YES  |     | all     |                |
--+-----------+--------------+------+-----+---------+----------------+
--6 rows in set (0.00 sec)


-- LIMIT
-- SELECT 로 데이터 조회할 때 조회할 레코드의 갯수를 조절 제한할 수 있습니다
SELECT * FROM memberlist ORDER BY num DESC LIMIT 5;
-- 회원 정보 조회하여 5개의 레코드만 리턴

-- OFFSET
-- SELECT 로 데이터 조회할 때, 맨위에서부터 OFFSET 에 지정한 번째까지는 뛰어넘고 그 다음부터 리턴
SELECT * FROM memberlist ORDER BY num DESC LIMIT 3 OFFSET 5;
-- 6번째 데이터부터 3개의 레코드 리턴 - 개수가 모자르면 있는 곳까지 리턴

-- LIMIT 와 OFFSET 의 동시사용
SELECT * FROM memberlist ORDER BY num DESC LIMIT 5 OFFSET 5;
-- 6번째 테이터부터 5개의 레코드 리턴
-- OFFSET 과 LIMIT 는 게시판이나, 상품 진열시에 페이지를 표시하기 위한 용도로 가장 많이 사용됩니다.










