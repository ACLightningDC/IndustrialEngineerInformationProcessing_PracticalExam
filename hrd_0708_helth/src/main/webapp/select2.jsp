<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file ="header.jsp" %>
<%
sql = " select tno , tname, ttime ,count(memno)";
sql+= " from apptrainer_tbl join trainer_tbl";
sql+= " using (tno , ttime )";
sql+= " group by tno, tname ,ttime";
sql+= " order by tno";

ps = con.prepareStatement(sql);
rs = ps.executeQuery();
%>
<section>
	<div>
		<h2>트레이너 목록</h2>
	</div>
	<table>
		<tr>
			<th>트레이너번호<th>
			<th>트레이너이름<th>
			<th>담당시간<th>
			<th>담당회원수<th>
		</tr>
		<%
		while(rs.next()){
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


<%@include file ="footer.jsp" %>

</body>
</html>