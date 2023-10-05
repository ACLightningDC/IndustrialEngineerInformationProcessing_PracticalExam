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
<% 
	sql="";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
%>
	<section>
		<div>
			<h1>고객조회</h1>
		</div>
		<div>
			<table>
				<tr>
					<th>고객번호</th>
					<th>고객명</th>
					<th>고객생년월일</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>지역</th>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</section>
</body>
</html>