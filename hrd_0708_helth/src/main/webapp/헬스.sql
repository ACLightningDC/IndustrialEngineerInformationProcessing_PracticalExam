--헬스 클럽 2023-07-13
drop table member_tbl;
drop sequence member_tbl_seq;

drop table apptrainer_tbl;
drop table trainer_tbl;

--(1) 회원정보 테이블 -------------------------------
create table member_tbl(
memno char(4) not null primary key,
mname varchar2(20) not null,
maddress varchar2(50) not null,
joindate date not null,
gender char(1),
tel varchar2(15)
);

--memno CHAR(4)도 가능한지 확인 (NUMBER는 가능함)
create sequence member_tbl_seq
start with 1001
increment by 1
minvalue 1001;

insert into member_tbl values(member_tbl_seq.nextval,'김회원','경북 경산시 중방동','19/01/01','M','010-1234-1001');
insert into member_tbl values(member_tbl_seq.nextval,'이회원','경북 경산시 중산동','19/02/01','F','010-1234-1002');
insert into member_tbl values(member_tbl_seq.nextval,'박회원','경북 경산시 옥산동','19/03/01','M','010-1234-1003');
insert into member_tbl values(member_tbl_seq.nextval,'최회원','경북 경산시 삼북동','19/04/01','M','010-1234-1004');
insert into member_tbl values(member_tbl_seq.nextval,'조회원','경북 경산시 중앙동','19/05/01','F','010-1234-1005');
insert into member_tbl values(member_tbl_seq.nextval,'전회원','경북 경산시 중방동','19/06/01','M','010-1234-1006');
insert into member_tbl values(member_tbl_seq.nextval,'남회원','경북 경산시 삼북동','19/07/01','F','010-1234-1007');
insert into member_tbl values(member_tbl_seq.nextval,'여회원','경북 경산시 중산동','19/08/01','M','010-1234-1008');
insert into member_tbl values(member_tbl_seq.nextval,'정회원','경북 경산시 옥산동','19/09/01','F','010-1234-1009');


--insert into member_tbl values('1001','김회원','경북 경산시 중방동','19/01/01','M','010-1234-1001');
--insert into member_tbl values('1002','이회원','경북 경산시 중산동','19/02/01','F','010-1234-1002');
--insert into member_tbl values('1003','박회원','경북 경산시 옥산동','19/03/01','M','010-1234-1003');
--insert into member_tbl values('1004','최회원','경북 경산시 삼북동','19/04/01','M','010-1234-1004');
--insert into member_tbl values('1005','조회원','경북 경산시 중앙동','19/05/01','F','010-1234-1005');
--insert into member_tbl values('1006','전회원','경북 경산시 중방동','19/06/01','M','010-1234-1006');
--insert into member_tbl values('1007','남회원','경북 경산시 삼북동','19/07/01','F','010-1234-1007');
--insert into member_tbl values('1008','여회원','경북 경산시 중산동','19/08/01','M','010-1234-1008');
--insert into member_tbl values('1009','정회원','경북 경산시 옥산동','19/09/01','F','010-1234-1009');

select * from member_tbl;

--(2) 트레이너'신청' 정보 테이블 -------------------------------
create table apptrainer_tbl(
tno char(2) not null,--트레이너 번호
memno char(4) not null,--회원번호
mname varchar2(20) not null,--회원이름
ttime varchar2(30) not null,--트레이너담당시간
primary key(tno,memno)
);

insert into apptrainer_tbl values('01','1004','최회원','09:00~12:00');
insert into apptrainer_tbl values('01','1007','남회원','09:00~12:00');
insert into apptrainer_tbl values('02','1002','이회원','12:00~15:00');
insert into apptrainer_tbl values('02','1005','조회원','12:00~15:00');
insert into apptrainer_tbl values('03','1003','박회원','15:00~18:00');
insert into apptrainer_tbl values('03','1006','전회원','15:00~18:00');
insert into apptrainer_tbl values('04','1008','여회원','18:00~21:00');
insert into apptrainer_tbl values('04','1009','정회원','18:00~21:00');
insert into apptrainer_tbl values('04','1001','김회원','18:00~21:00');

