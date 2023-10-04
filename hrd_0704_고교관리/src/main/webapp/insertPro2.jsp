<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="dbcon.jsp"%>

<%
try {
	
sql ="insert into examtbl_3 values(?,?,?,?,?,?)";
ps = con.prepareStatement(sql);

ps.setString(1, request.getParameter("syear"));
ps.setString(2, request.getParameter("sclass"));
ps.setString(3, request.getParameter("sno"));
ps.setString(4, request.getParameter("kor"));
ps.setString(5, request.getParameter("eng"));
ps.setString(6, request.getParameter("math"));

ps.executeUpdate();
	
%>
<script type="text/javascript">
	alert("성적등록이 완료되었습니다.");
	location.href="insert.jsp";
</script>
<%
sql = "insert into examtbl_3(syear,sclass,sno) values(?,?,?)";

PreparedStatement ps2 = con.prepareStatement(sql);

ps2.setString(1, request.getParameter("syear"));
ps2.setString(2, request.getParameter("sclass"));
ps2.setString(3, request.getParameter("sno"));

ps2.executeUpdate();


}catch(Exception e){
	%>
<script type="text/javascript">
	alert("학생성적등록이 실패되었습니다.");
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

