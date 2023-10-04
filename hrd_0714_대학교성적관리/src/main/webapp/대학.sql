create table student_tbl
(
studno number not null,
syear char(2) not null,
sname varchar2(20) not null,
address varchar2(100) not null,
gender char(1) not null,
tel varchar2(30) not null,
idnum char(14) not null unique ,
primary key(studno , syear)
);

insert into student_tbl values('1001','04','김학생','경북 경산시 중방동','F','010-1234-1001','970101-2000001');
insert into student_tbl values('1002','04','이학생','경북 경산시 중산동','M','010-1234-1002','970201-1000001');
insert into student_tbl values('2001','03','최학생','경북 경산시 옥산동','M','010-1234-1003','980301-1000001');
insert into student_tbl values('2002','03','박학생','경북 경산시 삼복동','F','010-1234-1004','980401-2000001');
insert into student_tbl values('3001','02','유학생','대구 광역시 수성구','M','010-1234-1005','990501-1000001');
insert into student_tbl values('3002','02','전학생','대구 광역시 달서구','M','010-1234-1006','990601-1000001');
insert into student_tbl values('4001','01','남학생','대구 광역시 북구','M','010-1234-1007','000701-3000001');
insert into student_tbl values('4002','01','여학생','대전 광역시 유성구','F','010-1234-1008','000801-4000001');
insert into student_tbl values('4003','01','정학생','경북 경산시 중앙동','F','010-1234-1009','000901-4000001');

create table grade_tbl(
grade char(1) not null,
loscore number not null,
hiscore number not null
);

insert into grade_tbl values('A','90','100');
insert into grade_tbl values('B','80','89');
insert into grade_tbl values('C','70','79');
insert into grade_tbl values('D','60','69');
insert into grade_tbl values('F','0','59');

select hiscore 
from grade_tbl
where grade ='F';

select loscore 
from grade_tbl
where grade ='A';

create table score_tbl
(
studno number not null,
syear char(2) not null,
m_subject1 number,
m_subject2 number,
m_subject3 number,
s_subject1 number,
s_subject2 number check(s_subject2 between 0 and 100),
primary key (studno, syear)
constraint socre_delete foreign key(studno,syear) references student_tbl(studno,syear) on delete cascade
);

insert into score_tbl values('1001','04','80','90','50','20','80');
insert into score_tbl values('1002','04','70','80','80','70','30');
insert into score_tbl values('2001','03','80','80','80','70','90');
insert into score_tbl values('2002','03','90','80','90','70','50');
insert into score_tbl values('3001','02','70','60','70','70','70');
insert into score_tbl values('3002','02','90','50','70','80','90');
insert into score_tbl values('4001','01','90','80','90','90','80');
insert into score_tbl values('4002','01','70','60','90','50','80');
insert into score_tbl values('4003','01','60','60','90','50','40');

--아래 학생의 성적이 200이므로 check 계약조건에 위배됨 입력시 오류발생
insert into score_tbl values(4004,'01',200,80,90,50,40);
--오류? ORA-02290: check constraint (system_sys_C007971) voiolated

