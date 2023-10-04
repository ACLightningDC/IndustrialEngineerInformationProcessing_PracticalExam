<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 등록</title>
<script type="text/javascript" src="js.js"></script>

</head>
<body>
<%@include file="header.jsp" %>
<%
sql =" select max(member_no)+1, to_char(sysdate,'YYYY/MM/DD')";
sql+=" from member_tbl_11";

ps =con.prepareStatement(sql);
rs = ps.executeQuery();
rs.next();

%>
<section>
<div>
	<h2>친구 등록</h2>
</div>
<form action="insertPro.jsp" method="post" name="f">
<div>
<table>
<tr>
	<td>회원번호</td><td><input type="text" name="member_no" value="<%=rs.getString(1) %>" size="" maxlength=""></td>
</tr>
<tr>
	<td>회원ID</td><td><input type="text" name="member_id" value="" size="" maxlength="10"></td>
</tr>
<tr>
	<td>이름</td><td><input type="text" name="member_name" value="" size="" maxlength="20"></td>
</tr>
<tr>
	<td>등급</td>
	<td>
	<select name ="member_grade" size ="4">
		<option value="S">특별회원</option>
		<option value="A">우수회원</option>
		<option value="B">일반회원</option>
	</select>
	</td>
</tr>
<tr>
	<td>취미</td>
	<td>
	<label><input type="checkbox" name="member_hobby" value="독서" >독서</label>
	<label><input type="checkbox" name="member_hobby" value="운동" >운동</label>
	<label><input type="checkbox" name="member_hobby" value="영화" >영화</label>
	</td>
</tr>
<tr>
	<td>등록일자</td><td><input type="text" name="member_date" value="<%=rs.getString(2) %>" size="" maxlength=""></td>
</tr>
<tr>
	<td colspan="2"><input type="submit" onclick="check();return false;" value ="등록">
	<input type="button" onclick="location.href='select.jsp'" value ="조회"></td>
</tr>
</table>
</div>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>