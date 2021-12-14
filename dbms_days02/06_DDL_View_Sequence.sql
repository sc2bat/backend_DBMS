-- * 오라클 - 뷰 (View)
-- - 물리적인 테이블에 근거한 논리적인 가상 테이블.
-- - 가상이란 단어는 실질적으로 데이터를 저장하고 있지 않기 때문에 붙인것이고, 
--		테이블이란 단어는 실질적으로 데이터를 저장하고 있지 않더라도 사용 계정자는 마치 
--		테이블을 사용하는 것과 동일하게 뷰를 사용할 수 있기 때문에 붙인 것입니다
-- - 뷰는 기본테이블에서 파생된 객체로서 기본테이블에 대한 하나의 쿼리문입니다
-- - 실제 테이블에 저장된 데이터를 뷰를 통해서 볼 수 있도록 합니다
-- - 사용자에게 주어진 뷰를 통해서 기본 테이블을 제한적으로 사용할 수 있습니다
-- - 뷰는 이미 존재하고 잇는 테이블에 제한적으로 접근하도록 합니다
-- - 뷰를 생성하기 위해서는 실질적으로 데이터를 저장하고 있는 물리적인 테이블이 존재해야 되는데 이 테이블은 기본테이블이라고 합니다
-- 두개 이상의 테이블 또는 한개의 테이블이나 또 다른 뷰를 참조하는 객체입니다 
-- 저장된 테이블이라기보다 공식 또는 select 문을 갖고 있다가 명령대로 불러와 그 때 그 때 구성하는 형식입니다 - 원본의 데이터 변화가 실시간으로 반영됩니다

-- 생성 방법
-- CREATE or REPLACE View 뷰이름 AS (SELECT 구문)
-- SELECT 명령 : 실제테이블의 부분집합(행 일부 또는 전부, 열일부 또는 전부)
-- SELECT 명령과 JOIN 명령 학습 후 다시 상세하게 공부할 예정입니다

-- * 오라클 - 시퀀스 (Sequence)
-- 		: 테이블 내의 유일한 숫자를 자동으로 생성하는 자동 번호 발생기.
-- 		: 테이블 생성 후 시퀀스(일련번호)를 따로 만들어야 한다.

-- 생성 방법
-- create sequence 시퀀스 이름 start with 시작 숫자 increment by 증가량;

-- 주로 number 형식에 기본키값으로 사용합니다
-- 일련번호정도로 이해하셔도 무방합니다
-- number( 자리수 ) : 자료형의 자리수가 몇자리냐에 따라 그만큼 숫자가 증가할 수 있습니다

-- [1] 시퀀스의 생성
CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;

INSERT INTO memberlist(num, name, phone)
VALUES(member_seq.nextVal, '홍길서', '010-3333-4444');

INSERT INTO memberlist(num, name, phone)
VALUES(member_seq.nextVal, '홍길남', '010-5555-6666');

INSERT INTO memberlist(num, name, phone)
VALUES(member_seq.nextVal, '홍길북', '010-7777-8888');

SELECT * FROM memberlist;
