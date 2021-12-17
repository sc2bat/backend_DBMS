--서브 쿼리
-- 		Sub Query : 하나의 SELECT 문장의 절 안에 포함된 또 하나의 SELECT 쿼리문

-- SCOTT 이 근무하는 곳의 부서명과 지역 출력
-- 단일행 서브쿼리 : 서브 쿼리의 결과가 하나
SELECT deptno FROM EMP WHERE ename='SCOTT'; -- 결과 20
SELECT dname, loc FROM DEPT WHERE deptno=20; --  RESEARCH DALLAS

-- 위 SELECT 명령의 결과를 다른 SELECT 명령에 사용 (서브쿼리 사용)
SELECT dname, loc FROM DEPT
WHERE deptno=(SELECT deptno FROM EMP WHERE ename='SCOTT'); --  RESEARCH DALLAS

-- [연습문제] SCOTT 과 동일직 업(JOB) 을 가진 사원의 모든 정보를 출력
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM EMP
WHERE job=(SELECT job FROM EMP WHERE ename='SCOTT');
--  7788 SCOTT ANALYST   7566 1987-07-13 00:00:00.0 4970 NULL     20
--  7902 FORD  ANALYST   7566 1981-12-03 00:00:00.0 4970 NULL     20


-- [연습문제] SCOTT 과 급여와 동일하거나 더 많이 받는 사원이름과 급여 출력
SELECT * FROM EMP
WHERE sal >=(SELECT sal FROM EMP WHERE ename='SCOTT'); 
--7788 SCOTT ANALYST   7566 1987-07-13 00:00:00.0 4970 NULL     20
--  7839 KING  PRESIDENT NULL 1981-11-17 00:00:00.0 6950 NULL     10
--  7902 FORD  ANALYST   7566 1981-12-03 00:00:00.0 4970 NULL     20

SELECT ename, sal FROM EMP
WHERE sal >=(SELECT sal FROM EMP WHERE ename='SCOTT'); 
-- SCOTT 4970
-- KING  6950
-- FORD  4970

--[서브 쿼리 & 그룹함수]
-- 전체 사원 평균 평균급여보다 더 많은 급여를 받느 ㄴ사원의 이름, 급여, job
SELECT ename, sal, job FROM EMP WHERE sal >=(SELECT AVG(sal) FROM EMP);
-- JONES 4945.25 manager
-- BLAKE 4821.5 MANAGER
-- CLARK 4695 MANAGER
-- SCOTT 4970 ANALYST
-- KING  6950 PRESIDENT
-- FORD  4970 ANALYST

-- [서브쿼리 & IN, SOME, ANY, ALL 등]
-- 급여를 3000 이상 받는 사원이 소속된 부서와 소속된 부서에서 근무하는 사원들의 이름, 부서번호, job 
-- 급여 3000 이상 사원의 부서번호(중복제거);
-- DISTINCT 필드명 : 필드값의 중복된 값이 여러개라면 한번만 출력

SELECT ename, deptno, job FROM EMP
WHERE deptno IN( SELECT DISTINCT deptno FROM EMP WHERE sal >=3000);

SELECT * FROM EMP;
--[연습문제]
-- 30 번 부서 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 급여가 더 많은 사원의 이름과 JOB, 급여
-- 첫번째 방법
SELECT ename, job, sal FROM EMP WHERE sal > (SELECT MAX(sal) FROM EMP WHERE deptno=30);

--두번째 방법
SELECT ename, job, sal, deptno FROM EMP WHERE sal > ALL(SELECT sal FROM EMP WHERE deptno=30);
-- JONES manager   4945.25     20
-- SCOTT ANALYST   4970     20
-- FORD  ANALYST   4970     20
-- KING  PRESIDENT 6950     10

--[연습문제]
-- 부서번호가 30번인 사원들의 급여 중에서 가장 낮은 급여보다 높은 급여를 받는 사원의 이름과 JOB, 급여
--SELECT ename, job, sal FROM EMP
--WHERE sal IN(SELECT DISTINCT sal FROM EMP WHERE deptno=30)
SELECT ename, job, sal, deptno FROM EMP WHERE sal > (SELECT MIN(sal) FROM EMP WHERE deptno=30);

SELECT ename, job, sal, deptno FROM EMP WHERE sal > ANY(SELECT sal FROM EMP WHERE deptno=30);
SELECT ename, job, sal, deptno FROM EMP WHERE sal > SOME(SELECT sal FROM EMP WHERE deptno=30);

--[연습문제]
-- 영업사원 (job='SALESMAN') 들의 최소 급여보다 많이 받는 사원들의
-- 이름과 급여와 직급, 급여를 출력하되 영업사원 (SALESMAN) 은 출력하지 않습니다.
SELECT ename, sal, job, deptno FROM EMP WHERE sal > ANY(SELECT sal FROM EMP WHERE job='SALESMAN') 
-- 첫번째 방법
SELECT ename, sal, job, deptno FROM EMP 
WHERE sal > (SELECT MIN(sal) FROM EMP WHERE job='SALESMAN') AND job <> 'SALESMAN';

--두번째 방법
SELECT ename, sal, job, deptno FROM EMP 
WHERE sal > ANY(SELECT sal FROM EMP WHERE job='SALESMAN') AND job <> 'SALESMAN';




