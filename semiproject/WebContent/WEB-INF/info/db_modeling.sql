--멤버 코드 : 판매자, 구매자
create table memberCode(
   mcode number primary key,
   mtype varchar2(100) not null
)

insert into memberCode(mcode,mtype) values(101,'maker');
insert into memberCode(mcode,mtype) values(102,'buyer');

drop table member;
-- 멤버 테이블
create table member(
   id varchar2(100) primary key,
   password varchar2(100) not null,
   mname varchar2(100) not null,
   address varchar2(100) not null,
   tel varchar2(100) not null,
   account varchar2(100),
   mcode number not null,
   constraint fk_mcode foreign key (mcode) references memberCode
)
--회원가입
insert into member(id,password,mname,address,tel,account,mcode) values('java','1234','박다혜','군산','010','91127071169',101);
insert into member(id,password,mname,address,tel,mcode) values('spring','1234','윤다혜','답십리','011',102);

drop table product;
--상품
create table product(
   pno number primary key,
   pname varchar2(100) not null,
   price number not null,
   total_amount number not null,
   simple_info varchar2(100) not null,
   detail_info clob not null,
   maker_id varchar2(100) not null,
   constraint fk_maker_id foreign key (maker_id) references member(id)
)
--상품등록
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(1,'팔찌',30000,3,'팔찌임당','18k입니당','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(2,'가죽지갑',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');

--상품번호 생성
create sequence pno_seq nocache;

--처리코드
create table processCode(
   pcode number primary key,
   pstate varchar2(100) not null
)
insert into processCode(pcode,pstate) values (201,'입금대기');
insert into processCode(pcode,pstate) values (202,'입금완료');
insert into processCode(pcode,pstate) values (203,'배송준비중');
insert into processCode(pcode,pstate) values (204,'배송중');
insert into processCode(pcode,pstate) values (205,'배송완료');
select * from processCode;

--거래
drop table transaction;
create table transaction(
   tno number primary key,
   amount number not null,
   tdate date not null,
   pcode number default 201, constraint fk_pcode foreign key (pcode) references processCode(pcode),
   pno number not null, constraint fk_pno foreign key (pno) references product(pno),
   buyer_id varchar2(100) not null, constraint fk_buyer_id foreign key (buyer_id) references member(id),
   destination  varchar2(100) not null,
   contact varchar2(100) not null
)

--거래내역
insert into transaction(tno,amount,tdate,pno,buyer_id,destination,contact) 
values(1,2,sysdate,2,'spring','답십리','011');
--상품리스트
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(3,'가죽지갑3',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(4,'가죽지갑4',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(5,'가죽지갑5',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(6,'가죽지갑6',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(7,'가죽지갑7',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(8,'가죽지갑8',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(9,'가죽지갑9',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(10,'가죽지갑10',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');

--상품리스트 출력
select * from product

