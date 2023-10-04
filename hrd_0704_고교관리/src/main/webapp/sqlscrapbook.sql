--고교 성적관리
create table examtbl_1
(syear char(1), 
sclass char(2),
sno char(2),
sname varchar(20),
birth char(8),
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4),
primary key(syear , sclass , sno)
);

insert into examtbl_1 values('1','01','01','김학생','20020101','F','010','1234','1001');
insert into examtbl_1 values('1','01','02','이학생','20020201','M','010','1234','1002');
insert into examtbl_1 values('1','01','03','박학생','20020301','M','010','1234','1003');
insert into examtbl_1 values('1','02','01','조학생','20020401','M','010','1234','1004');
insert into examtbl_1 values('1','02','02','유학생','20020501','M','010','1234','1005');
insert into examtbl_1 values('1','02','03','여학생','20020601','M','010','1234','1006');
insert into examtbl_1 values('1','03','01','남학생','20020701','F','010','1234','1007');
insert into examtbl_1 values('1','03','02','황학생','20020801','F','010','1234','1008');
insert into examtbl_1 values('1','03','03','전학생','20020901','F','010','1234','1009');

select * from examtbl_1;

create table examtbl_2
(
syear char(1),
sclass char(2),
tname varchar2(20),
primary key(syear, sclass)
);

insert into examtbl_2 values('1','01','김교사');
insert into examtbl_2 values('1','02','이교사');
insert into examtbl_2 values('1','03','박교사');

select * from examtbl_2;

create table examtbl_3
(
syear char(1),
sclass char(2),
sno char(2),
kor number(3) check(kor between 0 and 100),
eng number(3) check(eng between 0 and 100),
math number(3) check(math between 0 and 100),
primary key(syear, sclass, sno)

constraint examtbl_3_fk foreign key(syear,sclass,sno) references examtbl_1(syear,sclass,sno) on delete cascade
);

--on delete cascade 오션을 적용하면 부모 테이블에서 row를 삭제할 경우 연결된 자식 테이블의 row 가 함께 삭제된다
--연결된 데이터를 한 번에 지을수 있어 데이터의 관리가 편리해지고 일관성을 유지할수 있다.


insert into examtbl_3 values('1','01','01','50','50','50');
insert into examtbl_3 values('1','01','02','60','40','100');
insert into examtbl_3 values('1','01','03','70','70','70');
insert into examtbl_3 values('1','02','01','80','80','80');
insert into examtbl_3 values('1','02','02','50','50','50');
insert into examtbl_3 values('1','02','03','40','90','80');
insert into examtbl_3 values('1','03','01','80','60','90');
insert into examtbl_3 values('1','03','02','90','80','70');
insert into examtbl_3 values('1','03','03','70','70','70');


select * from examtbl_3;

drop table examtbl_3;
commit -- 주의 : ; 붙이면 오류 발생 

select *
from (select syear||'_'||sclass||'-'||sno as ycn, sname , decode(gender , 'M','남','F','여',' ')from examtbl_1) t1
left outer join (select syear||'_'||sclass||'-'||sno as ycn, kor, eng, math ,kor + eng+ math ,round((kor + eng+ math)/3,1)
from examtbl_3) t3
using (ycn)
;

select *
from (select syear||'_'||sclass||'-'||sno 
as ycn, sname , decode(gender , 'M','남','F','여',' ')from examtbl_1) t1
left outer join (select syear||'_'||sclass||'-'||sno 
as ycn, kor, eng, math ,kor + eng+ math ,round((kor + eng+ math)/3,1)
from examtbl_3) t3
using (ycn)
;

--join 방법 -3 : natural join - 자연스럽게 동일한 타입의 컬럼들로 조인, 조인조건X
--
select syear||,'_'||sclass||'-'||sno,
	sname,gender, kor ,eng ,math
from examtbl_1 natural join examtbl_3;


select *
from examtbl_1 e1 join examtbl_3 e3
using (sno);

select t2.syear , sclass, t2.tname,  sum(kor), sum(eng), sum(math) ,
round(avg(kor),1), round(avg(eng),1),round(avg(math),1)
from examtbl_2 t2  join examtbl_3 t3 
using (sclass)
group by t2.syear ,sclass , t2.tname
order by sclass;

select * from examtbl_1;

