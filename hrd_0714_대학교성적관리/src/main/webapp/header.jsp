<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file ="condb.jsp" %>
<link rel ="stylesheet" type="text/css" href="style.css"/>
<script type="text/javascript" src="js.js"></script>
</head>
<body>
<header>
	<div>
		<h2>대학교 성적관리 프로그램</h2>
	</div>
</header>
<nav>
	<div>
		<a href="insert.jsp">학생등록</a>
		<a href="insert2.jsp">성적등록</a>
		<a href="select.jsp">성적조회</a>
		<a href="select2.jsp">재수강대상자</a>
		<a href="index.jsp">홈으로</a>
	</div>
</nav>

</body>
</html>