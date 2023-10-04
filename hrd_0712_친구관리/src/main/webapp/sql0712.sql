create table member_tbl_11
(
member_no number primary key,
member_id varchar2(10) not null,
member_name varchar2(20) not null,
member_grade char(1) ,
member_hobby varchar2(100) ,
member_date date 
);

insert into member_tbl_11 values('1001','hong','홍길동','S','독서,운동,영화','18/01/10');
insert into member_tbl_11 values('1002','choi','최영문','A','영화','18/01/11');
insert into member_tbl_11 values('1003','park','박기자','A','독서','18/01/12');
insert into member_tbl_11 values('1004','lee','이은주','B','운동','18/01/13');
insert into member_tbl_11 values('1005','kang','강하나','S','','18/01/14');

create table friend_tbl_11
(
req_member_no number not null,
res_member_no number ,
req_date date ,
allow_yn char(1)
);

insert into friend_tbl_11 values('1001','1002','18/09/20','Y');
insert into friend_tbl_11 values('1003','1001','18/09/21','Y');
insert into friend_tbl_11 values('1002','1004','18/09/21','Y');
insert into friend_tbl_11 values('1001','1005','18/09/22','N');
insert into friend_tbl_11 values('1002','1005','18/09/22','Y');
insert into friend_tbl_11 values('1005','1003','18/09/22','Y');
--insert
select max(member_no)+1, to_char(sysdate,'YYYY/MM/DD')
from member_tbl_11;
--select
select member_no ,member_id, member_name ,
member_grade ,decode(member_grade ,'S','특별','A','우수','B','일반') as member_grade ,
member_hobby,to_char(member_date , 'YYYY,MM,DD') as member_date
from member_tbl_11
order by member_id ;
--select 2 ??
select member_id , member_name, to_char(member_date,'YYYY-MM-DD')
from member_tbl_11;


select *
from member_tbl_11 join friend_tbl_11
on member_id = ;

--insert2 
select member_no ,member_id ,member_name ,member_grade ,member_hobby ,to_char(member_date,'YYYY/MM/DD')
from member_tbl_11
where member_no = '1001';

update member_tbl_11
set member_no= ,member_id= ,member_name= ,member_grade= ,member_hobby= member_date=
where = 

select req_member_no , res_member_no ,req_date ,allow_yn
from friend_tbl_11
where (req_member_no ='1001' or res_member_no ='1001') and allow_yn ='Y';

select *
from friend_tbl_11 t1 join member_tbl_11 t2 
on t1.req_member_no = member_no or t1.res_member_no = member_no;

select t2.member_id ,t2.member_name,to_char(t1.req_date,'YYYY-MM-DD')
from friend_tbl_11 t1 join member_tbl_11 t2 
on t1.req_member_no = member_no or t1.res_member_no = member_no
where (t1.req_member_no ='1001' or t1.res_member_no ='1001') and t1.allow_yn ='Y' and not t2.member_no='1001';

select count(t2.member_id)
from friend_tbl_11 t1 join member_tbl_11 t2 
on t1.req_member_no = member_no or t1.res_member_no = member_no
where (t1.req_member_no ='1001' or t1.res_member_no ='1001') and t1.allow_yn ='Y' and not t2.member_no='1001';

delete member_tbl_11
where member_no = ''

--select2.jsp(첫 번째 방법)-------------------------------
--[순서-1]
--1001이 친구요청한 건
--req_member_no:요청 , res_member_no : 받은쪽
select res_member_no, req_date
from friend_tbl_11
where req_member_no=1001 and allow_yn='Y';
--[순서-2]
--1001이 친구 요청한 건 
select res_member_no, req_date
from friend_tbl_11
where req_member_no=1001 and allow_yn='Y';

--[순서-3]
--union 합칩합(중복 제거) :요청건과 요청받은 건 하나로
--반드시 컬럼수와 타입이 같아야 함
--이 때, 컬럼이름은 위의 sql문을 따른다.
select res_member_no, req_date
from friend_tbl_11
where req_member_no=1001 and allow_yn='Y'
union
select req_member_no, req_date
from friend_tbl_11
where res_member_no=1001 and allow_yn='Y'
order by 1 asc;--union 후 order by 정렬은 반드시 끝에

--[순서-4]
--순서 join 방법-1과 2만 사용가능
--(이유?조인 조건에서 비교연산자 사용하므로)
--이때 컬럼이름은 달라도 타입만 같으면 등가조인 가능함 
-- : MEMBER_NO ,RES_MEMBER_NO 둘다 NUMBER이므로 등가조인 가능함
--주의 : 반드시 UNION 된 위쪽 컬럼이름을 사용해야 함(예)RES_MEMBER_NO

--join-on : 테이블 별칭 필요없다. 컬럼이름이 다르므로
select member_id, member_name , to_char(req_date,'yyyy-mm-dd') as req_date
from member_tbl_11 
join (
select res_member_no, req_date
from friend_tbl_11
where req_member_no=1001 and allow_yn='Y'
union
select req_member_no, req_date
from friend_tbl_11
where res_member_no=1001 and allow_yn='Y'
)
on member_no = res_member_no;

--select2.jsp(두 번째 방법)------------------------------
--[순서-1]
select * 
from friend_tbl_11
where (req_member_no=1001 or res_member_no=1001 )and allow_yn ='Y' ;
--★주의 () 괄호 사용하여 우선순위 변경 (이유? 우선순위 and -> or)

select decode(req_member_no, 1001 , res_member_no, req_member_no) as member_no , req_date
from friend_tbl_11
where (req_member_no=1001 or res_member_no=1001 )and allow_yn ='Y' ;

--[순서-2]join 방법 4가지 다 사용가능(이유? 위의 컬럼별칭을 member_no와 이름이 같아서)
--이중 join~on : 중복제거X => 테이블 별칭 사용O
select member_id , member_name, to_char(req_date, 'yyyy-mm-dd') as req_date
from member_tbl_11 m join 
(select decode(req_member_no, 1001 , res_member_no, req_member_no) as member_no , req_date
from friend_tbl_11
where (req_member_no=1001 or res_member_no=1001 )and allow_yn ='Y' ) f
on(m.member_no=f.member_no);

--이중 join~using : 중복제거하므로 테이블 별칭이 사용X 

select member_id , member_name, to_char(req_date, 'yyyy-mm-dd') as req_date
from member_tbl_11  join 
(select decode(req_member_no, 1001 , res_member_no, req_member_no) as member_no , req_date
from friend_tbl_11
where (req_member_no=1001 or res_member_no=1001 )and allow_yn ='Y' ) 
using(member_no);
