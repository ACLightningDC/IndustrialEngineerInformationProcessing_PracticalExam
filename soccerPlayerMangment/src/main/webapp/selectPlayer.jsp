<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp" %>
<%
	sql = " select player_no , player_name , team_no , player_phone ,back_no, to_char(player_birth ,'MM/dd'), nvl(player_email , ' ') from player_tbl";
	ps = con.prepareStatement(sql);
	
	rs = ps.executeQuery();
%>
</head>
<body>
	<section>
		<div>
			<h1>선수 정보 조회/수정</h1>
		</div>
		<div>
			<table>
				<tr>
					<th>선수번호</th>
					<th>이름</th>
					<th>소속팀번호</th>
					<th>연락처</th>
					<th>등번호</th>
					<th>생일</th>
					<th>메일주소</th>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1) %>
					<td><a href="updatePlayer.jsp?player_no=<%=rs.getString(1) %>"><%=rs.getString(2) %></a>
					<td><%=rs.getString(3) %>
					<td><%=rs.getString(4) %>
					<td><%=rs.getString(5) %>
					<td><%=rs.getString(6) %>
					<td><%=rs.getString(7) %>
				</tr>
				<%} %>
			</table>
		</div>
	</section>
</body>
</html>