create table equipment_list_14
(
	equipment_no char(6), not null primary key , 
	equipment_name varchar2(50) , 
	equipment_group char(1),
	equipment_price number,
	reg_date date ,
);