-- JOIN
-- 두개 이상의 테이블에 나눠져 있는 관련 데이터들을 하나의 테이블로 모아서 조회하고자 할때 사용하는 명령어입니다.

-- [1] 이름 Douglas Grant 가 근무하는 부서명, 상급부서의 이름을 출력하고자 한다면
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

SELECT department_id FROM EMPLOYEES WHERE emp_name='Douglas Grant';
-- 위 명령을 실행 후 얻어진 부서번호로 아래와 같이 부서번호 검색하여 부서명과 상급부서명을 알아냅니다
SELECT department_name, parent_id FROM DEPARTMENTS WHERE department_id=50;
SELECT department_name FROM DEPARTMENTS WHERE department_id=10;

-- 위의 두개의 명령을 하나의 명형으로 합해주는 역할을 join 명령이 실행합니다

-- cross join : 두개 이상의 테이블이 조인될 때 WHERE 절에 의해 공통되는 컬럼에 의한 결합이 발생하지 않는 경우

-- * 가장 최악의 결과를 얻는 조인 방식 
-- A테이블과 B 테이블의 cross join 된다면
-- A테이블의 1번 레코드와 B테이블의 모든 레코드와 하나하나 모두 조합
-- A테이블의 2번 레코드와 B테이블의 모든 레코드와 하나하나 모두 조합
-- A테이블의 3번 레코드와 B테이블의 모든 레코드와 하나하나 모두 조합

SELECT * FROM DEPT; --  레코드 4, 필드 3
SELECT * FROM EMP; --  레코드 14, 필드 8
-- 크로스 조인
SELECT * FROM DEPT, EMP; -- 레코드 56, 필드 11

-- equi join : 조인 대상이 되는 두테이블에서 공통적으로 존재하는 컬럼의 값이 일치하는 행을 연결하여 겨로가를 생성
SELECT * FROM DEPT, EMP WHERE EMP.deptno=DEPT.deptno;
--     20 RESEARCH   DALLAS    7369 SMITH  CLERK     7902 1980-12-17 00:00:00.0    2880 NULL     20
--     30 SALES      CHICAGO   7499 ALLEN  SALESMAN  7698 1981-02-20 00:00:00.0    3760  300     30
--     30 SALES      CHICAGO   7521 WARD   SALESMAN  7698 1981-02-22 00:00:00.0    3375  500     30
--     20 RESEARCH   DALLAS    7566 JONES  manager   7839 1981-04-02 00:00:00.0 4945.25 NULL     20
--     30 SALES      CHICAGO   7654 MARTIN SALESMAN  7698 1981-09-28 00:00:00.0    3375 1400     30
--     30 SALES      CHICAGO   7698 BLAKE  MANAGER   7839 1981-05-01 00:00:00.0  4821.5 NULL     30
--     10 ACCOUNTING NEW YORK  7782 CLARK  MANAGER   7839 1981-06-09 00:00:00.0    4695 NULL     10
--     20 RESEARCH   DALLAS    7788 SCOTT  ANALYST   7566 1987-07-13 00:00:00.0    4970 NULL     20
--     10 ACCOUNTING NEW YORK  7839 KING   PRESIDENT NULL 1981-11-17 00:00:00.0    6950 NULL     10
--     30 SALES      CHICAGO   7844 TURNER SALESMAN  7698 1981-09-08 00:00:00.0    3650    0     30
--     20 RESEARCH   DALLAS    7876 ADAMS  CLERK     7788 1987-07-13 00:00:00.0    3210 NULL     20
--     30 SALES      CHICAGO   7900 JAMES  manager   7698 1981-12-03 00:00:00.0    3045 NULL     30
--     20 RESEARCH   DALLAS    7902 FORD   ANALYST   7566 1981-12-03 00:00:00.0    4970 NULL     20
--     10 ACCOUNTING NEW YORK  7934 MILLER CLERK     7782 1982-01-23 00:00:00.0    3430 NULL     10

