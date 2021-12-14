-- 테이블의 수정 (ALTER)

-- 1. 필드명의 변경
-- ALTER TABLE 테이블 이름 RENAME COLUMN 변경 전 이름 TO 변경 후 이름
-- 테이블이름 : 변경하고자하는 필드명이 있는 테이블의 이름

-- booklist 테이블의 subject 필드명을 title 로 수정하세요
ALTER TABLE booklist RENAME COLUMN subject TO title;

-- 반대로 title 필드명을 subject 필드명으로 수정합니다
ALTER TABLE booklist RENAME COLUMN title TO subject;

-- memberlist 테이블의 membername 필드를 name 으로 변경하세요
ALTER TABLE MemberList RENAME COLUMN membername TO name;

-- rentlist 테이블의 rent_date 필드를 rentdate 로 변경하세요
ALTER TABLE rentlist RENAME COLUMN rent_date TO rentdate;

-- rentlist 의 idx 를 numseq 로 변경하세요
ALTER TABLE rentlist RENAME COLUMN idx TO numseq;

-- rentlist 의 numseq 를 num 으로 변경하세요
ALTER TABLE rentlist RENAME COLUMN numseq TO num;

-- booklist 의 bookNum 을 Num 으로 변경하세요
ALTER TABLE booklist RENAME COLUMN bookNum TO Num;

-- memberlist 의 membernum 을 num 으로 변경하세요
ALTER TABLE MemberList RENAME COLUMN membernum TO num;

SELECT * FROM booklist;
SELECT * FROM MemberList;
SELECT * FROM rentlist;

-- 테이블을 만들며 생성한 기본키와 외래키 등등은 필드명이 바뀌면, 바뀐 이름으로 자동 적용됩니다

-- 외래키는 참조하는 필드의 자료형과, 참조되는 필드의 자료형이 일치해야, 생성도 되고 유지도 됩니다
-- 따라서 아래의 필드의 자료형 변경을 연결된 외래키에서 하려고 한다면 에러입니다. 


-- 2. 필드 자료형의 변경
-- ALTER TABLE 테이블 명 MODIFY 필드명 자료형

-- VARCHAR2(12) 였던 memberlist 테이블의 name 필드를 VARCHAR2(30) 으로 변경
ALTER TABLE memberlist MODIFY name VARCHAR2(50); -- 수정 성공
--ALTER TABLE memberlist MODIFY name VARCHAR2(50) DEFAULT NOT NULL;

-- booklist 의 num 필드를 VARCHAR2(5) 로 자료형 변경
ALTER TABLE booklist MODIFY num VARCHAR2(5); -- 수정 실패
-- column type incompatible with referenced column type 수정 실패
-- 참조되는 컬럼(필드)의 자료형이 현재 수정하려는 컬럼(필드) 자료형과 호환되지 않음.

-- 외래키로 연결되어서 참조되고, 참조하고 있는 필드들은 위의 명령으로 수정이 바로 불가능합니다
-- 가능하게 하려면, 외래키 제약 조건을 수정하여 없애버리고, 참조되는 필드와 참조하는 필드를 모두 수정한 후 
-- 외래키 제약 조건을 다시 설정합니다
-- ALTER 명령에 의해서 제약조건을 수정하는 명령을 아래에서 학습합니다

-- 3. 필드의 추가
-- ALTER TABLE 테이블명 ADD 필드명 자료형

-- booklist 에 구매등급을 저장할 수 있는 grade필드를 varchar2(15) 로 추가
ALTER TABLE booklist ADD grade VARCHAR2(15);

-- memberlist 에 성별 (gender) 필드를 varchar2(3)으로 추가
ALTER TABLE memberlist ADD gender VARCHAR2(3);

-- memberlist 에 나이(age) 필드를 number(2) 로 추가
ALTER TABLE memberlist ADD age NUMBER(2);

-- 4. 필드의 삭제
-- ALTER TABLE 테이블명 DROP COLUMN 필드명
-- memberlist 테이블에서 성별 필드 제거
ALTER TABLE memberlist DROP COLUMN gender;

-- booklist 테이블에서 grade 필드 제거
ALTER TABLE booklist DROP COLUMN grade;

-- memberlist 테이블에서 나이(age) 필드 제거
ALTER TABLE memberlist DROP COLUMN age;

-- 다음 항목을 위해 삭제한 필드 재생성
ALTER TABLE booklist ADD grade VARCHAR2(15);
ALTER TABLE memberlist ADD gender VARCHAR2(3);
ALTER TABLE memberlist ADD age NUMBER(2);

-- 5. 제약 조건의 추가/ 제거
-- 삭제 : ALTER TABLE 테이블 명 DROP CONSTRAINT 제약조건명
-- rentlist 테이블의 booknum 에 결려 있는 외래키 제약조건 제거
ALTER TABLE rentlist DROP CONSTRAINT fk1;
-- rentlist 테이블의 membernum 에 결려 있는 외래키 제약조건 제거
ALTER TABLE rentlist DROP CONSTRAINT fk2;
-- rentlist 테이블의 기본키 제거
ALTER TABLE rentlist DROP CONSTRAINT rent_pk;

-- 위에서 실패했던 필드의 자료형 수정 재실행
-- booklist 의 num 을 VARCHAR2(5) 로 수정
ALTER TABLE booklist MODIFY num VARCHAR2(5); -- 수정 성공

