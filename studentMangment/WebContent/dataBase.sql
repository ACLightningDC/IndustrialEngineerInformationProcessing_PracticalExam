create table student_tbl_01 (
	student_no number not null ,
	student_name varchar2(20) not null primary key,
	student_addr varchar2(100) ,
	student_phone varchar2(14),
	studnet_birth date ,
	student_email varchar(50),
	student_id varchar2(12) unique,
	student_pw varchar2(50)
);

insert into STUDENT_TBL_01 values(201801 , '이기자','경산지 진량읍' , '011222333','01/09/26','abc@naver.com','','');
insert into STUDENT_TBL_01 values(201802 , '김을동','대구시 수성구 수성1기' , '010444555','97/05/19','asd@chol.net','','');
insert into STUDENT_TBL_01 values(201803 , '김의선','제주도 제주시 외나무골' , '054111222','02/09/06','qwe@gmail.com','','');

select * from STUDENT_TBL_01;

create table subject_tbl_01
(
	subject_seq varchar(10) not null primary key ,
	subject_startdate date ,
	subject_enddate date ,
	subject_name varchar2(50),
	subject_desc clob ,
	subject_teacher varchar2(12)
);

insert into subject_tbl_01 values('C001','18/09/01','18/09/21','자바프로그래밍','','p04');
insert into subject_tbl_01 values('C002','18/09/05','18/09/26','안드로이드프로그래밍','','p02');
insert into subject_tbl_01 values('D001','18/10/01','18/10/21','HTML/CSS','','p04');
insert into subject_tbl_01 values('D002','18/10/01','18/10/10','운영체제','','p02');

create table register_tbl_01
(
	register_seq number not null primary key ,
	student_no number ,
	subject_seq varchar2(10),
	register_date date ,
	register_status char(1) default '0'
);

insert into register_tbl_01 values(1,201801,'c001','18/08/30','0');
insert into register_tbl_01 values(2,201802,'c001','18/08/30','0');
insert into register_tbl_01 values(3,201801,'c001','18/09/02','1');
insert into register_tbl_01 values(4,201803,'c001','18/09/02','2');
insert into register_tbl_01 values(5,201803,'c002','18/09/03','1');

/* studentSelect.jsp */
select 