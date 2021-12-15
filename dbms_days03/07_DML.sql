-- DML (Data Management Language)
-- 데이터 조작 언어

-- 테이블에 레코드를 조작(추가, 수정, 삭제, 조회) 하기 위한 명령어들
-- INSERT (추가) 
-- UPDATE (수정)
-- DELETE (삭제)
-- SELECT (조회 및 선택)

-- [1] 샘플 테이블 생성
CREATE TABLE exam01(
	deptno NUMBER(2), -- 부서 번호
	dname VARCHAR2(14), -- 부서명
	loc VARCHAR2(14) -- 위치
);

SELECT * FROM EXAM01;

-- [2] 레코드 추가
-- 레코드 추가 명령 사용1
-- INSERT INTO 테이블 이름(필드명1, 필드명2, ... ) VALUES (값1, 값2, ...)
-- 값은 문자('123') 와 숫자(123)를 구분하여 입력합니다

-- 레코드 추가 명령 사용2
-- INSERT INTO 테이블 이름 VALUES (전체 COLUMN(필드, 열)에 넣을 값들);

-- 첫번째 방식은 필드명과 입력되어야 하는 값을 1:1 로 매핑하여 입력합니다
-- NULL 값이 있어도 되는 필드는 필드명, 또는 기본값이 있는 필드명은 필드명과 값을 생략하고 입력가능합니다
-- 두번째 방식은 모든 필드에 해당하는 데이터를 모두 입력하는 경우로서 필드명들을 명령어 속에
-- 나열하지 않아도 되지만, 필드의 순서대로 빠짐없이 데이터가 나열되어야 하는 불편함도 있습니다

-- 첫번째 방식의 레코드 추가
INSERT INTO EXAM01(deptno, dname, loc) VALUES(10, 'ACCOUNT', 'NEW YORK');

-- 두번째 방식의 레코드 추가
INSERT INTO EXAM01 VALUES(30, 'SALES', 'CHICHAGO');

SELECT * FROM EXAM01;

-- 두 가지 방법 모두 NULL 값을 입력할 수 있습니다
INSERT INTO EXAM01(deptno, dname) VALUES(20, 'MARKETING'); -- 첫번째 방법
INSERT INTO EXAM01 VALUES(40, 'OPERATION', NULL); -- 두번째 방법


SELECT * FROM EXAM01;


-- 두가지 방법 중 자유롭게 선택하여서, booklist 테이블에 10개의 레코드를 추가햊쉐요
-- num 은 시퀀스를 이용합니다
-- grade 는 'all' '13' '20' 세가지만 골라서 입력해주세요

SELECT * FROM BOOKLIST;

--ALTER table booklist RENAME COLUMN booknum to num;

INSERT INTO booklist(num, subject, makeyear, inprice, rentprice, grade) VALUES(book_seq.nextVal, '좀비아이1', 2020, 12000, 2500, 'all');

INSERT INTO booklist VALUES(book_seq.nextVal, '일곱해의 마지막2', 2020, 12150, 2000, 'all');

INSERT INTO booklist VALUES(book_seq.nextVal, '나는 간이역입니다3', 2020, 13320, 2000, 'all');
INSERT INTO booklist VALUES(book_seq.nextVal, '비만백서4', 2020, 21600, 2000, 'all');
INSERT INTO booklist VALUES(book_seq.nextVal, '왜요5', 2020, 11700, 2000, 'all');
INSERT INTO booklist VALUES(book_seq.nextVal, '6초등과학365', 2020, 17820, 2000, 'all');
INSERT INTO booklist VALUES(book_seq.nextVal, '7시선으로부터', 2020, 12600, 2000, 'all');
INSERT INTO booklist VALUES(book_seq.nextVal, '8책은도끼다', 2020, 14400, 2000, 'all');
INSERT INTO booklist VALUES(book_seq.nextVal, '9오늘부터개발자', 2020, 13500, 2000, 'all');
INSERT INTO booklist VALUES(book_seq.nextVal, '10마음의 심연', 2020, 12150, 2000, 'all');

SELECT * FROM BOOKLIST;

-- 같은 방식으로 memberlist 에 7명의 데이터를 추가해주세요. member_seq 를 이용해주세요
SELECT * FROM memberlist;