--select.jsp : 총점수 합계, 총점수 평균 따로------------------------------
select *
from (select syear||'_'||sclass||'-'||sno as ycn, sname , decode(gender , 'M','남','F','여')from examtbl_1) t1
 outer join (select syear||'_'||sclass||'-'||sno as ycn, nvl(to_char(kor),' '), nvl(to_char(eng),' '), nvl(to_char(math) ,' '),nvl(to_char(kor + eng+ math) ,' '),nvl(to_char(round((kor + eng+ math)/3,1)),' ')
from examtbl_3) t3
using (ycn)
;

select sum(kor),sum(eng),sum(math)
from examtbl_3; 

select round(avg(kor),1),round(avg(eng),1),round(avg(math),1)
from examtbl_3; 
-------------------------------------------------------------------------------------
--join 방법-4 : 컬럼 중복제거 -> 테이블별칭사용 X
(kor+eng+math),

from examtbl_1 left outer join examtbl_3
using(syear, sclass, sno)

-- 문제2 : null을 빈공백으로 출력하는 방법-1 : SQL문으로 처리
select e1.syear||'_'||e1.sclass||'-'||e1.sno,
e1.sname, e1.gender,
nvl(to_char(e3.kor),' '), NVL(to_char(e3.eng),' '), nvl(to_char(e3.math),' '),
(e3.kor+e3.eng+e3.math),
round((e3.kor+e3.eng+e3.math)/3,1)
from examtbl_1 e1 left outer join examtbl_3 e3
on e1.syear=e3.syear and e1.sclass=e3.sclass and e1.sno=e3.sno
order by e1.syear,e1.sclass,e1.sno;

--고교성적관리 2023-07-07
f
--<이 문제를 개선해야 될 점>
--Left outer join : 	1.성적등록 시 해당 학생이 없으면 등록안되도록 무모와 자식간읜 관계로 SQL 설계
--						부모: 학생등록 - 자식: 성적등록
--						2. 학생조회 메뉴 추가 하여 수정할 수 있도록 함
--						단, 학생등록시 notnull 부분만 입력해도 등록할수 있도로 유효성 체크를 했다면
--						-학생정보가 수정되었을 때도 사용
--						3. 성적조회 메뉴 추가하여 수정할 수 있도록 함
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


--select.jsp-[문제-2] 학생등록 후 성적등록 안해도 '성적조회되도록 함' => 총점수집계, 총점수평균 함께

select e1.syear||'_'||e1.sclass||'-'||e1.sno,
e1.sname, e1.gender,
nvl(to_char(e3.kor),' '), NVL(to_char(e3.eng),' '), nvl(to_char(e3.math),' '),
(e3.kor+e3.eng+e3.math),
round((e3.kor+e3.eng+e3.math)/3,1)
from examtbl_1 e1 left outer join examtbl_3 e3
on e1.syear=e3.syear and e1.sclass=e3.sclass and e1.sno=e3.sno
order by e1.syear,e1.sclass,e1.sno

union intersect

select sum(kor),sum(eng),sum(math)
from examtbl_3 


select syear||'_'||sclass||'-'||sno, 
sname , decode(gender , 'M','남','F','여'),kor,eng,math
(kor+eng+math),round((kor+eng+math)/3,1)
from examtbl_1 left outer join examtbl_3
using(syear, sclass, sno);

union

select 
null, null, '총점수합계' , sum(kor), sum(eng),sum(math),null ,null
from examtbl_3

union

select 
null, null, '총점수평균', round(avg(nvl(kor,0)),1),round(avg(nvl(eng,0)),1),round(avg(nvl(math,0)),1)
from examtbl_3;
--order by 없어도 기본키로 오름차순 자동 정렬됨 

order by syear,sclass,sno; --order by 는 가장 마지막에 추가 =>  추가하면 오류발생

-- select2.jsp
select syear , sclass, tname,  sum(kor), sum(eng), sum(math) ,
round(avg(nvl(kor,0)),1), round(avg(nvl(eng,0)),1),round(avg(nvl(math,0)),1)
from examtbl_2  join examtbl_3
using (syear , sclass)
group by syear ,sclass , tname
order by syear , sclass;

--위 sql문의 문제 : insertPro(학생들록 후 성적등록을 안해도 성적등록 테이블에 해당 학생이 추가되도록 insertPro.jsp에서 함)
--												이때 성적은 null 로 돌아감
--count(*)를 제외한 그룹함수는 null을 무시
--그래서 널처리 함수로 해결

drop table examtbl_1;
drop table examtbl_2;
drop table examtbl_3;
drop table examtbl_3;