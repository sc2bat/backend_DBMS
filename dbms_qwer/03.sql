SELECT * FROM employees;
SELECT * FROM departments;

SELECT department_id FROM employees WHERE emp_name='Douglas Grant';

SELECT department_name, parent_id FROM departments WHERE department_id=50;
SELECT department_name FROM DEPARTMENTS WHERE department_id=10;


SELECT * FROM DEPT;
SELECT * FROM EMP;

SELECT * FROM dept, emp WHERE emp.deptno = dept.deptno;

SELECT e.ename, e.deptno, d.dname, d.loc FROM emp AS e, dept AS d WHERE e.deptno=d.deptno;

SELECT e.ename, e.deptno, d.dname, d.loc FROM emp AS e, dept AS d WHERE emp.deptno=dept.deptno;

SELECT emp.ename, emp.deptno, dept.dname, dept.loc FROM emp, dept WHERE emp.deptno=dept.deptno;

SELECT emp.ename, emp.deptno, dept.dname, dept.loc FROM emp AS e, dept WHERE e.deptno=dept.deptno;

SELECT e.ename, e.deptno, d.dname, d.loc FROM emp e, dept d WHERE e.deptno=d.deptno;

SELECT employees.emp_name, departments.department_id, departments.department_name FROM employees, departments 
WHERE EMPLOYEES.department_id=departments.department_id AND employees.emp_name='Douglas Grant';

SELECT ename, emp.deptno, dept.dname, dept.loc FROM dept, emp WHERE emp.deptno=dept.deptno AND emp.ename='SCOTT';

SELECT * FROM TAB;
SELECT * FROM TESTFOR1;


SELECT * FROM booklist;
SELECT * FROM rentlist;
CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE book_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE rent_seq START WITH 1 INCREMENT BY 1;

-- num subject makeyear inprice rentprice grade
INSERT INTO booklist VALUES (book_seq.nextVal, '셔기베인', 2011, 14000, 1400, '12');
INSERT INTO booklist VALUES (book_seq.nextVal, '소마', 2014, 17000, 1700, '19');
INSERT INTO booklist VALUES (book_seq.nextVal, '꿈만꾸는게낫다', 2013, 14000, 1400, '12');
INSERT INTO booklist VALUES (book_seq.nextVal, '페어플레이', 2001, 10000, 1000, '19');
INSERT INTO booklist VALUES (book_seq.nextVal, '저게저절로붉어질', 2002, 11000, 1100, 'all');
INSERT INTO booklist VALUES (book_seq.nextVal, '캣피싱', 2010, 30000, 3000, '13');
INSERT INTO booklist VALUES (book_seq.nextVal, '밀회', 2015, 20000, 2000, 'all');
INSERT INTO booklist VALUES (book_seq.nextVal, '우리는우리의최선을', 2019, 18000, 1800, '16');
INSERT INTO booklist VALUES (book_seq.nextVal, '고양이행성의기록', 2020, 16000, 1600, '18');
INSERT INTO booklist VALUES (book_seq.nextVal, '화이트아웃', 2021, 14000, 1400, '19');
INSERT INTO booklist VALUES (book_seq.nextVal, '세이프', 2021, 15000, 1500, 'all');

SELECT * FROM memberlist;
-- num name phone birth bpoint joindate gender age
INSERT INTO memberlist VALUES (member_seq.nextVal, '이새롬', '010-1111-7777', '1997-01-07', 100, '21/12/21', 'F', 24);
INSERT INTO memberlist VALUES (member_seq.nextVal, '송하영', '010-9999-2222', '1997-09-29', 200, '21/12/21', 'F', 24);
INSERT INTO memberlist VALUES (member_seq.nextVal, '장규리', '010-1111-2222', '1997-12-27', 300, '21/12/21', 'F', 24);
INSERT INTO memberlist VALUES (member_seq.nextVal, '박지원', '010-3333-2222', '1998-03-20', 400, '21/12/21', 'F', 23);
INSERT INTO memberlist VALUES (member_seq.nextVal, '노지선', '010-1111-1111', '1998-11-23', 500, '21/12/21', 'F', 23);
INSERT INTO memberlist VALUES (member_seq.nextVal, '이서연', '010-1111-2222', '2000-01-22', 600, '21/12/21', 'F', 21);
INSERT INTO memberlist VALUES (member_seq.nextVal, '이채영', '010-5555-4444', '2000-05-14', 700, '21/12/21', 'F', 21);
INSERT INTO memberlist VALUES (member_seq.nextVal, '이나경', '010-6666-1111', '2000-06-01', 800, '21/12/21', 'F', 21);
INSERT INTO memberlist VALUES (member_seq.nextVal, '백지헌', '010-4444-7777', '2003-04-17', 900, '21/12/21', 'F', 18);


INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 1, 10, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 2, 9, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 3, 8, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 4, 7, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 5, 6, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 6, 5, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 7, 4, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 8, 3, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 9, 2, 100);
INSERT INTO rentlist VALUES('2021/12/01', rent_seq.nextVal, 10, 1, 100);

SELECT * FROM rentlist;

DELETE FROM memberlist WHERE num>20;

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq START WITH 4 INCREMENT BY 1;

DELETE FROM rentlist WHERE num>10;
DROP SEQUENCE rent_seq;
CREATE SEQUENCE rent_seq START WITH 4 INCREMENT BY 1;

ALTER SEQUENCE rent_seq MAXVALUE 1000;