INSERT INTO memberlist(num, name, phone, birth, bpoint, joindate, gender, age) VALUES(member_seq.nextVal, '추신수', '010-5656-1234', '84/07/07', 240, '20/10/01', 'M', 28);
INSERT INTO memberlist VALUES(member_seq.nextVal, '노지선', '010-1111-2222', '98/11/23', 300, '20/10/01', 'F', 23);
INSERT INTO memberlist VALUES(member_seq.nextVal, '박지원', '010-3333-5555', '98/03/20', 400, '20/10/01', 'F', 23);
INSERT INTO memberlist VALUES(member_seq.nextVal, '백지헌', '010-5555-6666', '03/04/17', 500, '20/10/01', 'F', 18);
INSERT INTO memberlist VALUES(member_seq.nextVal, '이채영', '010-7777-6666', '00/05/14', 600, '20/10/01', 'F', 21);
INSERT INTO memberlist VALUES(member_seq.nextVal, '이새롬', '010-4444-5555', '97/01/07', 700, '20/10/01', 'F', 24);
INSERT INTO memberlist VALUES(member_seq.nextVal, '송하영', '010-7777-3333', '97/09/29', 900, '20/10/01', 'F', 24);
INSERT INTO memberlist VALUES(member_seq.nextVal, '장규리', '010-6666-0000', '97/12/27', 800, '20/10/01', 'F', 24);

SELECT * FROM memberlist;

-- rentlist 테이블도 rent_seq 를 이용해서 10개의 데이터를 추가해주세요

SELECT * FROM RENTLIST;

INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 15, 15, 100);  -- 실패
-- ORA-02291: integrity constraint (SCOTT.FK2) violated - parent key not found

INSERT INTO rentlist(rentdate, num, booknum, membernum, discount) VALUES('2021/12/01', rent_seq.nextVal, 1, 1, 100); -- 성공

INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 2, 2, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 3, 3, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 4, 4, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 5, 5, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 6, 6, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 7, 7, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 8, 8, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 9, 9, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 10, 10, 100);


SELECT * FROM RENTLIST;

-- [3] 데이터 변경 - 수정(UPDATE)
-- UPDATE 테이블명 SET 변경내용 WHERE 검색 조전
-- UPDATE memberlist SET age=30 WHERE membernum=10;

-- 명령문에 WHERE 이후 구문은 생략이 가능합니다.
-- 다만 이부분을 생략하면 모든 레코드를 대상으로 해서 UPDATE 명령이 실행되어 모든 레코드가 수정됩니다.
-- 검색 조건 : 필드명(비교-관계연산자) 조건값으로 이루어진 조건연산이며, 흔히 자바에서 if() 괄호 안에 사용했던 연산을 그대로 사용하는게 보통입니다
-- 나이가 29세 이상 -> WHERE AGE >= 29

SELECT * FROM EXAM01;

-- 데이터 수정의 실예
-- 기본적으로 대소문자 구별하지 않음 
-- WHERE 절 뒤의 ' ' 내에 있는 것은 구별을 함 
-- 에러는 없지만 수정이 안됨

-- EXAM01 테이블에서 deptno 값을 모두 30으로 수정
UPDATE EXAM01 SET deptno=30;
-- EXAM01 테이블에서 dname이 'ACCOUNT' 인 레코드의 deptno 를 10으로 수정
UPDATE EXAM01 SET deptno=10 WHERE dname='ACCOUNT';

-- EXAM01 테이블에서 dname이 'SALES' 인 레코드의 deptno 를 20으로 수정하세요
UPDATE EXAM01 SET deptno=20 WHERE dname='SALES';

-- EXAM01 테이블에서 dname이 'OPERATION' 인 레코드의 deptno 를 30으로 수정하세요
UPDATE EXAM01 SET deptno=30 WHERE dname='OPERATION';

-- EXAM01 테이블에서 dname이 'MARKETING' 인 레코드의 deptno 를 40으로 수정하세요
UPDATE EXAM01 SET deptno=40 WHERE dname='MARKETING';

-- EXAM01 테이블에서 deptno이 30인 레코드의 loc 를 'BOSTON'으로 수정하세요
UPDATE EXAM01 SET loc='BOSTON' WHERE deptno=30;

-- EXAM01 테이블에서 deptno이 40인 레코드의 loc 를 'LA'으로 수정하세요
UPDATE EXAM01 SET loc='LA' WHERE deptno=40;

SELECT * FROM EXAM01;

-- booklist 테이블의 제목 '봉제인형 살인사건' 도서의 grade 를 '20'으로 수정 
SELECT * FROM booklist;
UPDATE booklist SET grade=18 WHERE subject='일곱해의 마지막2';

SELECT * FROM EMP;

-- emp 테이블의 모든 사원의 sal 값을 10%씩 인상
--UPDATE emp SET sal=this.sal * 1.1 WHERE sal=*;
UPDATE emp SET sal=sal * 1.1;
UPDATE emp SET sal=sal + (sal * 0.1);

-- emp 테이블에서 sal 값이 3000 이상인 사원의 급여 10% 삭감
UPDATE emp SET sal=sal *0.9 WHERE sal >= 3000;

-- emp 테이브르이 hiredate 가 2002 년 이전인 사원의 급여를 +2000
-- (2001-12-31 보다 작거나 같은)
UPDATE emp SET sal=sal+2000 WHERE hiredate <= '2001-12-31';
--UPDATE emp SET sal=sal+2000 WHERE hiredate < '2002-01-01';

