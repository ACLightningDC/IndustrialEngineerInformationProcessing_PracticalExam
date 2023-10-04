<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--  ★ 중요 : DB 연결 파일 포함 -->
<%@ include file="dbcon.jsp" %> <!--  컴파일에 소스 그대로 복사하여 포함 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<!--  ★ 중요 : style.css 연결 -->
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<header>
		<h2>쇼핑몰 관리프로그램</h2>
	</header>
	
	<nav>
		<a href="insert.jsp">회원등록</a>
		<a href="select.jsp">회원조회/수정</a>
		<a href="select2.jsp">매출조회</a>
		<a href="index.jsp">홈으로</a>
	</nav>
</body>
</html>