<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %><!-- dbcon.jsp(DB +변수 선언) + style.css -->
		<section>
		<div >
			<h2>회원 조회</h2>	
		</div>	
		
		<table style="border:2px soild black;width: 900px;">
			<tr>
				<th>등급</th>
				<th>회원번호</th>
				<th>이름</th>
				<th>구입액</th>
			</tr>
			
			<%
			/* -- 회원 조회 쿼리문 실행 --------*/
			sql = " select ";
			sql += " decode(t2.memgrade ,'1','VIP', '2','Gold','3','Siver','Bronze'),";
			sql += " t1.memno , t1.name , t1.sum";
			sql += " from (";
			sql += " select memno , name , sum(price*bno) as sum";
			sql += " from member join buy";
			sql += " using(memno) ";
			sql += " group by memno ,name";
			sql += " ) t1 ";
			sql += " join grade t2 ";
			sql += " on t1.sum between t2.loprice and t2.hiprice";
			sql += " order by t1.sum desc";
			
			//memgrade를 java로 처리
			/*while(rs.next()){
				String grade ="";
				switch(rs.getString(1)){//switch(정수 또는 '문자'를 결과로 가지는)
				case 1: grade = "VIP"; break;
				case 2: grade = "Gold"; break;
				case 3: grade = "Silver"; break;
				case 4: grade = "Normal"; break;
				}
			}
			
			*/
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
			/* -- 한 줄씩 만들고 6칸안에 칸안에 한사람의 회원정보를 각각 넣기=> 반복 --------*/
			%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
				</tr>
			<%	
			}
					
			%>
		</table>
	
	</section>
	
	<%@ include file="footer.jsp" %> <!--  db 자원 모두 해제 -->
</body>
</html>