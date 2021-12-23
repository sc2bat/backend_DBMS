-- 스키마 이름 붙여줘야됨 
-- ` 필드명에 굳이 안붙여줘도됨

CREATE TABLE `scott`.`booklist` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `subject` VARCHAR(100) NOT NULL,
  `makeyear` INT NOT NULL,
  `inprice` INT NOT NULL,
  `rentprice` INT NOT NULL,
  `grade` VARCHAR(6) NULL DEFAULT 'all', -- null 널값도 허용가능
  PRIMARY KEY (`num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '도서 목록'; -- ; 한몸인 구문 끝에 세미콜론

SELECT * FROM booklist;

SELECT * FROM scott.booklist;
-- AUTO_INCREMENT : 오라클의 SEQUENCE 를 대신하는 자동숫자 증가 옵션
-- VARCHAR2 는 없고, VARCHAR 가 가변 길이 문자를 나타냅니다
-- CONSTRAINT 없이 제약 사항을 표시합니다.
-- 테이블 이름 앞에 `스키마이름`.  을 반드시 붙여서 사용합니다

-- 자주 쓰는 자료형
-- INT : 정수 자료형 (FLOAT, DOUBLE 은 실수)
-- VARCHAR : 문자열 자료형, 가변 길이(CHAR 은 고정 길이)
-- TEST : 긴 문자열은 TEXT 로 별도 저장
-- DATETIME : 날짜 자료형 저장
-- TINYINT : -128 ~ 127 까지 저장하지만 여기서는 1 또는 0만 저장해 불 값 표현

-- 자주 쓰는 제약 조건
-- NOT NULL : 빈 값은 받지 않는다는 뜻 (NULL 은 빈값 허용)
-- AUTO_INCREMENT : 숫자 자료형인 경우 다음 로우가 저장될 때 자동으로 1 증가
-- UNSIGNED : 0 과 양수만 허용
-- ZEROFILL : 숫자의 자리 수가 고정된 경우 빈 자리에 0을 넣음
-- DEFAULT now() : 날짜 컬럼의 기본값을 현재 시간으로




-- 연습문제
-- 아래의 필드명을 담은 memberlist 테이블을 생성하세요
--필드명 : num(int, 자동증가, 기본키), name(varchar(30), not null), Birth(date, not null), 
--bpoint(int), joindate(date, 기본값 now()), age(int), gender(varchar(3))
--테이블 comment : 회원목록
--기본 문자 set : utf-8mb4
-- 워크 벤치에서 테이블을 생성하는 명령을 복사해서 이클립스에 복붙 생성

--CREATE TABLE `scott`.`memberlist` (
--  `num` INT NOT NULL AUTO_INCREMENT,
--  `name` VARCHAR(30) NOT NULL,
--  `Birth` DATE NOT NULL,
--  `bpiont` INT NOT NULL,
--  `joindate` DATE NOT NULL DEFAULT now(),
--  `age` INT NULL,
--  `gender` VARCHAR(3) NULL,
--  PRIMARY KEY (`num`))
--ENGINE = InnoDB
--DEFAULT CHARACTER SET = utf8mb4
--COMMENT = '회원 목록';

-- DATE -> DATETIME
CREATE TABLE `scott`.`memberlist` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `Birth` DATETIME NOT NULL,
  `bpiont` INT NOT NULL,
  `joindate` DATETIME NOT NULL DEFAULT now(),
  `age` INT NULL,
  `gender` VARCHAR(3) NULL,
  PRIMARY KEY (`num`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '회원 목록';


ALTER TABLE `scott`.`memberlist` 
ADD COLUMN `phone` VARCHAR(45) NOT NULL AFTER `name`,
CHANGE COLUMN `bpiont` `bpiont` INT NOT NULL DEFAULT 0 ;


SELECT * FROM memberlist;

-- 연습문제
-- 테이블 이름 : rentlist
-- 필드 : rentdate(datetime, default now()), numseq(int, AI), booknum(int)
-- 			membernum(int), discount(int)

-- 테이블 comment : 매출 목록
-- 기본 문자 set : utf-8mb4
-- 워크 벤치에서 테이블 생성하는 명령을 복붙 이클립스

CREATE TABLE `scott`.`rentlist` (
  `rentdate` DATETIME NOT NULL DEFAULT now(),
  `numseq` INT NOT NULL AUTO_INCREMENT,
  `booknum` INT NOT NULL,
  `membernum` INT NOT NULL,
  `discount` INT NULL DEFAULT 0,
  PRIMARY KEY (`numseq`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COMMENT = '매출 목록';

ALTER TABLE `scott`.`rentlist` 
CHANGE COLUMN `numseq` `num` INT NOT NULL AUTO_INCREMENT ;

SELECT * FROM rentlist;

-- 외래키 생성

-- 인덱스가 생성됨
ALTER TABLE `scott`.`rentlist` 
CHANGE COLUMN `num` `num` INT NOT NULL AUTO_INCREMENT ,
ADD INDEX `fk1_idx` (`booknum` ASC) VISIBLE,
ADD INDEX `fk2_idx` (`membernum` ASC) VISIBLE;
;
-- 외래키 생성
ALTER TABLE `scott`.`rentlist` 
ADD CONSTRAINT `fk1`
  FOREIGN KEY (`booknum`)
  REFERENCES `scott`.`booklist` (`num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
ADD CONSTRAINT `fk2`
  FOREIGN KEY (`membernum`)
  REFERENCES `scott`.`memberlist` (`num`)
  ON DELETE CASCADE
  ON UPDATE CASCADE;




