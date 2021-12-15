-- 오라클 명령어 : SELECT 문(검색)
-- [1] scott 사용자가 관리하고 있는 테이블 목록
SELECT * FROM tab; -- 단순 검색
SELECT * FROM tabs; -- 상세 검색

-- [2] 특정 테이블의 구조조회 ( 필드 리스트/ 데이터 형식)
DESC dept; -- 커맨드 창(sqlplus) 에서 확인요망
DESC memberlist; --  커맨드 창(sqlplus) 에서 확인요망
DESC rentlist;

--SQL> desc rentlist
-- Name                                      Null?    Type
-- ----------------------------------------- -------- ----------------------------
-- RENTDATE                                           DATE
-- NUM                                       NOT NULL NUMBER(5)
-- BOOKNUM                                   NOT NULL NUMBER(5)
-- MEMBERNUM                                 NOT NULL NUMBER(5)
-- DISCOUNT                                           NUMBER(4)
--
--SQL> desc booklist;
-- Name                                      Null?    Type
-- ----------------------------------------- -------- ----------------------------
-- NUM                                       NOT NULL NUMBER(5)
-- SUBJECT                                   NOT NULL VARCHAR2(500)
-- MAKEYEAR                                           NUMBER(4)
-- INPRICE                                            NUMBER(6)
-- RENTPRICE                                          NUMBER(6)
-- GRADE                                              VARCHAR2(15)

-- SELECT : select 와 from 사이에 조회하고자 하는 필드명들을, 로 구분하여 지목
-- select booknum, subject, outprice from....
-- 모든 필드를 한번에 지목하려면 * 을 써줍니다 -- SELECT * FROM
-- FROM 뒤에는 대상 테이블 명을 써줍니다.
-- WHERE 절을 붙여서 조건에 맞는 행만 골라내기도 합니다.
-- SELECT... FROM... WHERE
SELECT subject FROM booklist;
SELECT subject, makeyear FROM booklist;
SELECT * FROM booklist;


-- 아래와 같이 연산식을 써서 연산된 결과를 필드로 조회하고자 할땐 AS 와 함께 만들어진 필드명을 지어주기도 합니다
SELECT empno || '-' || ename FROM EMP;
SELECT empno || '-' || ename AS emp_info FROM EMP;
SELECT empno || '-' || ename AS empInfo FROM EMP;
-- 오라클 SL 에서 || 는 이어붙이기 연산입니다.
-- empno || '-' || ename : empno 값과 ename 값을 '-' 와 함께 이어붙이기 하고 그렇게 만들어진 필드의 이름은 emp_info 로 설정합니다
-- 필드명에 공백이 있거나 기술하기 어려운 필드명일때도 AS 로 별칭을 붙이기도 합니다. 
SELECT empno AS "사원 번호", ename AS 사원성명 FROM emp;
SELECT empno AS 사원번호, ename AS "사원 성명" FROM emp;

-- [3] 특정 테이블의 모든 필드 표시
SELECT * FROM rentlist;

-- [4] 모든 컬럼(필드명)이 아닌, 필요한 필드만 조회
SELECT subject, makeyear FROM booklist;

-- [5] 각각의 필드명에 별칭을 부여해서 출력
SELECT subject AS 도서제목, makeyear AS 출판년도 FROM booklist;

INSERT INTO rentlist VALUES('2021/12/15', rent_seq.nextVal, 7, 9, 100);
INSERT INTO rentlist VALUES('2021/12/15', rent_seq.nextVal, 8, 10, 100);
INSERT INTO rentlist VALUES('2021/12/16', rent_seq.nextVal, 7, 10, 100);
INSERT INTO rentlist VALUES('2021/12/16', rent_seq.nextVal, 8, 9, 100);

INSERT INTO rentlist VALUES('2021/12/17', rent_seq.nextVal, 7, 7, 100);
INSERT INTO rentlist VALUES('2021/12/17', rent_seq.nextVal, 8, 2, 100);
INSERT INTO rentlist VALUES('2021/12/18', rent_seq.nextVal, 7, 5, 100);
INSERT INTO rentlist VALUES('2021/12/18', rent_seq.nextVal, 8, 2, 100);

SELECT * FROM rentlist;

SELECT booknum FROM rentlist;

-- [6] 중복 제거
SELECT DISTINCT booknum FROM rentlist;

-- rentlist 에서 membernum 을 중복 제거 후 조회하세요
SELECT DISTINCT memebernum FROM rentlist;

-- [7] 검색 조건의 추가 : 입고가격이 20000원 이상인 book 목록
SELECT subject FROM booklist WHERE inprice >=20000;
SELECT * FROM booklist;

SELECT * FROM memberlist;
-- [8] 이름이 '홍' 으로 시작하는 회원의 모든 회원정보 출력
SELECT * FROM memberlist WHERE name LIKE '홍%';

-- [9] 1983 년도 이후로 태어난 회원의 모든 회원정보
SELECT * FROM memberlist WHERE birth >= '1983-01-01';

-- [10] 사은포인트(bpoint) 가 250점 이상이고 1982년 이후로 태어난회원의 모든 회원정보 (and, or 연산자 사용)
SELECT * FROM memberlist WHERE bpoint >= 250 AND birth >= '1982-01-01';

-- [11] 제작년도가 2016 년 이전이거나 입고가격(inprice) 이 18000 이항인 book 정보
SELECT * FROM booklist WHERE makeyear < 2016 or inprice <= 18000;

-- [12] 성명이 '이' 로 시작하는 회원의 모든 정보
SELECT * FROM memberlist WHERE name LIKE '이%';

-- [13] 이름이 '용' 으로 끝나는 회원의 정보
SELECT * FROM memberlist WHERE name LIKE '%용';
SELECT * FROM memberlist WHERE name LIKE '%롬';

-- [14] 도서 제목에 '이' 가 포함되는 도서 정보
SELECT * FROM booklist WHERE subject LIKE '%이%';

-- [15] memeberlist 에서 성별이 NULL 이 아닌 회원의 이름과 전화번호
SELECT name, phone FROM memberlist WHERE gender IS NOT NULL;

-- 성별이 NULL 인 것 모두 M 으로 수정해주세요
UPDATE memberlist SET gender='M' WHERE gender IS NULL;

-- [16] booklist 에서 도서 제목에 두번째 글자가 '것' 인 도서 정보
SELECT * FROM booklist WHERE subject LIKE '_것%';
SELECT * FROM booklist WHERE subject LIKE '_시%';

SELECT * FROM booklist;
SELECT * FROM memberlist;















