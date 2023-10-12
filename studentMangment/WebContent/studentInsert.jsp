<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="studentInsertJavaScript.js"></script>
</head>
<%@include file="header.jsp" %>
<body>
	<form method="post"  name="f">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="student_name" value="">
			</td>
			<tr>
				<td>주소</td>
				<td><input type="text" name="student_addr" value="" size="30">
			</td>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="student_phone" value="">
			</td>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="student_birth" value="">
			</td>
			<tr>
				<td>메일주소</td>
				<td>
					<input type="text" name="student_email" value="">
					@
					<select name="student_email">
						<option value="@naver.com">naver.com</option>
						<option value="@chol.net">chol.net</option>
						<option value="@gmail.com">gmail.com</option>
					</select>				
				</td>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="student_id" value="">
			</td>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="student_pw" value="">
			</td>
		</table>
		<input type="submit" value="등록" onclick="studentInsertCheck(); return false;">
		<input type="button" value="조회" onclick="location.href='studentSelect.jsp'">
	</form>
<%@include file="footer.jsp" %>
</body>
</html>