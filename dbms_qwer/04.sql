SELECT * FROM booklist;
SELECT * FROM memberlist;
SELECT * FROM rentlist;

SELECT rentlist.rentdate, rentlist.num, rentlist.booknum, booklist.subject FROM rentlist, booklist WHERE rentlist.booknum=booklist.num;

SELECT rentlist.rentdate, rentlist.num AS rentlistnum, memberlist.num AS membernum FROM rentlist, memberlist WHERE rentlist.num=memberlist.num;


SELECT r.rentdate, r.num, r.membernum, m.name, m.phone
FROM rentlist r, memberlist m
WHERE r.membernum=m.num;


SELECT a.ename, b.dname, b.loc, a.deptno FROM emp a, dept b WHERE a.deptno=b.deptno and a.ename='SCOTT';

SELECT a.ename, a.sal, c.grade, b.dname
FROM emp a, dept b, salgrade c
WHERE A.deptno = b.deptno AND a.sal BETWEEN c.losal AND c.hisal;

SELECT r.rentdate AS "대여 일자", b.subject AS "도서 제목", m.name AS "회원 성명", m.bpoint AS "사은 포인트" 
FROM rentlist r, booklist b, memberlist m
WHERE r.booknum = b.num AND r.membernum=m.num;

--11_join2 139

SELECT b.num, b.subject, r.rentdate FROM booklist b, rentlist r WHERE b.num = r.booknum(+);


SELECT * FROM emp e, dept d	 WHERE e.deptno(+) = d.deptno;

SELECT * FROM emp, dept;
SELECT * FROM emp CROSS JOIN dept;

SELECT ename, dname FROM emp e, dept d WHERE e.deptno = d.deptno;

SELECT ename, dname FROM emp INNER JOIN dept ON emp.deptno = dept.deptno;

SELECT ename, dname FROM emp INNER JOIN dept USING(deptno);

SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno(+);
SELECT * FROM emp, dept WHERE emp.deptno(+)=dept.deptno;



SELECT * FROM emp, dept WHERE emp.deptno=dept.deptno(+) ORDER BY empno DESC;
SELECT * FROM emp, dept WHERE emp.deptno(+)=dept.deptno ORDER BY empno DESC;

SELECT * FROM emp LEFT OUTER JOIN dept ON emp.deptno=dept.deptno; 
SELECT * FROM emp e LEFT OUTER JOIN dept d ON e.deptno=d.deptno; 


SELECT * FROM emp e RIGHT OUTER JOIN dept d ON e.deptno = d.deptno;

SELECT * FROM emp e LEFT OUTER JOIN dept d ON e.deptno=d.deptno ORDER BY empno DESC; 
SELECT * FROM emp e RIGHT OUTER JOIN dept d ON e.deptno = d.deptno ORDER BY empno DESC;















