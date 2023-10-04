<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
sql = " select memno , mname , maddress,to_char(joindate, 'YYYY-MM-DD'), decode(gender, 'M' , '남자', 'F' , '여자','') ,tel";
sql +=" from member_tbl";

ps = con.prepareStatement(sql);
rs = ps.executeQuery();
%>

	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		
	</section>
	<table>
	
	
		<tr>
			<th>회원번호</th>		
			<th>회원이름</th>		
			<th>회원주소</th>		
			<th>등록일</th>		
			<th>성별</th>		
			<th>전화번호</th>		
		</tr>
		<%
		while(rs.next()){
		%>
		
		<tr>
			<td><a href="insert2.jsp?memno=<%=rs.getString(1) %>&mname=<%=URLEncoder.encode(rs.getString(2), "UTF-8") %>"><%=rs.getString(1) %></a></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
		</tr>
		<%
		}
		%>
	
	</table>
	
	

<%@ include file="footer.jsp" %>
</body>
</html>