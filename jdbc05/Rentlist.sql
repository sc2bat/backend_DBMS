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