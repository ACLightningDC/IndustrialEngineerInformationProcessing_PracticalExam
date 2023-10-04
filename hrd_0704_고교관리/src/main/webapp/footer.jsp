<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>

<%
try{
	if(con != null) con.close();
	if(stmt != null) ps.close();
	if(stmt != null) rs .close();
	if(stmt != null) stmt.close();
}
catch(Exception e){
	e.printStackTrace();
}
%>