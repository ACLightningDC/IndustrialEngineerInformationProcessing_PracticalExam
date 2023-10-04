<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%@include file="header.jsp" %>

<%
/*
교재 465p~ 참조
*/
//성적 조회(이 때, 제일 처음 시작하는 2개의 컬럼은 제외시켜서 봄. 이유?성적이 아니므로)
	sql  = "select * from score_tbl"; 
	ps= con.prepareStatement(sql);
	rs =ps.executeQuery();
	ResultSetMetaData rsmd = rs.getMetaData();
	int columnLength = rsmd.getColumnCount();//컬럼수 : 7 개
	
	//교재 467p, 470p
	String sql2  = "select * from grade_tbl";
	//커서가 자유롭게 이동가능한 구문객체 2 -> grade
	Statement stmt2 = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
	ResultSet rs2 = stmt2.executeQuery(sql2);	
	%>
	
<section>
	<div>
	<h2>재수강대상자 : ResultSetMetaData 이용(교재 465p~ 참조)+커서가 자유롭게 이동가능한 구문객체</h2>
	</div>	
			
	<table border="1" width="700">
	<!-- 테이블의 첫 줄 출력하는 방법 2가지 ---------------------->
		<!-- 1.그냥 컬럼이름 표시하기 ------------------------->
		<tr>
			<th>과목</th>
			<th>전공1</th>
			<th>전공2</th>
			<th>전공3</th>
			<th>교양1</th>
			<th>교양2</th>
		</tr>
		
		<!-- 2.sql 쿼리문의 결과로 rs에서 나온 결과에서 컬럼이름 가져오기 ---->
		<tr>
			<th>과목</th>
			
			<%//i= 3 부터 시작 : 제일 처음 시작하는 2개의 컬럼은 성적아니므로 제외
			for(int i = 3; i <= columnLength; i++) {
				//각 과목의 이름을 출력, 컬럼이름을 따로 처리해야할 필요 있음
				%>
				<th><%=rsmd.getColumnName(i) %></th>
				<%
			}%>
		</tr>
		
		<%
		//배열을 절반으로 나눠서 앞쪽은 A 학점의(성적우수자) 카운터 수 저장 저장, 뒤쪽은 F 학점(재수강대상자)의 카운터 수 저장----------------------------------------------------------
		//배열의 초기값은 모두 기본값 0으로 저장되어 있음
		//(columnLength-2)*2 == 크기가 10dls 배열객체 생성되고
		int storeScore[] = new int[(columnLength-2)*2];//-2 이유?학번과 학년 제외, *2 이유?A와 F함께 저장위해
		
		while(rs.next()){//score_tbl 커서를 다음 row로
			
			for(int i = 3; i <= columnLength; i++) {//score_tbl의 각 컬럼의 점수를 순회(학번과 학년 제외)
				
				if(rsmd.getColumnType(i) == Types.NUMERIC ){//컬럼이 number 타입인가 확인
					while(rs2.next()){//학점을 추출하는 while문
						
						//score_tbl의 각 컬럼의 학점을 grade_tbl과 비교
						if(rs2.getInt(2) <= rs.getInt(i) && rs.getInt(i) <= rs2.getInt(3)){
							if(rs2.getString(1).equals("A")){
								storeScore[i-3] += 1; //index 0부터 저장위해
								break;//학점이 확인되면 while문에서 탈출
							}else if(rs2.getString(1).equals("F")){
								storeScore[storeScore.length/2 + (i-3)]++;
								break;//학점이 확인되면 안쪽 while문에서 탈출
							}
						}//안쪽 if끝
					
					}//학점을 추출하는 while문 종료
					
					//다음 컬럼으로 진행하기 전에 grade_tbl의 커서를 초기화
					rs2.beforeFirst(); //grade_tbl을 재사용할 준비 완료
				
				}//타입 확인 바깥 if문 끝
				
			}//score_tbl의 각 컬럼을 순회하는 for문 끝
			
		}//score_tbl의 커서를 움직이는 while문 끝
		%>
		
		<tr>
			<th>성적 우수자</th>
			
			<% //배열의 index는 0부터 시작4까지 = ((storedScore.length)/2)1 == 4
			for(int i = 0; i <= ((storeScore.length)/2) -1; i++) {
				//0~((storeScore.length)/2) -1 까지는 A학점인 학생 수가 저장되어 있음
				%>
				<th><%=storeScore[i] %>명</th>
				<%
			}%>
		</tr>
		<tr>
			<th>재수강 대상자</th>
			<% //index는 5부터 시작 9까지  ※ sotredScore.length == 10
			for(int i = (storeScore.length)/2; i < storeScore.length; i++) {
				//(storeScore.length)/2 부터 끝까지는 F학점인 학생의 수가 저장되어 있음
				%>
				<th><%=storeScore[i] %>명</th>
				<%
			}%>
		</tr>
	</table>
</section>
	
	

<%@include file="footer.jsp" %>

</body>
</html>