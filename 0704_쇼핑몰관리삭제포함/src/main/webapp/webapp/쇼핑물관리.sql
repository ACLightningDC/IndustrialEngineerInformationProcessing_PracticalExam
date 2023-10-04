--1. 회원정보 테이블 ----

create table member(
memno char(4) primary key,
name varchar2(30) not null,
address varchar2(100) not null,
hiredate date,
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4)
);

--insert 하기 전에 [문제]에서 sequence 생성
create sequence member_seq
start with 1001
increment by 1
minvalue 1001;

insert into member values(member_seq.nextval ,'김고객','경북 경산시 중방동' ,'02/01/01','F','010','1234','1001');
insert into member values(member_seq.nextval ,'이고객','경북 경산시 상북동' ,'02/02/01','M','010','1234','1002');
insert into member values(member_seq.nextval ,'박고객','경북 경산시 옥산동' ,'02/03/01','M','010','1234','1003');
insert into member values(member_seq.nextval ,'조고객','경북 경산시 달서구' ,'02/04/01','M','010','1234','1004');
insert into member values(member_seq.nextval ,'유고객','경북 경산시 유성구' ,'02/05/01','M','010','1234','1005');
insert into member values(member_seq.nextval ,'여고객','경북 경산시 수성구' ,'02/06/01','M','010','1234','1006');
insert into member values(member_seq.nextval ,'남고객','경북 경산시 중도리' ,'02/07/01','F','010','1234','1007');
insert into member values(member_seq.nextval ,'황고객','경북 경산시 관악구' ,'02/08/01','F','010','1234','1008');
insert into member values(member_seq.nextval ,'전고객','경북 경산시 강서구' ,'02/09/01','F','010','1234','1009');

select * from member;

--insert.jsp 텍스트
select nvl(MAX(memno),1000)+1 as "memno"
from member;

select sysdate
from dual;

select to_char(sysdate, 'yyyy-mm-dd') as hiredate from dual;

--2. 등급정보 테이블 -------------------------------
create table grade(
memgrade number(1),
loprice number(30) not null,
hiprice number(30) not null
);

insert into grade values(1 , 150001 , 500000);
insert into grade values(2 , 100001 , 150000);
insert into grade values(3 , 50001 , 100000);
insert into grade values(4 , 1, 50000);

select * from grade;

--5. 매출정보 테이블 ----------------------------
create table buy(
--primary key, --컬럼레벨
--primary key, --컬럼레벨
memno char(4),
prodno char(4),
product varchar2(20) not null,
price number(30),
bno number(30),
primary key(memno,prodno) -- 테이블 레벨 : 기본키 2개 이상일 때 많이 사용
);

insert into buy values('1009', '0001','긴 바지', 30000, 4);
insert into buy values('1009', '0002','점퍼', 100000, 1);
insert into buy values('1006', '0004','긴팔 셔츠', 25000, 1);
insert into buy values('1006', '0002','점퍼', 100000, 1);
insert into buy values('1005', '0003','긴팔 셔츠', 20000, 3);
insert into buy values('1002', '0003','긴팔 셔츠', 20000, 2);
insert into buy values('1002', '0004','긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0004','긴팔 셔츠', 25000, 1);
insert into buy values('1001', '0005','긴팔 후드티', 23000, 2);

select * from buy;

--select.jsp

select memno , name ,address, 
to_char(hiredate, 'YYYY.MM.DD.') as hiredate, 
decode(gender,'M','남','F','여') as gender,
tel1||'-'||tel2||'-'||tel3 as tel  from member;

--case 
--when gender = 'F' then '여'
--when gender = 'M' then '남'
--end as gender,

select sum( price)
from (select distinct memno,price
from buy);
group by distinct prodno
;

select memno , sum(price)
from buy 
group by memno;

select *
from buy natural join member;

select memno , name ,  sum(price) as pricesum
from (select *
from buy natural join member) 
group by memno, name
order by  pricesum desc;

case when lowprice sum(price) 

case sum(price)

--update.jsp
select memno , name, address ,hiredate, gender, tel1, tel2, tel3
from member
where memno 

select memno, name, address,
to_char(hiredate, 'yyyy-mm--dd') as hiredate,
gender, --M,F
from member
where memno="1010";

update member
set name, address ,hiredate , gender, tel1 , tel2 , tel3
where memno

select memno , name , sum(price)
from member join buy
using(memno) 
group by memno ,name;

select * 
from member join buy
using(memno) ;

select memno , name , sum(price*bno) as sum
from member join buy
using(memno) 
group by memno ,name;

select 
decode(t2.memgrade ,'1','VIP', '2','Gold','3','Siver','Bronze'),
t1.memno , t1.name , t1.sum
from (
select memno , name , sum(price*bno) as sum
from member join buy
using(memno) 
group by memno ,name
) t1 
join grade t2 
on t1.sum between t2.loprice and t2.hiprice
order by t1.sum desc;

select memgrade, memno, name,
from grade join
(select memno , name , sum(price*bno) as totalprice
from member natural join buy
group by memno ,name)

delete member
where memno = 1010;

update member
set name='수정', address='123' ,hiredate='00-05-23' , gender='M', tel1='123' , tel2='1234' , tel3='1234'
where memno='1014';

select * from member;