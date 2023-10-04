<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적등록</title>

</head>
<body>
<%@include file="header.jsp" %>
<section>
	<div>
	<h2>성적등록</h2>	
	</div>
	<div>
		<form action="insertPro2.jsp" method="post" name="f">
			<table>
				<tr>
					<th>학번</th><td><input type="text" value="" name="studno" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>학년</th><td><input type="text" value="" name="syear" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>전공1</th><td><input type="text" value="" name="m_subject1" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>전공2</th><td><input type="text" value="" name="m_subject2" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>전공3</th><td><input type="text" value="" name="m_subject3" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>교양1</th><td><input type="text" value="" name="s_subject1" size="" maxlength=""/></td>
				</tr>
				<tr>
					<th>교양2</th><td><input type="text" value="" name="s_subject2" size="" maxlength=""/></td>
				</tr>
				<tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="성적등록"  onclick="check2();return false;"/>
					<input type="button" value="조회" onclick="location.href='select'"/>
					</td>
				</tr>
			</table>
		
		</form>
	
	</div>

</section>
<%@include file="footer.jsp" %>

</body>
</html>