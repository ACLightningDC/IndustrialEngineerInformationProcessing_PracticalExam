<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbcon.jsp"%>

<%
try {
	
sql ="insert into examtbl_1 values(?,?,?,?,?,?,?,?,?)";
ps = con.prepareStatement(sql);

ps.setString(1, request.getParameter("syear"));
ps.setString(2, request.getParameter("sclass"));
ps.setString(3, request.getParameter("sno"));
ps.setString(4, request.getParameter("sname"));
ps.setString(5, request.getParameter("birth"));
ps.setString(6, request.getParameter("gender"));
ps.setString(7, request.getParameter("tel1"));
ps.setString(8, request.getParameter("tel2"));
ps.setString(9, request.getParameter("tel3"));

ps.executeUpdate();
	
%>
<script type="text/javascript">
	alert("학생등록이 완료되엇습니다.");
	location.href="insert.jsp";
</script>
<%

}catch(Exception e){
	%>
<script type="text/javascript">
	alert("학생등록이 실패되었습니다.");
	history.back();
</script>
	<%
	
}finally{
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

