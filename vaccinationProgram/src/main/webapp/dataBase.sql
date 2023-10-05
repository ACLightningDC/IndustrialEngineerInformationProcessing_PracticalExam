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
|| '('||to_date(substr(p_birth,1,4) ,'yyyy')||')',
p_gender ,
p_tel1||'-'||p_tel2||'-'||p_tel3 , 
p_city
from tbl_cust_201004;

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