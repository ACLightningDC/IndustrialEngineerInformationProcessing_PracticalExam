<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="connection.jsp" %>
	<% sql = "insert into player_tbl values (?,?,?,?,?,?,?)"; 
	ps = con.prepareStatement(sql);
	
	String[] player_emailArray = 	request.getParameterValues("player_email");
	String email = player_emailArray[0].concat(player_emailArray[1]);
	
	System.out.println(email);
	
	ps.setString(1, request.getParameter("player_no"));
	ps.setString(2, request.getParameter("player_name"));
	ps.setString(3, request.getParameter("team_no"));
	ps.setString(4, request.getParameter("player_phone"));
	ps.setString(5, request.getParameter("player_birth"));
	ps.setString(6, email);
	ps.setString(7, request.getParameter("back_no"));
	
	ps.executeUpdate();
	
	con.commit();
	%>
	<script type="text/javascript">
		alert("선수정보등록이 완료되었습니다.");
		history.back();
	</script>
</body>
</html>