-- 각 사원의 이름, 부서번호, 부서명, 지역을 출력하세요
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT EMP.ename, EMP.deptno, DEPT.dname, DEPT.loc FROM EMP, DEPT WHERE EMP.deptno=DEPT.deptno;
--     20 RESEARCH   DALLAS    7369 SMITH  CLERK     7902 1980-12-17 00:00:00.0    2880 NULL     20
--     30 SALES      CHICAGO   7499 ALLEN  SALESMAN  7698 1981-02-20 00:00:00.0    3760  300     30
--     30 SALES      CHICAGO   7521 WARD   SALESMAN  7698 1981-02-22 00:00:00.0    3375  500     30
--     20 RESEARCH   DALLAS    7566 JONES  manager   7839 1981-04-02 00:00:00.0 4945.25 NULL     20
--     30 SALES      CHICAGO   7654 MARTIN SALESMAN  7698 1981-09-28 00:00:00.0    3375 1400     30
--     30 SALES      CHICAGO   7698 BLAKE  MANAGER   7839 1981-05-01 00:00:00.0  4821.5 NULL     30
--     10 ACCOUNTING NEW YORK  7782 CLARK  MANAGER   7839 1981-06-09 00:00:00.0    4695 NULL     10
--     20 RESEARCH   DALLAS    7788 SCOTT  ANALYST   7566 1987-07-13 00:00:00.0    4970 NULL     20
--     10 ACCOUNTING NEW YORK  7839 KING   PRESIDENT NULL 1981-11-17 00:00:00.0    6950 NULL     10
--     30 SALES      CHICAGO   7844 TURNER SALESMAN  7698 1981-09-08 00:00:00.0    3650    0     30
--     20 RESEARCH   DALLAS    7876 ADAMS  CLERK     7788 1987-07-13 00:00:00.0    3210 NULL     20
--     30 SALES      CHICAGO   7900 JAMES  manager   7698 1981-12-03 00:00:00.0    3045 NULL     30
--     20 RESEARCH   DALLAS    7902 FORD   ANALYST   7566 1981-12-03 00:00:00.0    4970 NULL     20
--     10 ACCOUNTING NEW YORK  7934 MILLER CLERK     7782 1982-01-23 00:00:00.0    3430 NULL     10

-- 이름 Douglas Grant 가 근무하는 부서명을 출력하고자 한다면
-- 출력 내용 : 사원이름, 부서번호, 부서명, 월급
--SELECT DEPT.dname FROM EMP, DEPT WHERE EMP.deptno=DEPT.deptno AND EMP.name='Douglas Grant';
--SELECT DEPT.dname FROM EMP, DEPT WHERE EMP.deptno=DEPT.deptno AND EMP.name='Douglas Grant';
SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;
--DEPARTMENTS AS DP;
SELECT EMPLOYEES.emp_name, EMPLOYEES.salary, DEPARTMENTS.department_id, DEPARTMENTS.department_name
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.department_id=DEPARTMENTS.department_id AND EMPLOYEES.emp_name='Douglas Grant';



--  이름이 SCOTT 인 사원의 이름, 
SELECT ename, emp.deptno, dept.dname, dept.loc FROM DEPT, EMP WHERE EMP.deptno=DEPT.deptno AND EMP.ename='SCOTT';
-- 필드명 앞에 테이블이름을 기술하여 컬럼의 소속을 명확히 해주어야 오류가 없습니다

-- RENTLIST 의 booknum 에 해당하는 도서제목을 RENTLIST 의 rentdate, num, booknum 과 함께 출력하세요
SELECT * FROM RENTLIST;
SELECT * FROM RENTLIST, BOOKLIST;
SELECT * FROM RENTLIST, BOOKLIST WHERE RENTLIST.booknum=BOOKLIST.num;
SELECT RENTLIST.rentdate, RENTLIST.num, RENTLIST.booknum, BOOKLIST.subject FROM RENTLIST, BOOKLIST WHERE RENTLIST.booknum=BOOKLIST.num;

-- RENTLIST 의 membernum 에 해당하는 회원의 이름과 전화번호를 RENTLIST의 rentdate, num, memebernum 과 함께 출력하세ㅛㅇ
SELECT * FROM RENTLIST;
--SELECT * FROM MEMBERLIST;
SELECT RENTLIST.rentdate, RENTLIST.num, MEMBERLIST.num FROM RENTLIST, MEMBERLIST WHERE RENTLIST.num=MEMBERLIST.num; 
SELECT RENTLIST.rentdate, RENTLIST.num AS rentlistnum, MEMBERLIST.num AS membernum FROM RENTLIST, MEMBERLIST WHERE RENTLIST.num=MEMBERLIST.num; 

SELECT RENTLIST.rentdate, RENTLIST.num, RENTLIST.membernum, MEMBERLIST.name, MEMBERLIST.phone 
FROM RENTLIST, MEMBERLIST WHERE RENTLIST.membernum=MEMBERLIST.num; 


-- 테이블 명에 별칭을 부여한 후 컬럼 앞에 소속테이블을 지정
-- 테이블 명으로 소속을 기술할 때는 한쪽에만 있는 필드에 생략이 가능하지만 아래와 같이
-- 별칭 부여시에는 모든 필드 앞에 반드시 별칭을 기술해야함
SELECT A.ename, B.dname, B.loc, A.deptno FROM EMP A, DEPT B WHERE A.deptno=B.deptno AND A.ename='SCOTT'; 
-- SCOTT RESEARCH DALLAS     20

-- non-equi join
-- 동일 컬럼이 없어서 다른 조건을 사용하여 조인
-- 조인 조건에 특정 범위내에 있는지를 조사하기 위해 조건절에 조인 조건을 '=' 연산자 이외의 비교
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

--연산자를 이용
SELECT A.ename, A.sal, B.grade FROM EMP A, SALGRADE B WHERE A.sal >= B.losal AND A.sal <= B.hisal;

SELECT A.ename, A.sal, B.grade FROM EMP A, SALGRADE B WHERE A.sal BETWEEN B.losal AND B.hisal;