--등록 안됨 학생의 성적을 입력시 오류발생
insert into score_tbl values(4004, '02', 60,80,90,50,40);
--ORA-02291: integrity consrain (

commit -- 이클립스에서는 세미콜론 제외 --> 세미콜론시 오류 -> 나머지는 괜찮음

--insert.jsp -----------------------------
--insert.jsp 따로
select nvl(max(studno),1000)+1 as ttudno from student_tbl; --학번 자동 생성
select nvl(min(syear),01) as syear from student_tbl;--학년 01 자동입력

--insert.jsp 함께
select nval(max(studio),1000)+1 as studno, nvl(min(syear),01) syear
from student_tbl;

--select.jsp('과목총점과 과목평균'따로)
--위에서 참조키를 만들어 등록된 학생만 성적 입력하도록 함
--(학번,학년)으로 join

select studno ,

drop table score_tbl;
select max(studno)+1
from student_tbl;



insert into student_tbl values(?,?,?,?,?,?,?);

insert into score_tbl values(?,?,?,?,?,?,?)

select studno , sname , m_subject1, m_subject2 ,m_subject3 ,s_subject1, s_subject2 ,(m_subject1 + m_subject2 + m_subject3  + s_subject1 + s_subject2) , round(((m_subject1 + m_subject2 + m_subject3  + s_subject1 + s_subject2)/5)) 
from score_tbl join student_tbl
using (studno) ;

select  sum(m_subject1), sum(m_subject2) ,sum(m_subject3) ,sum(s_subject1),sum( s_subject2 )
from score_tbl  ;

select  round(avg(m_subject1)), round(avg(m_subject2)) ,round(avg(m_subject3)) , round(avg(s_subject1)) ,round(avg(s_subject2))
from score_tbl  ;

select *
from grade_tbl join score_tbl
on (m_subject1 between loscore and hiscore) or
(m_subject2 between loscore and hiscore) or
(m_subject3 between loscore and hiscore) or
(s_subject1 between loscore and hiscore) or
(s_subject2 between loscore and hiscore);

select grade 
from grade_tbl join score_tbl
on (m_subject1 between loscore and hiscore);

select count(m_subject1)
from score_tbl
where m_subject1 >= 90;

select '성적 우수자' ,
count(case when m_subject1 <= hiscore then '1'end)||'명',
count(case when m_subject2 <= hiscore then '1'end)||'명',
count(case when m_subject3 <= hiscore then '1'end)||'명',
count(case when s_subject1 <= hiscore then '1'end)||'명',
count(case when s_subject2 <= hiscore then '1'end)||'명'
from score_tbl join (select hiscore from grade_tbl where grade ='F')
on 1 = 1
union 
select '재수강 대상자',
count(case when m_subject1 >= loscore then '1'end)||'명',
count(case when m_subject2 >= loscore then '1'end)||'명',
count(case when m_subject3 >= loscore then '1'end)||'명',
count(case when s_subject1 >= loscore then '1'end)||'명',
count(case when s_subject2 >= loscore then '1'end)||'명'
from score_tbl 
join (select loscore from grade_tbl where grade ='A')
on 1 = 1;

select hiscore 
from grade_tbl
where grade ='F';

select loscore 
from grade_tbl
where grade ='A';


select 
count(case when m_subject1 <= 60 then '1'end)||'명',
count(case when m_subject2 <= 60 then '1'end)||'명',
count(case when m_subject3 <= 60 then '1'end)||'명',
count(case when s_subject1 <= 60 then '1'end)||'명',
count(case when s_subject2 <= 60 then '1'end)||'명'
from score_tbl 

where m_subject1 >=90;

delete score_tbl
where studno = 4004;

select * from score_tbl;


--외부 join : g학생등록은 했지만 아직 성적등록이 안된 학생도 표시
select studno , sname , m_subject1, m_subject2 ,m_subject3 ,s_subject1, s_subject2 ,(m_subject1 + m_subject2 + m_subject3  + s_subject1 + s_subject2) , round(((m_subject1 + m_subject2 + m_subject3  + s_subject1 + s_subject2)/5)) 
from score_tbl left outer join student_tbl
using (studno,syear)
order by studno asc;

-------------------------------
-------------/*
sum 과 count 함수 비교 설명
sum(컬럼명 number) : 컬럼에 해당하는 전체 합계 ADDRESS
count() : 테이블에 데이터가 몇 건이 존재하는지 확인 ★ count(*)만 null 포함
*/
1000
1000
2000
1000
2000
''

select count(*), --6 : 테이블 전체 행수(null 포함하는 유일한 그룹함수)
count(dept)--5 : 컬럼 행수(null 제외한다 = null 포함X)
count(nvl(dept,0)) --6 : null을 0으로 변경
count(distinct dept)--결과 2 (null제외: 5 -> 중복 제외: 2)

select sum(*), -- : 반드시 sum(number 타입의 컬럼명)
sum(salary)--5 : 7000 (null 제외한다 = null 포함X)
sum(nvl(salary,0)) -- 7000 : null을 0으로 변경
sum(distinct salary)--결과 3000 (null제외 : 7000 -> 중복제외:1000+2000=3000)

select count(commission), sum(commission)
from test;

/*sum과 avg 함수 비교 설명 */
select --avg(*) , 오류=> 이유? 반드시 avg(number 타입의 칼럼명)
avg(salary),--총합 7000/5로 나눈 결과 1400 (null제외)
avg(nvl(salary,0)), -- 총합 7000/6  로 나눈 결과 : 1166,666 (null을 0으로 변경하여 평균구함)
avg(distinct salary)-- 결과 1500 (null제외 ,중복 제외:(1000+2000)/2=1500)


/*
count(1, null, 1, null) -> count (1,1) : 행수2
sum(1, null, 1, null ) -> sum(1,1) : 더하면 2

count(3, null, 4, null) -> count(3,4) : 행수 2
sum(3, null , 4, null)-> sum(3,4) : 더하면 7

만약 모든 데이터가 null이면
count(null, null) :행수 0
sum(null, null) : 더하면 null

★★ 따라서 select2.jsp count 대신 sum 사용가능
그너라 sum 결과로 null 이 나올 수 있으므로 null 처리 해줘야 함
*/
--select2.jsp : grade 테이블 이용X
--성적 우수자 : 90이상 >=
--sum 이용 : 반드시 else는 0추가 (이유? SUM(null, null) : 더하면 null
--(예) 학생등록 후 성적등록 X 상황에서 두 테이블을 조인 후 sum하면 결과가 출력된다
select '성적 우수자' ,
case when m_subject1 <= hiscore then 1 else 0 end,
case when m_subject2 <= hiscore then 1 else 0 end,
case when m_subject3 <= hiscore then 1 else 0 end,
case when s_subject1 <= hiscore then 1 else 0 end,
case when s_subject2 <= hiscore then 1 else 0 end
from score_tbl
--(1)
select '성적 우수자' ,
sum(case when m_subject1 <= hiscore then 1 else 0 end),
sum(case when m_subject2 <= hiscore then 1 else 0 end),
sum(case when m_subject3 <= hiscore then 1 else 0 end),
sum(case when s_subject1 <= hiscore then 1 else 0 end),
sum(case when s_subject2 <= hiscore then 1 else 0 end)
from score_tbl

--count 이용 : else 0 제거해야 함 (이유? count(1,0) => 행수 2)
--(1)
select '성적 우수자' ,
case when m_subject1 <= hiscore then 1 end,
case when m_subject2 <= hiscore then 1 end,
case when m_subject3 <= hiscore then 1 end,
case when s_subject1 <= hiscore then 1 end,
case when s_subject2 <= hiscore then 1 end
from score_tbl

select '성적 우수자' ,
count (case when m_subject1 <= hiscore then 1 end),
count (case when m_subject2 <= hiscore then 1 end),
count (case when m_subject3 <= hiscore then 1 end),
count (case when s_subject1 <= hiscore then 1 end),
count (case when s_subject2 <= hiscore then 1 end)
from score_tbl

--재수강 대상자

--select2.jsp : grade 테이블 이용하여 sql 문 작성
--1.count 사용
--성적우수자 : 90 이상 , 재수가 대상자 : 60미만
select * from grade_tbl where grade='A';--grade, loscore 90 , hiscore 100
select * from grade_tbl where grade='F';--grade, loscore 90 , hiscore 100

--(1) natural join : 같은 타입과 이름을 가진 칼럼이 없으면 그냥 'cross join' 됨 
select * 
from score_tbl natural join (select * from grade_tbl where grade= 'A');
--(2) cross join : 같은 타입과 이름을 가진 컬럼이 없으면 그냥 'cross join' 됨
select * 
from score_tbl natural join (select * from grade_tbl where grade= 'F');

--(2-3) 비등가 조인 방법 : ,~where join~on => 권장 / NATURAL JOIN where 검색 
--count 이용한 방법 
--성정 우수자 : 90이상
--count 이용 : 반드시 else 0 제거 		※count(*) null 포함한 함수
select 	count(case when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
		count(case when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
		count(case when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
		count(case when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
		count(case when s_subject1 between loscore and hiscore then 1 END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='A');
--성정 우수자 : 60미만
--count 이용 : 반드시 else 0 제거 		※count(*) null 포함한 함수
select 	count(case when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
		count(case when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
		count(case when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
		count(case when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
		count(case when s_subject1 between loscore and hiscore then 1 END) as s_subject2
from score_tbl cross join (select * from grade_tbl where grade='F');

--sum 이용 : 반드시 else 0 추가되야함  
--(이유? sum(null, null) 전부 null  이면 결과가 null 출력되므로 null 출력되지 않도록 하기 위함)
--※count(*) null 포함한 함수 , 다른 그룹함수는 모두 null 제외
---- sum(1, null) => 결과 1 ( null 제외하고 다하므로...)

---------(주의) 학생등록 후 성적등록 X 상황에서 두 테이블을 조인 후 sum하면 결과가 null 이 안나옴
---- 이유 ? 학생등록 후 성적등록된 학생이 한명이라도 있으면 null 값이 될수가 없음
--성적 우수자 : grade ='A' 90 이상

select 	sum(case when m_subject1 between loscore and hiscore then 1 else 0 END) as m_subject1,
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 END) as m_subject2,
		sum(case when m_subject3 between loscore and hiscore then 1 else 0 END) as m_subject3,
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 END) as s_subject1,
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 END) as s_subject2
from score_tbl natural join (select * from grade_tbl where grade='A');
--재수강 대상자 : grade ='F' 60미만
select 	sum(case when m_subject1 between loscore and hiscore then 1 else 0 END) as m_subject1,
		sum(case when m_subject2 between loscore and hiscore then 1 else 0 END) as m_subject2,
		sum(case when m_subject3 between loscore and hiscore then 1 else 0 END) as m_subject3,
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 END) as s_subject1,
		sum(case when s_subject1 between loscore and hiscore then 1 else 0 END) as s_subject2
from score_tbl cross join (select * from grade_tbl where grade='F');

--위 select2.jsp의 sql문에 student_tbl 까지 join 추가---------------------------------------
--(1) 위에서 FK를 추가 : 등록안된 학생의 성적 추가 안되는 상황
select * 
from STUDENT_TBL full outer join score_tbl using(studno,syear);

--(2)
select * 
from STUDENT_TBL full outer join score_tbl using(studno,syear)
cross join (select * from grade_tbl where grade='A');

--(3) 성적 우수자 : count
select 	count(case when m_subject1 between loscore and hiscore then 1 END) as m_subject1,
		count(case when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
		count(case when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
		count(case when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
		count(case when s_subject1 between loscore and hiscore then 1 END) as s_subject2
from STUDENT_TBL full outer join score_tbl using(studno,syear)
cross join (select * from grade_tbl where grade='A');

--(4) 재수강 대상자 
--sum 이용 1 : sum(null 출력 방지 위해 반드시 0 추가), grade='F'
select 	sum(case when m_subject1 between loscore and hiscore then 1 else 0 END) as m_subject1,
		sum(case when m_subject2 between loscore and hiscore then 1 END) as m_subject2,
		sum(case when m_subject3 between loscore and hiscore then 1 END) as m_subject3,
		sum(case when s_subject1 between loscore and hiscore then 1 END) as s_subject1,
		sum(case when s_subject1 between loscore and hiscore then 1 END) as s_subject2
from STUDENT_TBL full outer join score_tbl using(studno,syear)
cross join (select * from grade_tbl where grade='F');

--sum 이용-2 : sum(null 출력 방지 위해 nvl 이용), grade='F'
select 	nvl(sum(case when m_subject1 between loscore and hiscore then 1 END),0) as m_subject1,
		nvl(sum(case when m_subject2 between loscore and hiscore then 1 END),0) as m_subject2,
		nvl(sum(case when m_subject3 between loscore and hiscore then 1 END),0) as m_subject3,
		nvl(sum(case when s_subject1 between loscore and hiscore then 1 END),0) as s_subject1,
		nvl(sum(case when s_subject1 between loscore and hiscore then 1 END),0) as s_subject2
from STUDENT_TBL full outer join score_tbl using(studno,syear)
cross join (select * from grade_tbl where grade='F');

--sum 이용-3 : null 출력 방지 위해 java로 처리 -  (조건문)?참: 거짓

----------select2.jsp 의 2개의 쿼리문은 union으로 합침 ----------------------------------------------------
--아래 두 결과는 같음 
select * -- 컬럼수 : 등록된 성적 행수 * grade_tbl 행수 
from score_tbl, grade_tbl;

select * -- 컬럼수 : 등록된 성적 행수 * grade_tbl 행수 
from score_tbl cross join grade_tbl;

--다른점 : , 는 where 생략 가능 		join은 반드시 on 또는 using
select *  
from score_tbl, grade_tbl
where grade= 'A';

select *
from SCORE_TBL join grade_tbl
on grade ='A';
using(같은 이름과 타입을 가진 컬럼명);
--using(같은 이름과 타입을 가진 칼럼명); 따라서 사용불가능

--최종 : union - 두 쿼리문의 결과가 반드시 같은 타입으로 1: 1 로 대응되어야 함
----------- 윗쪽 쿼리문은 '문자', 아래쪽 쿼리문은 '숫자'이면 => 따라서 union 안됨
------문제 발생함 --ORA-01790: expression must have same datatype as corresponding expression
select 	'성적우수자' as subject,
		count(case when m_subject1 between loscore and hiscore then 1 END)||'명' as m_subject1 ,
		count(case when m_subject2 between loscore and hiscore then 1 END)||'명' as m_subject2 ,
		count(case when m_subject3 between loscore and hiscore then 1 END)||'명' as m_subject3 ,
		count(case when s_subject1 between loscore and hiscore then 1 END)||'명' as s_subject1 ,
		count(case when s_subject1 between loscore and hiscore then 1 END)||'명' as s_subject2 
from SCORE_TBL , grade_tbl
where grade ='A'
union
select 	'재수강대상자' as subject,
	 	count(case when m_subject1 between loscore and hiscore then 1 END)||'명' as m_subject1 ,
		count(case when m_subject2 between loscore and hiscore then 1 END)||'명' as m_subject2 ,
		count(case when m_subject3 between loscore and hiscore then 1 END)||'명' as m_subject3 ,
		count(case when s_subject1 between loscore and hiscore then 1 END)||'명' as s_subject1 ,
		count(case when s_subject1 between loscore and hiscore then 1 END)||'명' as s_subject2 
from SCORE_TBL join grade_tbl
on grade ='F';


----------------------------------------------------------------------------------------------------

--select2.jsp : 
select
'성적 우수자' ,
count(case when m_subject1 <= hiscore then '1'end)||'명',
count(case when m_subject2 <= hiscore then '1'end)||'명',
count(case when m_subject3 <= hiscore then '1'end)||'명',
count(case when s_subject1 <= hiscore then '1'end)||'명',
count(case when s_subject2 <= hiscore then '1'end)||'명'
from score_tbl join (select hiscore from grade_tbl where grade ='F')
on 1 = 1
union 
select
'재수강 대상자',
count(case when m_subject1 >= loscore then '1'end)||'명',
count(case when m_subject2 >= loscore then '1'end)||'명',
count(case when m_subject3 >= loscore then '1'end)||'명',
count(case when s_subject1 >= loscore then '1'end)||'명',
count(case when s_subject2 >= loscore then '1'end)||'명'
from score_tbl 
join (select loscore from grade_tbl where grade ='A')
on 1 = 1;

select * from SCORE_TBL;
select * from grade_tbl;