<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%
Date today = new Date(); 
//mm -> 분
SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yyyy년 MM월 dd일");
String nowDay = simpleDateFormat.format(today);
%>

<%=nowDay %>
</body>
</html>