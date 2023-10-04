<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="dbcon.jsp" %>

<% 
try{
	
String memno = request.getParameter("memno");
String name = request.getParameter("name");
String address = request.getParameter("address");
String hiredate = request.getParameter("hiredate");
String gender = request.getParameter("gender");
String tel1 = request.getParameter("tel1");
String tel2 = request.getParameter("tel2");
String tel3 = request.getParameter("tel3");

sql =  " update member";
sql += " set name=?, address=? ,hiredate=? , gender=?, tel1=? , tel2=? , tel3=?";
sql += " where memno=?";

ps = con.prepareStatement(sql);

ps.setString(1, name);
ps.setString(2, address);
ps.setString(3, hiredate);
ps.setString(4, gender);
ps.setString(5, tel1);
ps.setString(6, tel2);
ps.setString(7, tel3);
ps.setString(8, memno);

out.println(sql);

out.println(name);
out.println(address);
out.println(hiredate);
out.println(gender);
out.println(tel1);
out.println(tel2);
out.println(tel3);
out.println(memno);

out.println(ps);

ps.executeUpdate();

	
	%>
		<script type= "text/javascript">
		alert("회원수정이 완료되었습니다");
		location.href="insert.jsp";
		</script>

	<% 

} catch(Exception e) {
	
	%>
	<script type= "text/javascript">
	alert("회원수정이 실패되었습니다");
	history.back();
	</script>
<%
	
} finally{
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
%>	

