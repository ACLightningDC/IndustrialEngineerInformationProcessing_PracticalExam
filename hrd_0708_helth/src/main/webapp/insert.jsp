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
sql = "select nvl(max(memno),0)+1, to_char(sysdate,'YY-MM-DD')";
sql+= "from member_tbl";

ps=con.prepareStatement(sql);
rs = ps.executeQuery();
rs.next();

%>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		
		
	
	<form action="insertPro.jsp" method="post" name="f">
	<table>
		<tr>
			<td>회원번호</td><td><input type ="text" name = "memno" value ="<%=rs.getString(1) %>" size ="20" maxlength="12"readonly="readonly">(자동생성)</td>
		</tr>
		<tr>
			<td>회원이름</td><td><input type ="text" name = "mname" value ="" size ="20" maxlength="15"></td>
		</tr>
		<tr>
			<td>회원주소</td><td><input type ="text" name = "maddress" value ="" size ="20" maxlength="20"></td>
		</tr>
		<tr>
			<td>등록일</td><td><input type ="text" name = "joindate" value ="<%=rs.getString(2) %>" size ="20" maxlength=""readonly="readonly">(자동생성)</td>
		</tr>
		<tr>
			<td>성별</td><td>
			<input type ="radio" name = "gender" value ="M" >
			<input type ="radio" name = "gender" value ="F" >
			</td>
		</tr>
		<tr>
			<td>전화번호</td><td><input type ="text" name = "tel" value ="" size ="20" maxlength="13"></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type ="submit" value ="회원등록" onclick="check(); return false;">
			<input type ="reset"  value ="다시쓰기" onclick="">
			</td>
		</tr>
	</table>
	</form>
	
	</section>
		
	

<%@ include file="footer.jsp" %>
</body>
</html>