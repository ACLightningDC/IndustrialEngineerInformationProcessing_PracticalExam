<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="javascript.js">
</script>
</head>
<body>
<%@ include file="header.jsp" %>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		
		
	
	<form action="insertPro.jsp" method="post" name="f">
	<table>
		<tr>
			<td>회원아이디</td><td><input type ="text" name = "me_id" value ="" size ="20" maxlength="12"></td>
		</tr>
		<tr>
			<td>회원비밀번호</td><td><input type ="password" name = "me_pass" value ="" size ="20" maxlength="15"></td>
		</tr>
		<tr>
			<td>회원이름</td><td><input type ="text" name = "me_name" value ="" size ="20" maxlength="20"></td>
		</tr>
		<tr>
			<td>성별</td><td>
			<label><input type ="radio" name = "gender" value ="M" >남자</label>
			<label></label><input type ="radio" name = "gender" value ="F" >여자</label>
			</td>
		</tr>
		<tr>
			<td>생년월일</td><td><input type ="text" name = "birth" value ="" size ="20" maxlength=""></td>
		</tr>
		<tr>
			<td>주소</td><td><input type ="text" name = "address" value ="" size ="20" maxlength="100"></td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type ="text" name = "tel" value ="" size ="20" maxlength="13"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type ="submit" value ="회원등록" onclick="check(); return false;">
			<input type ="button"  value ="다시쓰기" onclick="rewirte();">
			</td>
		</tr>
	</table>
	</form>
	
	</section>
		
	

<%@ include file="footer.jsp" %>
</body>
</html>