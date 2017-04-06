--멤버 코드 : 판매자, 구매자
create table memberCode(
   mcode number primary key,
   mtype varchar2(100) not null
)
drop table memberCode

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
drop table member cascade constraints

alter table member 
drop constraint fk_mcode

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
insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(1,'가죽지갑1',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');



--상품리스트 출력
drop table product

select * from product
select p.*
from (select pno,pname,price,total_amount,simple_info,detail_info,maker_id,row_number() over(order by pno desc) as rnum from product) p where rnum between '1' and '4'



----------------------------------------------------------------------------------------------------------------------------------------

--회원코드 테이블
create table member_code(
   mcode varchar2(100) primary key,
   mtype varchar2(100) not null
)

--구매자 테이블
drop table buyer;
create table buyer(
   buyer_id varchar2(100) primary key,
   password varchar2(100) not null,
   buyer_name varchar2(100) not null,
   buyer_add varchar2(100) not null,
   buyer_tel   varchar2(100) not null,
   mcode varchar2(100) not null,
   constraint fk_buyer_mcode foreign key (mcode) references member_code(mcode)
)
 insert into buyer(buyer_id,password,buyer_name,buyer_add,buyer_tel,mcode)
 values ('java','1234','김문일','판교','010','2');
--판매자 테이블
drop table maker;
create table maker(
   maker_id varchar2(100) primary key,
   password varchar2(100) not null,
   maker_name varchar2(100) not null,
   maker_bname varchar2(100) not null, --상호명
   maker_add varchar2(100) not null,
   maker_tel    varchar2(100) not null,
   maker_account varchar2(100) not null,
   mcode varchar2(100) not null,
   constraint fk_maker_mcode foreign key (mcode) references member_code(mcode)
)
insert into maker(maker_id,password,maker_name,maker_bname,maker_add,maker_tel,maker_account,mcode)
--상품테이블
alter table semi_product
drop constraint fk_maker_id

drop table semi_product;
create table semi_product(
   pno number primary key,
   pname varchar2(100) not null,
   price number not null,
   total_amount number not null,
   simple_info varchar2(100) not null,
   detail_info clob not null,
   maker_id varchar2(100) not null,
   constraint fk_maker_id foreign key (maker_id) references maker(maker_id)
)


--거래(주문)
alter table TRANSACTION
drop constraint fk_pno

alter table TRANSACTION
drop constraint fk_buyer_id
drop table transaction;
create table transaction(
   tno number primary key,
   pno number not null, 
   constraint fk_pno foreign key (pno) references semi_product(pno),
   amount number not null,
   tdate date not null,
   buyer_id varchar2(100) not null, 
   constraint fk_buyer_id foreign key (buyer_id) references buyer(buyer_id),
   pro_state varchar2(100) default '입금대기'
)


--배송정보
drop table delivery;
create table delivery(
   tno number primary key,
   constraint fk_tstate_tno foreign key(tno) references transaction(tno),
   receiver varchar2(100) not null,
   destination varchar2(100) not null,
   contact varchar2(100) not null
)
--판매자 코드
insert into member_code(mcode,mtype)values('1','판매자');
insert into member_code(mcode,mtype)values('2','구매자');
--판매자 등록
insert into maker(maker_id,password,maker_name,maker_bname,maker_add,maker_tel,maker_account,mcode)
values('java','1234','구찌','구찌','판교','010','123','1')
--상품추가;
insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(1,'가죽지갑1',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(2,'가죽지갑2',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(3,'가죽지갑3',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(4,'가죽지갑4',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(5,'가죽지갑5',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(6,'가죽지갑6',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(7,'가죽지갑7',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(8,'가죽지갑8',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(9,'가죽지갑9',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(10,'가죽지갑10',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');

insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(11,'가죽지갑11',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(12,'가죽지갑12',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(13,'가죽지갑13',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(14,'가죽지갑14',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(15,'가죽지갑15',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(16,'가죽지갑16',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(17,'가죽지갑17',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(18,'가죽지갑18',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(19,'가죽지갑19',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(20,'가죽지갑20',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 
insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(21,'가죽지갑21',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(22,'가죽지갑22',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(23,'가죽지갑23',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(24,'가죽지갑24',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(25,'가죽지갑25',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(26,'가죽지갑26',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(27,'가죽지갑27',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(28,'가죽지갑28',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(29,'가죽지갑29',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(30,'가죽지갑30',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');


insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(31,'가죽지갑31',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(32,'가죽지갑32',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(33,'가죽지갑33',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(34,'가죽지갑34',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(35,'가죽지갑35',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(36,'가죽지갑36',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(37,'가죽지갑37',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(38,'가죽지갑38',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(39,'가죽지갑39',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');
 insert into semi_product(pno,pname,price,total_amount,simple_info,detail_info,maker_id)
values(40,'가죽지갑40',35000,5,'핸드메이드 가죽지갑','조녜가죽지갑임','java');


--등록상품 조회
select p.*
from (select pno,pname,price,total_amount,simple_info,detail_info,maker_id,row_number() over(order by pno desc) as rnum from semi_product) p where rnum between '1' and '4'
select p.pno,p.pname,p.price,p.total_amount,p.simple_info,p.detail_info,maker_id
from (select pno,pname,price,total_amount,simple_info,detail_info,maker_id,row_number() over(order by pno desc) as rnum from semi_product) p where rnum between '1' and '4'

--등록상품 detail_info 이미지주소로 변경
update semi_product set detail_info='uploadImg/카드지갑.jpg' where maker_id='java';

select * from semi_product
