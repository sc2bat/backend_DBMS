-- VIEW

CREATE OR REPLACE VIEW rentjointable AS
SELECT r.rentdate AS "rentdate", b.subject AS "subject", m.name AS "memberName", m.bpoint AS "bpoint", b.rentprice - r.discount AS "price"
FROM rentlist r, booklist b, memberlist m
WHERE r.booknum = b.num AND r.membernum = m.num;

SELECT * FROM rentjointable;

SELECT * FROM TAB;

CREATE OR REPLACE VIEW result_inner_join AS
SELECT e.empno, e.ename, e.job, e.hiredate, e.deptno, d.dname, d.loc
FROM emp e, dept d WHERE e.deptno=d.deptno;

SELECT * FROM result_inner_join;

SELECT * FROM TABS;

-- 서브 쿼리

SELECT deptno FROM emp WHERE ename='SCOTT';

SELECT dname, loc FROM dept WHERE deptno=20;

SELECT dname, loc FROM dept
WHERE deptno=(SELECT deptno FROM emp WHERE ename='SCOTT');

SELECT * FROM emp;
SELECT * FROM dept;

SELECT * FROM emp 
WHERE job=(SELECT job FROM emp WHERE ename='SCOTT');


SELECT * FROM EMP
WHERE sal >=(SELECT sal FROM emp WHERE ename='SCOTT');

SELECT ename, sal FROM EMP
WHERE sal >=(SELECT sal FROM emp WHERE ename='SCOTT');

SELECT ename, sal FROM EMP
WHERE sal >=(SELECT sal FROM emp WHERE ename='SCOTT') AND ename != 'SCOTT';


SELECT ename, sal, job FROM emp WHERE sal >=(SELECT AVG(sal) FROM emp);

SELECT ename, job, sal FROM emp WHERE sal > (SELECT MAX(sal) FROM emp WHERE deptno=30);

SELECT ename, job, sal FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE deptno=30)
SELECT ename, job, sal, deptno FROM emp WHERE sal > ALL(SELECT sal FROM emp WHERE deptno=30)


SELECT ename, job, sal, deptno FROM emp WHERE sal > (SELECT MIN(sal) FROM emp WHERE deptno=30);

SELECT ename, job, sal, deptno FROM emp WHERE sal > ANY(SELECT sal FROM emp WHERE deptno=30);
SELECT ename, job, sal, deptno FROM emp WHERE sal > SOME(SELECT sal FROM emp WHERE deptno=30);

SELECT ename, sal, job, deptno FROM emp
WHERE sal > (SELECT MIN(sal) FROM emp WHERE job='SALESMAN') AND job <> 'SALESMAN';

SELECT ename, sal, job, deptno FROM emp
WHERE sal > (SELECT MIN(sal) FROM emp WHERE job='SALESMAN') AND job != 'SALESMAN';












