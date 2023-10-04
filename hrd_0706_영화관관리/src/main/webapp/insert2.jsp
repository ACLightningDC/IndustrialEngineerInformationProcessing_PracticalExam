<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="javascript.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>

<%
sql = " select to_char(sysdate,'YYYY-MM-DD')";
sql+= " from dual";

ps = con.prepareStatement(sql);
rs = ps.executeQuery();

rs.next();

String rm_date = rs.getString(1);


%>
	<section>
		<div>
			<h2>회원등록하하</h2>
		</div>
		
	
	<form action="insertPro2.jsp" method="post" name="f">
	<table>
		<tr>
			<td>회원아이디</td><td><input type ="text" name = "me_id" value ="" size ="20" maxlength="12"></td>
		</tr>
		<tr>
			<td>회원비밀번호</td><td><input type ="password" name = "me_pass" value ="" size ="20" maxlength="15"></td>
		</tr>
		<tr>
			<td>영화제목</td><td>
			<select name="mo_name" multiple>
			
				<option value ="겨울왕국2">겨울왕국2</option>
				<option value ="늑대아이">늑대아이</option>
				<option value ="김복동">김복동</option>
				<option value ="시간을 달리는 소녀">시간을 달리는 소녀</option>
				<option value ="썸머 워즈">썸머 워즈</option>
				<option value ="눈의 여왕">눈의 여왕</option>
			</select>
		</tr>
		<tr>
			<td>예매일시</td>
			<td>
			<input type ="date" name = "rm_date" value ="" min= "<%=rm_date%>" max="2023-07-30" required pattern="\d{4}-\d{2}-\d{2}">
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type ="submit" value ="영화예매" onclick="check2(); return false;">
			<input type ="button"  value ="조회" onclick="location.href=select2.jsp">
			</td>
		</tr>
	</table>
	</form>
	
	</section>
		
	

<%@ include file="footer.jsp" %>
</body>
</html>