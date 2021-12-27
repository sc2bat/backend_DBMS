SELECT * FROM booklist;
SELECT * FROM memberlist;
SELECT * FROM rentlist;
ALTER TABLE memberlist RENAME COLUMN bpiont to bpoint;

-- 세개의 테이블에 각 필드의 자료형과 제약사항에 맞게 각 10개의 레코드를 insert 하세요
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('산책소설', 2021, 8100, 800, '12');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('저는 이곳에 있지 않을거에요', 2021, 25000, 2500, '20');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('패터슨', 2021, 14400, 1400, '18');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('아이가 세계를 대하는 방식', 2021, 8100, 800, '12');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('매우 가벼운 담론', 2021, 13000, 1300, '12');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('일편단시', 2021, 17000, 1700, 'all');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('답청', 2021, 15000, 1500, 'all');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('때때로 캥거루', 2021, 30000, 3000, '12');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('11월', 2021, 20000, 2000, '18');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('립싱크 하이웨이', 2021, 11000, 1100, '12');
INSERT INTO scott.booklist(subject, makeyear, inprice, rentprice, grade) VALUES('사라지는 공원에서 우리는', 2021, 9000, 900, 'all');

INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('희진', '010-1111-2222', '2000/10/19', 100, 21, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('현진', '010-2222-2222', '2000/11/15', 200, 21, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('하슬', '010-3333-2222', '1997/08/18', 300, 24, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('여진', '010-4444-2222', '2002/11/11', 400, 19, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('비비', '010-6666-2222', '1996/12/09', 500, 25, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('김립', '010-7777-2222', '1999/02/10', 600, 22, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('진솔', '010-8888-2222', '1997/06/13', 700, 24, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('최리', '010-5555-2222', '2001/06/04', 800, 20, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('이브', '010-9999-2222', '1997/05/14', 900, 24, 'F');
INSERT INTO SCOTT.memberlist(name, phone, birth, bpoint, age, gender) VALUES('고원', '010-0000-2222', '1999/10/20', 100, 22, 'F');

INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(1, 10, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(2, 9, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(3, 8, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(4, 7, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(5, 6, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(6, 5, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(7, 4, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(8, 3, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(9, 2, 100);
INSERT INTO SCOTT.rentlist(booknum, membernum, discount) VALUES(10, 1, 100);

SELECT * FROM booklist;
SELECT * FROM memberlist;
SELECT * FROM rentlist;



