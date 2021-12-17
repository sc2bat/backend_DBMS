-- * 오라클 - 뷰(View)
-- 		- 물리적인 테이블에 근거한 논리적인 가상 테이블.
-- 		- 가상이란 단어는 실질적으로 데이터를 저장하고 있지 않기때문에 붙인 것이고, 
--		테이블이란 단어는 실질적으로 데이터를 저장하고 있지 않더ㄹ도 사용 계정자는 
--		마치 테이블을 사용하는 것과 동일하게 뷰를 사용할 수 있기 때문에 붙인 것.
-- 		- 뷰는 기본테이블에서 파생된 객체로서 기본테이블에 대한 하나의 쿼리문임.
-- 		- 실제 테이블에 저장된 데이터를 뷰를 통해서 볼 수 있도록 함
-- 		- 사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용하게 됨
-- 		- 뷰는 이미 존재하고 있는 테이블에 제한적으로 접근하도록 한다.
-- 		- 뷰를 생성하기 위해서는 실질적으로 데이터를 저장하고 있는 물리적인 테이블이 존재해야 되는데 이 테이블은 기본테이블이라고 한다


-- 뷰 생성 방법
-- CREATE OR REPALCE VIEW 뷰이름 AS SELECT 조회 명령
-- -> 결과는 SELECT 의 결과를 테이블로 내어 놓는 가상테이블 제작 명령이 생기는 셈입니다
-- 뷰이름으로 조회명령을 저장하고 있다가 뷰이름으로 조회할 때마다 조회 명령이 실행되어 결과를 내놓습니다
CREATE OR REPLACE VIEW rentjointable AS
SELECT A.rentdate AS "대여 일자", B.subject AS "도서 제목", C.name AS "회원 성명", C.bpoint AS "사은 포인트", B.rentprice - A.discount AS "매출금액"
FROM RENTLIST A, BOOKLIST B, MEMBERLIST C 
WHERE A.booknum = B.num AND A.membernum = C.num;

SELECT * FROM rentjointable;

SELECT * FROM TAB; -- RENTJOINTABLE   VIEW         NULL


--CREATE VIEW TEST AS SELECT * FROM EMP;
--SELECT * FROM TEST;
--DROP VIEW TEST;

-- emp 테이블과 dept 테이블에서 번호, 이름, 직책, 입사일, 부서번호, 부서이름, 지역을 출력하는 view 생성
CREATE OR REPLACE VIEW result_inner_join AS
SELECT A.empno, A.ename, A.job, A.hiredate, A.deptno, B.dname, B.loc
FROM EMP A, DEPT B WHERE A.deptno = B.deptno;

SELECT * FROM result_inner_join;

















