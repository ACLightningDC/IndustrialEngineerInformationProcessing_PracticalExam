create table tbl_cust_201004(
p_no char(4) not null primary key ,
p_name varchar2(20),
p_birth char(8),
p_gender char(1),
p_tel1 char(3),
p_tel2 char(4),
p_tel3 char(4),
p_city char(2)
);

insert into tbl_cust_201004 values('1001','김고객','19850301','M','010','2222','0001','10');
insert into tbl_cust_201004 values('1002','이고객','19900301','M','010','2222','0002','20');
insert into tbl_cust_201004 values('1003','박고객','19770301','F','010','2222','0003','30');
insert into tbl_cust_201004 values('1004','조고객','19650301','F','010','2222','0004','10');
insert into tbl_cust_201004 values('1005','황고객','19400301','M','010','2222','0005','40');
insert into tbl_cust_201004 values('1006','양고객','19440301','F','010','2222','0006','40');
insert into tbl_cust_201004 values('1007','허고객','19760301','F','010','2222','0007','10');

select p_no , p_name ,
to_char(to_date(p_birth ,'yyyymmdd'),'YYYY"년"MM"월"DD"일"')
|| '('||trunc(months_between('20200101',to_date(p_birth ,'yyyymmdd'))/12,0)||')',
decode(p_gender ,'M','남','F','여'),
p_tel1||'-'||p_tel2||'-'||p_tel3 , 
decode(p_city, '10','서울','20','경기','30','강원','40','대구')
from tbl_cust_201004;

select to_char(sysdate, 'yyyy')-substr(p_birth,1,4) as p_age
from tbl_cust_201004;

select trunc(months_between('20200101',to_date(p_birth ,'yyyymmdd'))/12,0) from tbl_cust_201004;
select trunc(months_between(sysdate , '20200000'),0) from tbl_cust_201004;
create table tbl_injection_201004
(
i_code char(4) not null primary key,
i_name varchar2(20),
i_age varchar2(20)
);

insert into tbl_injection_201004 values('A001' , 'A형간염','19세~39세');
insert into tbl_injection_201004 values('A002' , 'TD백신','40세~49세');
insert into tbl_injection_201004 values('A003' , '인플루엔자','50세~64세');
insert into tbl_injection_201004 values('A004' , '페렴사슬알균','65세 이상');

create table tbl_order_201004
(
p_send number(8) not null primary key,
p_no char(4) ,
i_code char(4),
p_date date
);

select substr(p_send , 1,4)||'-'||substr(p_send,5,4),p_no,p_name,i_code,i_name,to_char(p_date,'yyyy-mm-dd')
from tbl_order_201004 join tbl_cust_201004 using (p_no) join tbl_injection_201004 using(i_code) order by p_no asc ,i_code desc;

select i_code , i_name , count(i_code) 
from tbl_injection_201004 join tbl_order_201004 using(i_code)
group by i_code , i_name
order by i_code desc;


select * 
from tbl_injection_201004 join tbl_order_201004 using(i_code);


insert into tbl_order_201004 values('20200001' ,'1001','A001','2020-01-01');
insert into tbl_order_201004 values('20200002' ,'1002','A001','2020-01-02');
insert into tbl_order_201004 values('20200003' ,'1003','A001','2020-01-03');
insert into tbl_order_201004 values('20200004' ,'1004','A001','2020-01-04');
insert into tbl_order_201004 values('20200005' ,'1005','A002','2020-01-05');
insert into tbl_order_201004 values('20200006' ,'1006','A003','2020-01-06');
insert into tbl_order_201004 values('20200007' ,'1007','A001','2020-01-07');
insert into tbl_order_201004 values('20200008' ,'1005','A003','2020-01-08');
insert into tbl_order_201004 values('20200009' ,'1006','A003','2020-01-09');
insert into tbl_order_201004 values('20200010' ,'1006','A004','2020-01-10');