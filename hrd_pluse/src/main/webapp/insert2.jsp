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

String rm_date_min = rs.getString(1);

/* 
sql =" select mo_name";
sql+=" from movie_3"; 
ps = con.prepareStatement(sql);
rs = ps.executeQuery();
 */
 
sql =" select to_char(sysdate, 'yyyy-mm-dd') as rm_date from dual";
rs= stmt.executeQuery(sql);
rs.next();
String rm_date = rs.getString("rm_date");

sql ="select mo_name from movie_3";
rs = stmt.executeQuery(sql);
if(!rs.next())
{
	System.out.print("등록된 영화가 없습니다.");

%>

<script>
	alert("등록된 영화가 없습니다")
</script>

<%
}
%>

	<section>
		<div>
			<h2>영화예매</h2>
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
			
<%				
				do{
%>
				<option value ="<%=rs.getString(1) %>"><%=rs.getString(1) %></option>
				<%
				}while(rs.next());
				%>			
			</select>
		</tr>
		<tr>
			<td>예매일시</td>
			<td>
			<input type ="date" name = "rm_date" value ="" min= "<%=rm_date_min%>" max="2023-07-30" required pattern="\d{4}-\d{2}-\d{2}">
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