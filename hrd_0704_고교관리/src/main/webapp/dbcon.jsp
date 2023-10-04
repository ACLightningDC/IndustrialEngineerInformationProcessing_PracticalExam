<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); 

Class.forName("oracle.jdbc.OracleDriver");

Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");

Statement stmt = con.createStatement();//SQL문이 없는 비어있는 구문객체
PreparedStatement ps = null;

ResultSet rs = null; 

String sql = "";
%>