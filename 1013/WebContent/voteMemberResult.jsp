<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="header.jsp" %>
	<% 
	sql ="";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	%>
	<section>
		<div>
			<h1>후보조회</h1>
		</div>
		<div>
			<table>
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>총투표건수</td>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
				</tr>
				<%} %>
			</table>
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>