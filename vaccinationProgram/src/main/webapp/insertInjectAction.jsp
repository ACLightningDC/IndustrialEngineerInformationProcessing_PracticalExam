<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="connection.jsp" %>
<%
	sql="insert into tbl_order_201004 values (?,?,?,?)";

	ps = con.prepareStatement(sql);
	
	ps.setString(1, request.getParameter("p_send") );
	ps.setString(2, request.getParameter("p_no"));
	ps.setString(3, request.getParameter("i_code"));
	ps.setString(4, request.getParameter("p_date"));
	
	ps.executeUpdate();
				
	con.commit();
	
	try{
		if(con!=null){con.close();}
		if(ps!=null){ps.close();}
		if(rs!=null){rs.close();}
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<html>
	<script type="text/javascript">
		alert('예방접종등록 번호가 정상적으로 등록되었습니다.');
		location.href = 'index.jsp'
	</script>
</html>