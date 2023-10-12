<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강생 조회/수정</title>
</head>
<body>
	<%@ include file="header.jsp" %>
	<%
		sql="";
	
	%>
	<section>
		<div>수강생 조회/수정</div>
		<div>
			<table>
				<tr>
					<th>수강생번호</th>
					<th>이름</th>
					<th>연락처</th>
					<th>생년월일</th>
					<th>메일주소</th>
					<th>아디</th>
					<th>비밀번호</th>
					<th>수강과목수</th>
				</tr>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
			</table>
			
			<%while(rs.next()){%>
				<%for(int i = 1; i<=rsmd.getColumnCount(); i++) {%>
					<%if(rsmd.getColumnName(i).equalsIgnoreCase("STUDENT_NO")) { %>			
				<%}%>
			<%}%>
			
		</div>
	</section>
	<%@ include file="footer.jsp" %>
</body>
</html>