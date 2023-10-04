<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="condb.jsp"%>

<%
sql = " insert into student_tbl values(?,?,?,?,?,?,?)";
try{
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("studno"));
	ps.setString(2, request.getParameter("syear"));
	ps.setString(3, request.getParameter("sname"));
	ps.setString(4, request.getParameter("address"));
	ps.setString(5, request.getParameter("gender"));
	ps.setString(6, request.getParameter("tel"));
	ps.setString(7, request.getParameter("idnum"));

	ps.executeUpdate();
	
	%>
	<script type="text/javascript">
	alert("학생 등록이 완료되었습니다.");
	location.href="insert.jsp";
	</script>
	<%
}catch(Exception e){
	%>
	<script type="text/javascript">
	alert("학생 등록에 실패했습니다.");
	location.href="insert.jsp";
	</script>
	<%
}finally {
	try{
		if(con != null) con.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}catch(Exception e){
	e.printStackTrace();	
	}
}


%>
