create table tbl_teacher_202201 (
teacher_code char(3) not null primary key ,
teacher_name varchar2(15),
class_name varchar2(20),
class_price number(8),
teacher_regist_date varchar2(8)
);

insert into tbl_teacher_202201 values('100', '이초급' , '초급반' , 100000 , '20220101');
insert into tbl_teacher_202201 values('200', '김중급' , '중급반' , 200000 , '20220102');
insert into tbl_teacher_202201 values('300', '박고급' , '고급반' , 300000 , '20220103');
insert into tbl_teacher_202201 values('400', '정심화' , '심화반' , 400000 , '20220104');

create table tbl_memeber_202201 (
c_no char(5) not null primary key,
c_name varchar2(15),
phone varchar2(11),
address varchar2(50),
grade varchar2(6)
);

insert into tbl_memeber_202201 values('10001' , '홍길동' , '01011112222' , '서울시 강남구' ,'일반');
insert into tbl_memeber_202201 values('10002' , '장발장' , '01022223333' , '성남시 분당구' ,'일반');
insert into tbl_memeber_202201 values('10003' , '임꺽정' , '01033334444' , '대전시 유성구' ,'일반');
insert into tbl_memeber_202201 values('20001' , '성춘향' , '01044445555' , '부산시 서구' ,'VIP');
insert into tbl_memeber_202201 values('20002' , '이몽룡' , '01055556666' , '대구시 북구' ,'VIP');

create table tbl_class_202201(
regist_month varchar2(6) not null ,
c_no char(5) not null,
class_area varchar2(15),
tuition number(8),
teacher_code char(3)
constraint tbl_class_202201_PK primary key(regost_month , c_no);
);

insert into tbl_class_202201 values('202203','10001' ,'서울본원',100000 , '100');
insert into tbl_class_202201 values('202203','10001' ,'서울본원',100000 , '100');
insert into tbl_class_202201 values('202203','10001' ,'서울본원',200000 , '200');
insert into tbl_class_202201 values('202203','10001' ,'서울본원',150000 , '300');
insert into tbl_class_202201 values('202203','10001' ,'서울본원',200000 , '400');

select to_char( regist_month , 'YYYY"년"MM"월"') from tbl_class_202201;
select to_char(to_date(regist_month , 'YYYYMM'),'YYYY"년"MM"월"') from tbl_class_202201;

select teacher.teacher_code , teacher.class_name , teacher.teacher_name , sum(tuition) from tbl_teacher_202201 teacher join tbl_class_202201 class using (teacher_code) group by teacher.teacher_code , teacher.class_name , teacher.teacher_name ;
select teacher_code , class_name , teacher_name , to_char(sum(tuition) ,'L999,999,999')from tbl_teacher_202201 join tbl_class_202201 using (teacher_code) group by teacher_code , class_name , teacher_name ;