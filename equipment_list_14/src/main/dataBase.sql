create table equipment_list_14
(
	equipment_no char(6), not null primary key , 
	equipment_name varchar2(50) , 
	equipment_group char(1),
	equipment_price number,
	reg_date date ,
	equipmnet_status char(1),
	equipment_unit varchar2(20)
);

insert into equipment_list_14 values ('170001' ,'의자' ,'2' , 50000, '17/04/06',  'Y' , '개');
insert into equipment_list_14 values ('170002' ,'책상' ,'2' , 50000, '17/04/06',  'Y' , '개');
insert into equipment_list_14 values ('170003' ,'사무PC' ,'2' , 50000, '17/04/06',  'Y' , '대');
insert into equipment_list_14 values ('170004' ,'복합기' ,'2' , 50000, '17/04/06',  'Y' , '대');
insert into equipment_list_14 values ('170005' ,'서랍장' ,'2' , 50000, '17/04/06',  'Y' , '개');
insert into equipment_list_14 values ('170006' ,'A4용지' ,'2' , 50000, '17/04/06',  'Y' , 'BOX');
insert into equipment_list_14 values ('170007' ,'B5용지' ,'2' , 50000, '17/04/06',  'Y' , 'BOX');


create table equipment_postulat_14
(
req_no number not null primary key ,
equipment_no char(6) not null,
req_date date ,
req_qty number,
req_dept char(2)
);

insert into equioment_postulat_14 (10001,'170001', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10002,'170002', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10003,'170001', '18/02/12' ,10 ,'A1');
insert into equioment_postulat_14 (10004,'170002', '18/02/12' ,10 ,'A1');
insert into equioment_postulat_14 (10005,'170006', '18/02/14' ,10 ,'A1');
insert into equioment_postulat_14 (10006,'170007', '18/03/03' ,10 ,'A1');
insert into equioment_postulat_14 (10007,'170007', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10008,'170006', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10009,'170006', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10010,'170006', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10011,'170007', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10012,'170005', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10013,'170007', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10014,'170007', '17/12/01' ,10 ,'A1');
insert into equioment_postulat_14 (10015,'170004', '17/12/01' ,10 ,'A1');
