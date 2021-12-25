CREATE TABLE customer(
	num NUMBER(3),
	name VARCHAR2(20),
	email VARCHAR2(20),
	tel VARCHAR2(20)
);

CREATE SEQUENCE cus_seq START WITH 1 INCREMENT BY 1;


INSERT INTO customer VALUES(cus_seq.nextVal, '가나다', 'abc1@naver.com', '010-1234-1234');
INSERT INTO customer VALUES(cus_seq.nextVal, '라마바', 'abc2@naver.com', '010-2222-1234');
INSERT INTO customer VALUES(cus_seq.nextVal, '사아자', 'abc3@naver.com', '010-3333-1234');
INSERT INTO customer VALUES(cus_seq.nextVal, '차카타', 'abc4@naver.com', '010-4444-1234');
INSERT INTO customer VALUES(cus_seq.nextVal, '파하가', 'abc5@naver.com', '010-6566-1234');
INSERT INTO customer VALUES(cus_seq.nextVal, '나다라', 'abc6@naver.com', '010-5555-1234');
INSERT INTO customer VALUES(cus_seq.nextVal, '마바사', 'abc7@naver.com', '010-7777-1234');

SELECT * FROM customer;