-- memberlist 의 num 을 VARCHAR2(5) 로 수정
ALTER TABLE memberlist MODIFY num VARCHAR2(5); -- 수정 성공

-- rentlist 의 booknum 을 VARCHAR2(5); 수정
ALTER TABLE rentlist MODIFY booknum VARCHAR2(5);

-- rentlist 의 membernum 을 VARCHAR2(5); 수정
ALTER TABLE rentlist MODIFY membernum VARCHAR2(5);

-- 원래대로 복원
ALTER TABLE booklist MODIFY num NUMBER(5); 
ALTER TABLE memberlist MODIFY num NUMBER(5); 
ALTER TABLE rentlist MODIFY booknum NUMBER(5);
ALTER TABLE rentlist MODIFY membernum NUMBER(5);

-- 추가: ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건명 제약조건식

-- 필드LEVER(수준) 의 제약조건은 필드를 MODIFY 하여서 같이 수정 생성 합니다.
-- 테이블 LEVEL 의 제약조건은 위의 명령 형식으로 제약조건 이름과 함께 추가합니다

-- memberlist 테이블의 성별 (gender) 필드에 'F', 'M' 두 글자만 입력되도록 제약조건을 추가하세요
ALTER TABLE memberlist ADD CONSTRAINT check_gender CHECK(gender in('F','M'));
-- in() 함수 : 괄호안의 항목중 하나에 해당하면 true 가 리턴되는 함수입니다. 위의 내용은 check 함수에 의해 
-- gender 필드에 들어갈 값이 in() 함수 안의 항목 중 하나와 같다면 입력 허용, 아니면 불허하는 제약조건입니다

-- memberlist 테이블의 나이(age) 필드에 120 살이 초과되는 나이는 입력되지 못하게 제약 조건 추가
ALTER TABLE memberlist ADD CONSTRAINT check_age CHECK(age < 100);

-- 위에 삭제되었던 fk1, fk2, rent_pk 제약조건은 다시 설정하세ㅛㅇ
-- rent_pk 는 num 필드로만 설정하세요

ALTER TABLE rentlist ADD CONSTRAINT fk1 FOREIGN KEY(booknum) REFERENCES booklist(num);
ALTER TABLE rentlist ADD CONSTRAINT fk2 FOREIGN KEY(membernum) REFERENCES MemberList(num);

ALTER TABLE rentlist ADD CONSTRAINT rent_pk PRIMARY KEY(num);

------------------------------------
SELECT * FROM booklist;
SELECT * FROM MemberList;
SELECT * FROM rentlist;

-- 테이블 생성 연습 문제

-- 테이블명 : ORDERS1
-- 필드 : ORDER_ID NUMBER(12, 0)
--			ORDER_DATE DATE
--			ORDER_MODE VARCHAR2(8)
--			COUSTOMER_ID NUMBER(6, 0)
--			ORDER_STATUS NUMBER(2, 0)
--			ORDER_TOTAL NUMBER(8, 2)
--			SALES_REP_ID NUBMER(6, 0)
--			PROMOTION_ID NUMBER(6, 0)
--			제약사항 : 기본키는 ORDER_ID -테이블 레벨
--						ORDER_MODE에는 'direct', 'online' 만 입력가능 - 테이블 레벨
--						ORDER_TOTAL 의 디폴트 값은 0 - 필드 레벨

DROP TABLE ORDERS1 purge;

CREATE TABLE ORDERS1(
	ORDER_ID NUMBER(12, 0),
	ORDER_DATE DATE,
	ORDER_MODE VARCHAR2(8),
	CUSTOMER_ID NUMBER(6, 0),
	ORDER_STATUS NUMBER(2, 0),
	ORDER_TOTAL NUMBER(8, 2) DEFAULT 0,
	SALES_REP_ID NUMBER(6, 0),
	PROMOTION_ID NUMBER(6, 0),
	CONSTRAINT pk_order PRIMARY KEY(ORDER_ID),
	CONSTRAINT ck_ORDER_MODE CHECK (ORDER_MODE in('direct', 'online'))
);
SELECT * FROM ORDERS1

-- 테이블 수정 EX
-- CUSTOMER_ID 필드명을 CUSTOMER_NUMBER 로 수정
ALTER TABLE ORDERS1 RENAME COLUMN CUSTOMER_ID TO CUSTOMER_NUMBER;

-- Promotion_ID 값은 10000~99999 사이의 값만 저장 가능
-- 작성 TIP - promotion_id between 10000 and 99999
ALTER TABLE ORDERS1 ADD CONSTRAINT pro_check CHECK(PROMOTION_ID BETWEEN 10000 AND 99999);

SELECT * FROM ORDERS1;

-- 테이블의 복사
CREATE TABLE ORDERS2 AS SELECT * FROM ORDERS1;
-- AS SELECT 구분은 SELECT 구문 이후에 다시 학습합니다
SELECT * FROM ORDERS2;

-- 테이블의 제거
DROP TABLE ORDERS2 purge; -- purge 는 생략 가능
-- purge 가 없이 삭제된 테이블은 나중에 휴지통과 같이 복구가 가능
-- purge 를 사용하면 완전 삭제
SELECT * FROM ORDERS2;

SELECT * FROM ORDERS1;

