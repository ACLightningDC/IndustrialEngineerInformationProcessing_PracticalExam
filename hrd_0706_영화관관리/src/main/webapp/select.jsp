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
			<h2>영화관 예매정보 조회</h2>
		</div>
	</section>
	<%
	sql = " select me_id ,me_name ,mo_name , mo_limit ,count(mo_no) as mo_c";
	sql+= " from movie_1";
	sql+= " join movie_2 using (me_id)";
	sql+= " join movie_3 using(mo_name)";
	sql+= " group by me_id ,me_name ,mo_name , mo_limit ";
	
	
	
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	%>
	<table>
	<tr>
		<td>회원아이디</td>
		<td>회원이름</td>
		<td>영화제목</td>
		<td>시험등급</td>
		<td>예매횟수</td>
	</tr>
	
	<%
	
	while(rs.next()){
		%>
	<tr>
		<td><%=rs.getString(1)%></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getString(3)%></td>
		<td><%=rs.getString(4)%></td>
		<td><%=rs.getString(5)%></td>
	</tr>
		
		
		<%
	}
	
	
	%>
	
			
	
</table>
<%@ include file="footer.jsp" %>
</body>
</html>