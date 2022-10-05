-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- CGV_MEMBER Table Create SQL
CREATE TABLE CGV_MEMBER
(
    ID                  VARCHAR2(200)    NOT NULL, 
    PASSWORD            VARCHAR2(200)    NULL, 
    NAME                VARCHAR2(200)    NULL, 
    PHONE_NUMBER        VARCHAR2(200)    NULL, 
    EMAIL               VARCHAR2(200)    NULL, 
    AUTH                NUMBER(20)       NULL, 
    REGISTER_DATE       DATE             NULL, 
    UN_REGISTER_DATE    DATE             NULL, 
    CONSTRAINT CGV_MEMBER_PK PRIMARY KEY (ID)
)


-- CGV_MEMBER Table Create SQL
CREATE TABLE CGV_RESERVE
(
    ID                  VARCHAR2(200)    NULL, 
    RESERVE_SEQ         NUMBER(20)       NOT NULL, 
    TITLE               VARCHAR2(200)    NULL, 
    RUNNING_TIME        VARCHAR2(200)    NULL, 
    MOVIE_AGE           VARCHAR2(200)    NULL, 
    MOVIE_DATE          VARCHAR2(200)    NULL, 
    RESERVE_DATE        DATE             NULL, 
    TICKET_NUMBER       NUMBER(20)       NULL, 
    SELECTED_SEAT       VARCHAR2(200)    NULL, 
    SELECTED_THEATER    VARCHAR2(200)    NULL, 
    CONSTRAINT CGV_RESERVE_PK PRIMARY KEY (RESERVE_SEQ)
)
/

CREATE SEQUENCE CGV_RESERVE_SEQ
START WITH 1
INCREMENT BY 1;


ALTER TABLE CGV_RESERVE
    ADD CONSTRAINT FK_CGV_RESERVE_ID_CGV_MEMBER_I FOREIGN KEY (ID)
        REFERENCES CGV_MEMBER (ID)
/


-- CGV_MEMBER Table Create SQL
CREATE TABLE CGV_PAY
(
    ID             VARCHAR2(200)    NULL, 
    RESERVE_SEQ    NUMBER(20)       NULL, 
    PAY_DATE       DATE             NULL, 
    PAY_MONEY      VARCHAR2(200)     NULL   
)




ALTER TABLE CGV_PAY
    ADD CONSTRAINT FK_CGV_PAY_RESERVE_SEQ_CGV_RES FOREIGN KEY (RESERVE_SEQ)
        REFERENCES CGV_RESERVE (RESERVE_SEQ)
/

ALTER TABLE CGV_PAY
    ADD CONSTRAINT FK_CGV_PAY_ID_CGV_MEMBER_ID FOREIGN KEY (ID)
        REFERENCES CGV_MEMBER (ID)
/


CREATE TABLE GUEST_MEMBER (
  id number(10) NOT NULL,
  name varchar2(200) DEFAULT NULL,
  email varchar2(200) DEFAULT NULL,
  phoneNumber varchar2(200) DEFAULT NULL,
  password varchar2(200) DEFAULT NULL,
  createdAt timestamp(0) DEFAULT NULL,
  PRIMARY KEY (id)
)   ;

-- Generate ID using sequence and trigger
CREATE SEQUENCE GUEST_MEMBER_seq START WITH 4 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER GUEST_MEMBER_seq_tr
 BEFORE INSERT ON GUEST_MEMBER FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT GUEST_MEMBER_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
//CGV_PAY 테이블에서 프라이머리 키 제약조건 삭제 외래키 삭제
//CGV_RESERVE 테이블에서 외래키 조건 삭제
DROP TABLE mp_reply;
DROP TABLE MP_BOARD;

-- 게시판 테이블 생성
CREATE TABLE MP_BOARD(
    BNO       NUMBER NOT NULL,
    TITLE   VARCHAR2(100)   NOT NULL,
    CONTENT VARCHAR2(2000)  NOT NULL,
    WRITER VARCHAR2(200)   NOT NULL,
    REGDATE DATE            DEFAULT SYSDATE,
    SECRET  INT    DEFAULT  0,
    PRIMARY KEY (BNO)
    )

-- 시퀀스 추가
CREATE SEQUENCE MP_BOARD_SEQ
START WITH 1
INCREMENT BY 1;

-- 외래키 추가
ALTER TABLE MP_BOARD
ADD CONSTRAINTS FK_BOARD_WRITER FOREIGN KEY(WRITER) REFERENCES CGV_MEMBER(ID)
ON DELETE CASCADE;

-- 샘플 데이터 넣기
INSERT INTO MP_BOARD(BNO, TITLE, CONTENT, WRITER)
     VALUES (MP_BOARD_SEQ.NEXTVAL, '제목입니다', '내용입니다', 'syb123');

SELECT * FROM MP_BOARD;


-- 댓글 테이블 생성
create table mp_reply (
    bno number not null,
    rno number not null,
    content varchar2(1000) not null,
    writer varchar2(200) not null,
    regdate date default sysdate,
    primary key(bno, rno)
);

-- 시퀀스 추가
create sequence mp_reply_seq START WITH 1 MINVALUE 0;

-- 외래키 추가
alter table mp_reply add constraint mp_reply_bno foreign key(bno)
references mp_board(bno)
ON DELETE CASCADE;

ALTER TABLE mp_reply
ADD CONSTRAINTS FK_REPLY_WRITER FOREIGN KEY(WRITER) REFERENCES CGV_MEMBER(ID)
ON DELETE CASCADE;

-- 제약조건 조회
SELECT *
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'MP_REPLY';

-- 페이징 테스트를 위한 더미 데이터 생성
insert into mp_board(bno, title, content, writer)
select mp_board_seq.nextval, title, content, writer from mp_board;

commit;