select * from apptrainer_tbl;

--(3) 트레이너'담당' 정보 테이블 -------------------------------
create table trainer_tbl(
tno char(2) primary key,--트레이너번호
tname varchar2(20) not null,--트레이너이름
iredate date not null,--입사일자
ttime varchar2(30) not null--담당시간
);

insert into trainer_tbl values('01','김헬스','18/01/01','09:00~12:00');
insert into trainer_tbl values('02','이헬스','18/02/01','12:00~15:00');
insert into trainer_tbl values('03','박헬스','18/03/01','15:00~18:00');
insert into trainer_tbl values('04','최헬스','18/04/01','18:00~21:00');

--'05','강헬스'는 insert2.jsp 테스트를 위해 등록함
insert into trainer_tbl values('05','강헬스','22/05/16','09:00~12:00');
--delete from trainer_tbl where tno='05';

--'06','고헬스'는 insert2.jsp 테스트를 위해 등록함
insert into trainer_tbl values('06','고헬스','22/05/16','18:00~21:00');

select * from trainer_tbl;

select ttime from trainer_tbl;

--------------------------------------------------------------------

--select.jsp
select memno,mname,maddress,
to_char(joindate,'yyyy.mm.dd') joindate,
decode(gender,'M','남','F','여') gender,tel오후 12:17 2023-07-13
from member_tbl;

--※ 마지막 페이지문제는 대부분 : 'NATURAL JOIN(70%) -> 외부조인' 으로 성공함
--select2.jsp  
--내부JOIN : 수강생이 없는 새 코치 표시 안됨
select tno, tname, ttime, COUNT(tno)
from trainer_tbl JOIN apptrainer_tbl
USING(tno, ttime)
GROUP BY tno, tname, ttime
order by tno;

--외부JOIN : 수강생이 없는 새 코치도 표시
--JOIN 방법-1 => 성공 (이유? 트레이너 번호(tno) 출력은 trainer_tbl, 
--                        COUNT()는 apptrainer_tbl의 tno로 함)
select t.tno, tname , t.ttime, COUNT(a.tno)
from trainer_tbl t , apptrainer_tbl a
WHERE t.tno=a.tno(+)
GROUP BY t.tno, tname, t.ttime
order by t.tno;

--JOIN 방법-2 => 성공
select t.tno, tname , t.ttime, COUNT(a.tno)
from trainer_tbl t LEFT OUTER JOIN apptrainer_tbl a
ON t.tno=a.tno
GROUP BY t.tno, tname, t.ttime오후 12:17 2023-07-13오후 12:17 2023-07-13
order by t.tno;

--JOIN 방법-4 => 성공(이유?COUNT(memno)로 하여 수강생이 없는 새 코치의 담당회원수가 0이 됨)
----------------실패 (이유?수강생이 없는 새 코치의 담당회원수가 1로 잡힘)
--------------- JOIN~USING은 중복을 제거하므로 COUNT(tno)은 1이 잡힘
--순서-1 : 반드시 *로 하여 데이터값을 확인
select *
from trainer_tbl FULL OUTER JOIN apptrainer_tbl
USING(tno, ttime);

--순서-2
select tno, tname, ttime, COUNT(memno)--COUNT(tno) 하면 안됨
from trainer_tbl FULL OUTER JOIN apptrainer_tbl
USING(tno, ttime)
GROUP BY tno, tname, ttime
order by tno;

--서브쿼리 이용 -----------------------------------------------------------------
--방법-1 => 성공 : 수강생이 없는 새 코치의 담당회원수가 null로 출력되므로 null처리해서 0으로 출력
select tno, tname, ttime, NVL(memco,0)
from trainer_tbl LEFT OUTER JOIN (select count(memno) as memco, tno
				                  from apptrainer_tbl
				                  group by tno)
USING(tno)
order by tno;

--방법-2 => 성공
select tno, tname, ttime, NVL(cntMem,0)--★컬럼별칭인식
from (select tno, tname, ttime from trainer_tbl) 
     FULL OUTER JOIN 
     (select tno,ttime,count(tno) as cntMem from apptrainer_tbl group by tno,ttime) 
USING(tno,ttime)
order by tno;

commit