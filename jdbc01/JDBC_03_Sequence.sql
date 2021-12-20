CREATE sequence num_seq START WITH 7 INCREMENT BY 1;

INSERT INTO customer VALUES(num_seq.nextVal, '김길동', 'fda@naver.com', '010-7777-7777');

DROP sequence num_seq;