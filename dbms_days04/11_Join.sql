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
SELECT EMP.emp_name, department_id, DEPARTMENTS.department_name
FROM EMPLOYEES, DEPARTMENTS
WHERE EMPLOYEES.department_id=DEPARTMENTS.department_id AND EMP.emp_name='Douglas Grant';



--  이름이 SCOTT 인 사원의 이름, 
SELECT ename, emp.deptno, dept.dname, dept.loc FROM DEPT, EMP WHERE EMP.deptno=DEPT.deptno AND EMP.ename='SCOTT';
-- 필드명 앞에 테이블이름을 기술하여 컬럼의 소속을 명확히 해주어야 오류가 없습니다
-- 
-- 