-- emp 테이블의 ename 이 j로 시작하는 사원의 job 을 manager 로 변경
UPDATE emp SET job='manager' WHERE ename LIKE 'J%';
--UPDATE emp SET job='manager' WHERE ename LIKE '%J'; -- J로 끝나는 이름 검색
--UPDATE emp SET job='manager' WHERE ename LIKE '%J%'; -- J 를 포함하는 이름 검색

-- memberlist 테이블에서 bpoint 가 200 이 넘는 사람만 bpoin*100 으로 변경
UPDATE memberlist SET bpoint = bpoint *100 WHERE bpoint > 200;
SELECT * FROM memberlist;

-- rentlist 테이블에서 할인금액이 100 원이 넘으면 모두 할인 금액을 90으로 변경
UPDATE rentlist SET discount = 90 WHERE discount >= 100;
SELECT * FROM rentlist;


-- 등급이 '20' 인 책은 rentprice 을 10% 인상, 책 제목 끝에 20+ 를 추가
UPDATE booklist SET grade='20' WHERE inprice >= '12000';
UPDATE booklist SET grade='18' WHERE inprice >= '13000';

UPDATE booklist SET rentprice=rentprice*1.1, subject= subject||'20+' WHERE grade='20';
-- 오라클의 이어붙이기 연산 : ||
SELECT * FROM booklist;

-- booklist 에 grade 가 '18' 레코드의 grade 를 '20' 으로 변경, rentprice 을 10% 인상, 책 제목 끝에 20+ 를 추가해주세요
ALTER TABLE booklist MODIFY subject VARCHAR2(500);
UPDATE booklist SET grade='20', rentprice=rentprice*1.1, subject=subject||'20+' WHERE grade='18';
SELECT * FROM booklist;


-- [4] 레코드의 삭제
-- DELETE FROM 테이블명 WHERE 조건식

-- rentlist 테이블에서 discount가 100 이하의 레코드를 삭제
DELETE FROM rentlist WHERE discount >= 100;

-- WHERE 절이 없으면 테이블 내의 모든 레코드를 삭제합니다
SELECT * FROM rentlist;

-- 삭제의 제한
DELETE FROM booklist WHERE subject='일곱해의 마지막220+';
-- ORA-02292: integrity constraint (SCOTT.FK1) violated - child record found
-- 봉제인형 살인사건 도서가 rentlist 에 대여목록으로 존재하므로...
-- 외래키의 참조무결성에 위배됩니다 따라서 이 삭제명령은 에러가 발생합니다
SELECT * FROM rentlist;
SELECT * FROM booklist;

-- integrity constraint (SCOTT.FK1) violated - child record found
-- 해결방법 #1
-- 이를 해결하려면 우선 rentlist 테이블에 해당 도서 대여목록 레코드를 모두 삭제한 후
-- booklist 테이블에서 해당 도서를 삭제해야합니다
DELETE FROM rentlist WHERE booknum = 5;
DELETE FROM booklist WHERE num = 5;

-- 해결방법 #2
-- 외래키 제약조건을 삭제한 후 다시 생성
-- 생성시에 옵션을 추가해서 참조되는 값이 삭제되면 참조하는 값도 같이 삭제되게 구성합니다.

-- 외래키 삭제
ALTER TABLE rentlist DROP CONSTRAINT fk1;
-- 새로운 외래키 추가
ALTER TABLE rentlist ADD CONSTRAINT fk1 FOREIGN KEY(booknum) REFERENCES booklist(num) ON DELETE CASCADE;
-- ON DELETE CASCADE : booklist 의 도서가 삭제되면 rentlist 의 해당 도서 대여내역도 함께 삭제하는 옵션

-- memberlist 테이블에서 회원 한명을 삭제하면, rentlist 테이블에서도 해당 회원이 대여한 기록을 같이 삭제하도록 외래키 설정을 바꿔주세요 ( 외래키 제약조건 삭제 후 재생성)
SELECT * FROM memberlist;
ALTER TABLE rentlist DROP CONSTRAINT fk2;
ALTER TABLE rentlist ADD CONSTRAINT fk2 FOREIGN KEY(membernum) REFERENCES memberlist(num) ON DELETE CASCADE;

DELETE FROM memberlist WHERE name='홍길서';

SELECT * FROM memberlist;
SELECT * FROM rentlist;


-- 참조되는 값의 삭제가 아니라 수정은 아직 적용되지 않습니다.
-- booklist 와 memberlist 테이블의 num 은 대여기록이 있을 경우 수정이 아직 불가능합니다
-- 이를 해결하기 위해서 외래키 설정시 ON UPDATE CASCADE 옵션을 추가하면 될듯하지만
-- 이는 오라클에서 허용하지 않습니다
-- MySQL 에서만 사용이 가능하며, 오라클에서는 뒷단원의 트리거를 공부하면서 외래키가 수정이 되도록 하겠습니다.















