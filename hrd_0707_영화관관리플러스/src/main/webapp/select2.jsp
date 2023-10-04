<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>

	<section>
		<div>
			<h2>영화별 예매 정보 조회</h2>
		</div>
	</section>
	<%
	sql = " select mo_name ,mo_limit, count(mo_no) as mo_c";
	sql+= " from movie_2 join movie_3 using(mo_name)";
	sql+= " group by mo_name , mo_limit";
	
	
	
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	%>
	<table>
	<tr>
		<td>영화제목</td>
		<td>시청등급</td>
		<td>예매횟수</td>
	</tr>
	
	<%
	
	while(rs.next()){
		%>
	<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
	</tr>
		
		
		<%
	}
	
	
	%>
	
			
	
</table>
<%@include file="footer.jsp" %>
</body>
</html>