<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% request.setCharacterEncoding("utf-8");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "exam01", "1234");
	
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	String sql = "";
	
	
%>

</body>
</html>