<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학생등록</title>

</head>
<body>
<%@include file="header.jsp" %>
<%
sql = " select max(studno)+1";
sql += " from student_tbl";

ps = con.prepareStatement(sql);

rs = ps.executeQuery();
rs.next();
%>
<section>
	<div>
	<h2>학생등록</h2>	
	</div>
	<div>
		<form action="insertPro.jsp" method="post" name="f">
			<table>
				<tr>
					<th>학번</th><td><input type="text" value="<%= rs.getString(1) %>" name="studno" size="" maxlength=""/>(자동생성)</td>
				</tr>
				<tr>
					<th>학년</th><td><input type="text" value="01" name="syear" size="" maxlength=""/>(자동입력)</td>
				</tr>
				<tr>
					<th>학생이름</th><td><input type="text" value="" name="sname" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>학생주소</th><td><input type="text" value="" name="address" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>학생성별</th>
					<td>
					<label><input type="radio" value="M" name="gender" size="" maxlength=""/>남자</label>
					<label><input type="radio" value="F" name="gender" size="" maxlength=""/>여자</label>
					</td>
				</tr>
				<tr>
					<th>전화번호</th><td><input type="text" value="" name="tel" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>주민번호</th><td><input type="text" value="" name="idnum" size="" maxlength=""/></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="학생등록"  onclick="check();return false;"/>
					<input type="reset" value="다시쓰기" size="" maxlength=""/>
					</td>
				</tr>
			</table>
		
		</form>
	
	</div>

</section>
<%@include file="footer.jsp" %>

</body>
</html>