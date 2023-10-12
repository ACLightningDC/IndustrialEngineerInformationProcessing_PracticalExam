create table player_tbl
(
player_no number not null primary key ,
player_name varchar2(20) not null,
team_no number ,
player_phone varchar2(14),
player_birth date ,
player_email varchar2(50),
back_no number
);

select * from player_tbl

insert into player_tbl values (10001 ,'김유신' , 10 ,'01011112222' ,'80/08/10' ,'ab@naver.com' , 15);
insert into player_tbl values (10002 ,'강감찬' , 10 ,'01022223333' ,'81/07/10' ,'cd@naver.com' , 20);
insert into player_tbl values (10003 ,'홍길동' , 10 ,'01033334444' ,'80/03/20' ,'ef@naver.com' , 21);
insert into player_tbl values (10004 ,'이순신' , 10 ,'01044445555' ,'82/11/20' , null ,5);


select player_no , player_name , team_no , player_phone ,back_no, to_char(player_birth ,'MM/dd'), nvl(player_email , ' ') from player_tbl;

create table record_tbl(
record_no number not null primary key,
player_no number ,
match_no number ,
p_time number(3) default 0 ,
player_score number(2) default 0,
yellow_card number(2) default 0,
red_card number(2) default 0
);

insert into record_tbl values(1 ,10001 ,111,5,0,0,0);
insert into record_tbl values(2 ,10002 ,111,90,1,0,1);
insert into record_tbl values(3 ,10003 ,111,90,0,2,0);
insert into record_tbl values(4 ,10004 ,111,45,2,0,0);
insert into record_tbl values(5 ,10005 ,111,45,0,0,0);
insert into record_tbl values(6 ,10001 ,112,90,1,0,0);
insert into record_tbl values(7 ,10002 ,112,90,1,0,0);
insert into record_tbl values(8 ,10003 ,112,90,0,1,0);
insert into record_tbl values(9 ,10004 ,112,90,1,1,0);
insert into record_tbl values(10,10005 ,112,90,0,0,1);
insert into record_tbl values(11,10001 ,113,45,3,2,1);
insert into record_tbl values(12,10002 ,113,90,1,1,0);
insert into record_tbl values(13,10003 ,113,45,2,1,0);
insert into record_tbl values(14,10004 ,113,45,0,0,0);
insert into record_tbl values(15,10005 ,113,45,0,0,0);
insert into record_tbl values(16,10004 ,113,45,1,0,0);


select match_no ,sum(player_score) ,sum(yellow_card),sum(red_card) from record_tbl group by match_no order by match_no asc;
select player_no ,player_name, max(playerScoreSum)
from (select player_no , player_name ,sum(player_score) as playerScoreSum from record_tbl join player_tbl using(player_no) group by player_no , player_name)
group by player_no ,player_name;

select player_no , player_name ,sum(player_score) as playerScoreSum ,sum(yellow_card) as playerYellow_cardSum ,sum(red_card) as playerRed_cardSum from record_tbl join player_tbl using(player_no) group by player_no , player_name order by playerScoreSum desc  ,playerRed_cardSum asc , playerYellow_cardSum asc;

--update.jsp
nvl(substr(player_email.1,instr(player_email,'@',1),-1),' ')

이메일 사용시 trim() 사용
------------------------------------------------------------------------------
  --★select2.jsp(최종)--가장 잘됨
select player_no, sum(player_score) as total_score,
  rank() over(order by sum(player_score) desc , sum(red_card asc , sum(yellow_card) asc) as rank 
  from record_tbl
  group by player_no;

select player_no, player_name, total_score
from player_tbl join (player_no, sum(player_score) as total_score,
  rank() over(order by sum(player_score) desc , sum(red_card asc , sum(yellow_card) asc) as rank 
  from record_tbl
  group by player_no)
  using(player_no)
  where rank = 1 -- ★★ from 에서 이미 컬럼별칭인 rank를 인식했으므로 사용가능함 (=> "오라클 실행순서" 참조)
  order by player_no asc;
