<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="member.*"%>
	
	<%@include file ="header.jsp"  %>
	<%
 	ShoppingDAO dao = new ShoppingDAO();
	MemberBeans beans = dao.getMaxCustnojoindate();
	
		
	%>

	
	<script type ="text/javascript" src="js.js"></script>

	
	<form action="insertPro.jsp" method="post" name="f">
	<table>
		<tr>
			<td>회원번호(자동발생)</td><td><input type = "text" name = "custno" value="<%=beans.getCustno() %>" readonly="readonly"/></td>
		</tr>
		<tr>
			<td>회원성명</td><td><input type = "text" name = "custname" value="" /></td>
		</tr>
		<tr>
			<td>회원전화</td><td><input type = "text" name = "phone" value="" /></td>
		</tr>
		<tr>
			<td>회원주소</td><td><input type = "text" name = "address" value="" size="30" /></td>
		</tr>
		<tr>
			<td>가입일자</td><td><input type = "text" name = "joindate" value="<%=beans.getJoindate() %>" /></td>
		</tr>
		<tr>
			<td>고객등급 [A:VIP,B:일반,C:직원]</td><td><input type = "text" name = "grade" value="" maxlength="1"/></td>
		</tr>
		<tr>
			<td>도시코드</td><td><input type = "text" name = "city" value="" maxlength="2"/></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type = "submit" value="등록" onclick="check();"/>
			<input type = "button" value="조회" onclick="location.href='select.jsp'"/>
			</td>
		</tr>
	</table>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>