-- 세 개의 테이블을 하나로 JOIN(equi, nonequi 조인의 조합)
SELECT A.ename, A.sal, C.grade, B.dname FROM EMP A, DEPT B, SALGRADE C WHERE A.deptno = B.deptno AND A.sal BETWEEN C.losal AND C.hisal;

-- 연습문제
-- RENTLIST 테이블의 rentdate, booknum, emembernum 을 조회하되,
-- BOOKLIST 와 MEMBERLIST 테이블을 조인해서 책제목과 대여가격, 회원 이름과 사은포인트를 출력하세요
-- 출력순서 - 대여일자, 도서제목, 회원이름, 포인트
-- 테이블의 별칭은 A, B, C 로 하세요
SELECT * FROM RENTLIST;
SELECT * FROM BOOKLIST;
SELECT * FROM MEMBERLIST;
SELECT A.rentdate AS "대여 일자", B.subject AS "도서 제목", C.name AS "회원 성명", C.bpoint AS "사은 포인트"
FROM RENTLIST A, BOOKLIST B, MEMBERLIST C 
WHERE A.booknum = B.booknum AND A.membernum = C.membernum;

SELECT A.rentdate AS "대여 일자", B.subject AS "도서 제목", C.name AS "회원 성명", C.bpoint AS "사은 포인트"
FROM RENTLIST A, BOOKLIST B, MEMBERLIST C 
WHERE A.booknum = B.num AND A.membernum = C.num;

-- 조인된 테이블에 계산식으로 필드를 생성할 수도 있습니다 12/30 test
SELECT A.rentdate AS "대여 일자", B.subject AS "도서 제목", C.name AS "회원 성명", C.bpoint AS "사은 포인트", B.rentprice - A.discount AS "매출금액"
FROM RENTLIST A, BOOKLIST B, MEMBERLIST C 
WHERE A.booknum = B.num AND A.membernum = C.num;

-- outer join
-- 조인 조건에 만족하지 못해서 해당 결과를 출력시에 누락이 되는 문제점이 발생할 때 해당 레코드를 출력하는 조인
SELECT A.num, a.subject, b.rentdate FROM BOOKLIST A, RENTLIST B WHERE A.num = B.booknum(+);
--SELECT A.num, a.subject, b.rentdate FROM BOOKLIST A, RENTLIST B WHERE A.num(+) = B.booknum;

SELECT * FROM EMP A, DEPT B WHERE A.deptno(+) = B.deptno;
--  7844 TURNER SALESMAN  7698 1981-09-08 00:00:00.0    3650    0     30     30 SALES      CHICAGO
--  7876 ADAMS  CLERK     7788 1987-07-13 00:00:00.0    3210 NULL     20     20 RESEARCH   DALLAS
--  7900 JAMES  manager   7698 1981-12-03 00:00:00.0    3045 NULL     30     30 SALES      CHICAGO
--  7902 FORD   ANALYST   7566 1981-12-03 00:00:00.0    4970 NULL     20     20 RESEARCH   DALLAS
--  7934 MILLER CLERK     7782 1982-01-23 00:00:00.0    3430 NULL     10     10 ACCOUNTING NEW YORK
--  NULL NULL   NULL      NULL NULL                     NULL NULL   NULL     40 OPERATIONS BOSTON -- 40번 부서에 인원이 없다는것을 파악


-- [3] ANSI join
-- 	(1) Ansi Cross join
SELECT * FROM EMP, DEPT; -- 일반 크로스 조인 표현
SELECT * FROM EMP CROSS JOIN DEPT; -- ANSI CROSS JOIN -> 일반 크로스 조인과 같은 효과

-- 	(2) Ansi inner join -- 일반 equi 조인과 같은 효과
-- 		일반 equi 조인 표현 방식
SELECT ename, dname FROM EMP A, DEPT B WHERE A.deptno = B.deptno;

-- 		Ansi 이너 조인 표현 방식
SELECT ename, dname FROM EMP INNER JOIN DEPT ON EMP.deptno = DEPT.deptno;

-- 		Ansi 이너 조인 다른 표현 방식 : 두 테이블의 조인 기준이 되는 필드명이 똑같을때만 사용가능
SELECT ename, dname FROM EMP INNER JOIN DEPT USING(deptno);

-- 	(3) Ansi Outer join -- 기존 아우터 조인의 표현방식

SELECT * FROM EMP, DEPT WHERE EMP.deptno=DEPT.deptno(+);
SELECT * FROM EMP, DEPT WHERE EMP.deptno(+)=DEPT.deptno;

-- ANSI OUTER JOIN 표현 방식
SELECT * FROM EMP LEFT OUTER JOIN DEPT ON EMP.deptno=DEPT.deptno;
SELECT * FROM EMP RIGHT OUTER JOIN DEPT ON EMP.deptno=DEPT.deptno;
-- 기준이 되는 필드명 중 A 테이블의 필드에는 있으나 B테이블 필드에는 해당값이 없는 경우에 대한 표현여부결정








