DROP TABLE booklist purge;
DROP TABLE memberlist purge;
DROP TABLE rentlist purge;

CREATE TABLE booklist(
	bookNum varchar2(5) NOT NULL,
	subject varchar2(30) NOT NULL,
	makeyear number(4) DEFAULT 2021, 
	inprice number(6) DEFAULT 0,
	rentprice number(6) DEFAULT 0,
	
	CONSTRAINT booknum_pk PRIMARY KEY(bookNum)
);

CREATE TABLE MemberList(
	memberNum varchar2(5) NOT NULL,
	memberName varchar2(12) NOT NULL,
	Phone varchar2(13) NOT NULL,
	Birth DATE,
	Bpoint NUMBER(6) DEFAULT 0,
	joinDate DATE DEFAULT sysdate,
	
	CONSTRAINT member_pk PRIMARY KEY(memberNum)
);


CREATE TABLE rentlist(
	rent_date DATE DEFAULT sysdate,
	idx NUMBER(5) NOT NULL,
	bookNum varchar2(5) NOT NULL,
	memberNum varchar2(5) NOT NULL,
	discount NUMBER(4),
	
	CONSTRAINT rent_pk PRIMARY KEY(rent_date, idx),
	CONSTRAINT fk1 FOREIGN KEY(bookNum) REFERENCES booklist(bookNum),
	CONSTRAINT fk2 FOREIGN KEY(memberNum) REFERENCES MemberList(memberNum)
);

-- foreign key(bookNum) : rent_list 테이블의 booknum
-- references booklist(bookNum) : booklist 테이블에 있는 booknum
-- 외래키가 생성되려면 언급되는 필드명도 정확해야하고 연결되는 필드들의 자료형도 일치해야합니다

SELECT * FROM booklist;
SELECT * FROM MemberList;
SELECT * FROM rentlist;

ALTER TABLE booklist RENAME COLUMN subject TO title;

ALTER TABLE booklist RENAME COLUMN title TO subject;

ALTER TABLE MemberList RENAME COLUMN membernum TO num;
ALTER TABLE MemberList RENAME COLUMN membername TO name;

ALTER TABLE rentlist RENAME COLUMN rent_date TO rentdate;

ALTER TABLE rentlist RENAME COLUMN idx TO numseq;
ALTER TABLE rentlist RENAME COLUMN numseq TO num;

ALTER TABLE booklist MODIFY num NUMBER(5);

ALTER TABLE booklist ADD grade VARCHAR2(15);
ALTER TABLE memberlist ADD gender VARCHAR2(3);
ALTER TABLE memberlist ADD age NUMBER(2);
ALTER TABLE memberlist MODIFY age NUMBER(3);

ALTER TABLE rentlist DROP CONSTRAINT fk1;
ALTER TABLE rentlist DROP CONSTRAINT fk2;
ALTER TABLE rentlist DROP CONSTRAINT rent_pk;

ALTER TABLE booklist MODIFY booknum NUMBER(5); 
ALTER TABLE memberlist MODIFY membernum NUMBER(5); 
ALTER TABLE rentlist MODIFY booknum NUMBER(5);
ALTER TABLE rentlist MODIFY membernum NUMBER(5);

ALTER TABLE rentlist ADD CONSTRAINT fk1 FOREIGN KEY(booknum) REFERENCES booklist(booknum);
ALTER TABLE rentlist ADD CONSTRAINT fk2 FOREIGN KEY(membernum) REFERENCES memberlist(membernum);
ALTER TABLE rentlist ADD CONSTRAINT rent_pk PRIMARY KEY(num);

SELECT * FROM booklist;
SELECT * FROM MemberList;
SELECT * FROM rentlist;

DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;

INSERT INTO memberlist(num, name, phone)
VALUES(member_seq.nextVal, '홍길서', '010-3333-4444');

INSERT INTO memberlist(num, name, phone)
VALUES(member_seq.nextVal, '홍길남', '010-5555-6666');

INSERT INTO memberlist(num, name, phone)
VALUES(member_seq.nextVal, '홍길북', '010-7777-8888');

SELECT * FROM memberlist;
