<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@include file = "dbcon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고교 성적관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<header>
	<h2>고교 성적관리 프로그램</h2>
</header>
	
	<nav>
		<a href = "insert.jsp">학생등록</a>
		<a href = "insert2.jsp">성적등록</a>
		<a href = "select.jsp">성적조회</a>
		<a href = "select2.jsp">반별평균</a>
		<a href = "index.jsp">홈으로</a>
	</nav>
	
</body>
</html>