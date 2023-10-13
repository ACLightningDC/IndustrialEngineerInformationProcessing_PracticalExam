<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="dbcon.jsp"%>
<% 

try{
	sql="insert into tbl_vote_202005 values (?,?,?,?,?,?)";
	ps = con.prepareStatement(sql);
	ps.setString(1, request.getParameter("v_jumin"));
	ps.setString(2, request.getParameter("v_name"));
	ps.setString(6, request.getParameter("m_no"));
	ps.setString(3, request.getParameter("v_time"));
	ps.setString(4, request.getParameter("v_area"));
	ps.setString(5, request.getParameter("v_confirm"));
	
	ps.executeUpdate();
	
	con.commit();
	
	%>
	
	<script>
		alert('투표하기 정보가 정상적으로 등록 되었습니다');
		location.href="index.jsp"
	</script>
	
	<%
}catch(Exception e){
	e.printStackTrace();
%>
	
	<script>
		alert('투표하기가 실패되었습니다.');
		history.back();
	</script>
	
	<%
}finally{
		if(con != null) con.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();

}


%>