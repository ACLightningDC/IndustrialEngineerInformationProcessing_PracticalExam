create table member_tbl_02
(
custno number(6) primary key,
custname varchar2(20),
phone varchar2(13),
address varchar2(60),
joindate date,
grade char(1),
city char(2)
);

insert into member_tbl_02 values('100001','김행복','010-1111-2222','서울 동대문구 휘경1동','20151202','A','01');
insert into member_tbl_02 values('100002','이축복','010-1111-3333','서울 동대문구 휘경2동','20151202','A','01');
insert into member_tbl_02 values('100003','장믿음','010-1111-4444','울릉군 울릉읍 독도1리','20151202','A','01');
insert into member_tbl_02 values('100004','최사랑','010-1111-5555','울릉군 울릉읍 독도2리','20151202','A','01');
insert into member_tbl_02 values('100005','진평화','010-1111-6666','제주도 제주시 외나무골','20151202','A','01');
insert into member_tbl_02 values('100006','차공단','010-1111-7777','제주도 제주시 감나무골','20151202','A','01');


create table money_tbl_02
(
custno number(6) ,
salenol number(8) ,
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date,
primary key(custno, salenol)
);



insert into money_tbl_02 values('100001','2016001','500','5','2500','A001','20160101');
insert into money_tbl_02 values('100001','2016002','1000','4','4000','A002','20160101');
insert into money_tbl_02 values('100001','2016003','500','3','1500','A008','20160101');
insert into money_tbl_02 values('100002','2016004','2000','1','2000','A004','20160102');
insert into money_tbl_02 values('100002','2016005','500','1','500','A001','20160103');
insert into money_tbl_02 values('100003','2016006','1500','2','3000','A003','20160103');
insert into money_tbl_02 values('100004','2016007','500','2','1000','A001','20160104');
insert into money_tbl_02 values('100004','2016008','300','1','300','A005','20160104');
insert into money_tbl_02 values('100004','2016009','600','1','600','A006','20160104');
insert into money_tbl_02 values('100004','2016010','3000','1','3000','A007','20160106');

drop table money_tbl_02;

select * from member_tbl_02; 
select * from money_tbl_02; 

select custno , custname , phone , address , to_char(joindate ,'YYYY-MM-DD'),decode(grade,'A','VIP','B','일반','C','직원') ,city

drop table member_tbl_02;
drop table money_tbl_02;
select * from MONEY_TBL_02;
select MAX(custno)+1 as custno from member_tbl_02;

select MAX(custno)+1 as custno, to_char(sysdate,'yyyy-mm-dd' as joindate) from member_tbl_02;

select custno , custname , phone , address , to_char(joindate ,'yyyy-mm-dd')as joindate,decode(grade,'A','VIP','B','일반','C','직원')as grade,city
from member_tbl_02
where custno = '100001';

select NVL(MAX(custno),0)+1 as custno,
to_char(sysdate,'yyyymmdd') as joindate 
from member_tbl_02;

update member_tbl_02
set custno = , custname = , phone =, address =, joindate =, grade =,city =
select custno = ;

update member_tbl_02
set city = '20'
where custno = '100005';

delete member_tbl_02
where custno = ;

select custno , custname ,decode(grade,'A','VIP','B','일반','C','직원')as grade , to_char(sum(price) ,'L999,999,999')as totalprice
from member_tbl_02 join money_tbl_02
using(custno)
group by custno , custname , grade
order by totalprice desc;

select *
from member_tbl_02 natural join money_tbl_02;
