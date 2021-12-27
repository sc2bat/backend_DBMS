SELECT * FROM rentlist;

-- rentdate num booknum membernum discount

SELECT * FROM user_sequences;
-- rent_seq

INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, 5, 5, 500);
INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, 5, 6, 500);
INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, 11, 6, 500);

SELECT * FROM booklist;
SELECT * FROM memberlist;

SELECT rent_seq.CURRVAL, rent_seq.nextVal FROM DUAL;

ALTER TABLE rentlist ADD FOREIGN KEY(booknum) REFERENCES booklist(num);
ALTER TABLE rentlist ADD FOREIGN KEY(membernum) REFERENCES booklist(num);
ALTER TABLE rentlist DROP PRIMARY KEY;
ALTER TABLE rentlist ADD PRIMARY KEY(num);

INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, 5, 5, 500);

ALTER TABLE re	ntlist DROP PRIMARY KEY;
ALTER TABLE rentlist DROP CONSTRAINT fk1;
ALTER TABLE rentlist DROP CONSTRAINT fk2;
ALTER TABLE rentlist ADD CONSTRAINT book_fk FOREIGN KEY(booknum) REFERENCES booklist(num);
ALTER TABLE rentlist ADD CONSTRAINT member_fk FOREIGN KEY(membernum) REFERENCES booklist(num);
ALTER TABLE rentlist ADD CONSTRAINT rent_pk PRIMARY KEY(num);

INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, 1, 10, 500);

SELECT FOREIGN KEY FROM rentlist;

ALTER TABLE rentlist DROP CONSTRAINT sys_c007154; 

INSERT INTO rentlist VALUES(sysdate, rent_seq.nextVal, 11, 12, 500);


