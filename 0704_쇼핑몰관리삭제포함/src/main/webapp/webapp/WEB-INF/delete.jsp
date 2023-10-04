<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

		String memno = request.getParameter("memno");
		sql = "delete MEMBER";
		sql +="where memno =?";
		
		ps = con.prepareStatement(sql);
		
		ps.setString(1, memno);
		
		ps.executeUpdate();
