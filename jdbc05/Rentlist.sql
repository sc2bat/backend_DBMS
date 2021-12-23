SELECT * FROM rentlist ORDER BY num DESC;

SELECT rentdate FROM rentlist;

SELECT TO_CHAR(rentdate, 'yyyy-mm-dd') FROM rentlist;


SELECT TO_CHAR(rentdate, 'yyyy-mm-dd'), num, booknum 
FROM rentlist
ORDER BY num DESC;

SELECT * FROM booklist;
SELECT * FROM memberlist;
SELECT * FROM rentlist;

ALTER SEQUENCE rent_seq MAXVALUE 2000;
CREATE SEQUENCE rent_seq START WITH 30 INCREMENT BY 1;

DROP SEQUENCE rent_seq;
CREATE SEQUENCE rent_seq START WITH 24 INCREMENT BY 1;

SELECT r.rentdate AS "rentdate", r.num AS "rentnum",
			m.num AS "membernum", m.name AS "membername",
			b.rentprice - r.discount AS "rentprice2",
			b.num AS "booknum", b.subject AS "subject"
FROM rentlist r, booklist b, memberlist m
WHERE r.booknum = b.num AND r.membernum = m.num
ORDER BY r.num DESC;


-- 긴 sql 문을 쓰기 부담 view 를 생성

CREATE OR REPLACE VIEW rentdetail AS

SELECT r.rentdate AS "rentdate", r.num AS "rentnum",
			m.num AS "membernum", m.name AS "membername",
			b.rentprice - r.discount AS "rentprice2",
			b.num AS "booknum", b.subject AS "subject"
FROM rentlist r, booklist b, memberlist m
WHERE r.booknum = b.num AND r.membernum = m.num
ORDER BY r.num DESC;

SELECT * FROM rentdetail;


CREATE OR REPLACE VIEW rentdetail AS
SELECT TO_DATE(r.rentdate,'YYYY-MM-DD') AS "rentdate", r.num AS "rentnum",
			m.num AS "membernum", m.name AS "membername",
			b.rentprice - r.discount AS "rentprice2",
			b.num AS "booknum", b.subject AS "subject"
FROM rentlist r, booklist b, memberlist m
WHERE r.booknum = b.num AND r.membernum = m.num
ORDER BY r.num DESC;









