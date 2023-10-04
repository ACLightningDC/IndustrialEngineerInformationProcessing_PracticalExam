<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
try{
	if(con != null) con.close();
	if(ps != null) ps.close();
	if(rs != null) rs.close();
}catch(Exception e){
e.printStackTrace();	
}

%>
</head>
<body>
	<footer>
		<div>
			HRDKOREA Copyrightⓒ2019 All reserved.
		</div>
	</footer>

</body>
</html>