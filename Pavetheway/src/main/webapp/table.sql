CREATE TABLE inquiry_board(
   num NUMBER PRIMARY KEY, --글번호
   writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
   title VARCHAR2(100) NOT NULL, --제목
   content CLOB(4000), --글 내용
   regdate DATE --글 작성일
);

CREATE SEQUENCE inquiry_board_seq;

CREATE TABLE shop_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   writer VARCHAR2(100), --댓글 작성자의 아이디
   content VARCHAR2(500), --댓글 내용
   target_id VARCHAR2(100), --댓글의 대상자 아이디
   ref_group NUMBER,
   comment_group NUMBER,
   deleted CHAR(3) DEFAULT 'no',
   regdate DATE
);


CREATE SEQUENCE shop_comment_seq; 

CREATE TABLE inquiry_comment(
   num NUMBER PRIMARY KEY, --댓글의 글번호
   writer VARCHAR2(100), --댓글 작성자의 아이디
   content VARCHAR2(500), --댓글 내용
   target_id VARCHAR2(100), --댓글의 대상자 아이디
   ref_group NUMBER,
   comment_group NUMBER,
   deleted CHAR(3) DEFAULT 'no',
   regdate DATE
);

CREATE SEQUENCE inquiry_comment_seq;

-- 상품 테이블 
CREATE TABLE shop_list(
   num NUMBER PRIMARY KEY,
   code NUMBER PRIMARY KEY, --상품번호
   name VARCHAR2(100), --상품이름
   price NUMBER, --상품 가격
   category VARCHAR2(100), --분류
   imagePath VARCHAR2(100), -- 업로드된 이미지의 경로  ex) /upload/xxx.jpg
   infoImagePath VARCHAR2(100), --상품 정보 이미지
   viewcount NUMBER
);

CREATE SEQUENCE shop_list_seq;




-- 배송정보
CREATE TABLE client_order(
   num NUMBER PRIMARY KEY, -- 주문번호
   id VARCHAR2(100), -- 주문 고객의 아이디
   code NUMBER, -- 주문한 상품의 번호 
   addr VARCHAR2(100) -- 배송 주소
);

-- 주문 테이블에 사용할 시퀀스 
CREATE SEQUENCE client_order_seq;

--장바구니
CREATE TABLE cart(
   num NUMBER PRIMARY KEY,
   id VARCHAR2(100) NOT NULL,
   code NUMBER NOT NULL,
   amount NUMBER DEFAULT 0
);