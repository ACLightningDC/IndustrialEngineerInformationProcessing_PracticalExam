create table movie_1 (
me_id varchar2(12) primary key,
me_pass varchar2(15) not null,
me_name varchar2(20) not null,
me_gender char(1),
birth date,
address varchar2(100),
tel varchar2(13)
);

insert into movie_1 values('kus1','sin1','김유신','M','2004-02-29','경북 경산시 중방동','010-1111-2222');
insert into movie_1 values('sgj2','joo2','신경주','M','2002-06-18','대구시 수성구 만촌동','010-1111-2222');
insert into movie_1 values('ymg3','me3','양미경','F','2000-01-01','경북 경산시 남첨녀','010-1111-2222');
insert into movie_1 values('kjs4','soo4','김지수','F','2005-11-22','경북 경산시 진량읍','010-1111-2222');
insert into movie_1 values('jsw5','jang5','장선우','M','1999-12-31','대구시 수성구 사월동','010-1111-2222');
insert into movie_1 values('gig6','go6','고인규','M','2002-06-24','경북 영천시 금호읍','010-1111-2222');
insert into movie_1 values('bsy7','year7','박시연','F','2008-08-28','경북 경산시 와촌읍','010-1111-2222');


create table movie_2
(
me_id varchar2(12) not null,
me_pass varchar2(15) not null,
mo_name varchar2(50) not null,
rm_date date not null
);

insert into movie_2 values('kus1','sin1','겨울왕국2','2019-11-25');
insert into movie_2 values('kus1','sin1','늑대아이','2019-09-20');
insert into movie_2 values('sgj2','joo2','겨울왕국2','2019-11-24');
insert into movie_2 values('ymg3','me3','김복동','2019-08-15');
insert into movie_2 values('ymg3','me3','썸머 워즈','2019-08-22');
insert into movie_2 values('kjs4','soo4','겨울왕국2','2019-11-28');
insert into movie_2 values('jsw5','jang5','김복동','2019-08-14');
insert into movie_2 values('gig6','go6','늑대아이','2019-09-20');
insert into movie_2 values('bsy7','year7','늑대아이','2019-09-20');
insert into movie_2 values('bsy7','year7','시간을 달리는 소녀','2019-10-20');

create table movie_3
(
mo_no number,
mo_name varchar2(50),
mo_poster varchar2(20), 
mo_limit varchar2(20) not null, 
mo_date date, 
mo_memo varchar2(100),
primary key(mo_no,mo_name)
);

insert into movie_3 values('1','겨울왕국2','겨울왕국.jsp','전체 관람가','2019-11-21','애니메이션 겨울왕국 2탄');
insert into movie_3 values('2','늑대아이','늑대아이.jsp','전체 관람가','2019-09-13','애니메이션 늑대아이');
insert into movie_3 values('3','김복동','김복동.jsp','12세 관람가','2019-08-08','위안부 피해자 고 김복동 할머니를 취재한 다큐멘터리');
insert into movie_3 values('4','시간을 달리는 소녀','시달소.jsp','전체 관람가','2019-01-14','애니메이션 시간을 달리는 소녀');
insert into movie_3 values('5','썸머 워즈','썸머워즈.jsp','전체 관람가','2019-08-13','애니메이션 썸머 워즈');
insert into movie_3 values('6','눈의 여왕','눈여왕.jsp','전체 관람가','2019-12-24','애니매이션 눈의 여왕 4탄');

select * from MOVIE_1 ;
select * from MOVIE_2 ;
drop table movie_1;

--select.jsp 용

select me_id ,me_name ,mo_name , mo_limit ,count(mo_no) as mo_c
from movie_1
join movie_2 using (me_id)
join movie_3 using(mo_name)
group by me_id ,me_name ,mo_name , mo_limit ;

--select2.jsp 용
select mo_name ,mo_limit, count(mo_no) as mo_c
from movie_2 join movie_3 using(mo_name)
group by mo_name , mo_limit;

select to_char(sysdate,'YYYY-MM-DD')
from dual;

select * from movie_1;
select * from movie_2;
select * from movie_3;

select me_pass
from MOVIE_1
where me_id = '0';