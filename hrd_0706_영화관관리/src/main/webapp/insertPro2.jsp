<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="condb.jsp"%>

<%
try{
	
	
sql=" insert into movie_2 values(?,?,?,?)";

ps =con.prepareStatement(sql);

String me_id = request.getParameter("me_id");
String mo_pass = request.getParameter("me_pass");
String mo_name = request.getParameter("mo_name");
String rm_date = request.getParameter("rm_date");

	
	ps.setString(1, me_id);
	ps.setString(2, mo_pass);
	ps.setString(3, mo_name);
	ps.setString(4, rm_date);
	
	ps.executeUpdate();



%>
<script type="text/javascript">
alert("영화예매가 완료되었습니다.");
location.href="insert2.jsp";
</script>

<%

}catch(Exception e){
	
	%>
	<script type="text/javascript">
	alert("영화예매가 실패되었습니다.");
	location.href="insert2.jsp";
	</script>
	
	<%
	
}finally{
try{
	if(con!=null)con.close();
	 if(stmt!=null)stmt.close();
	 if(ps!=null)ps.close();
	 if(rs!=null)rs.close();
	 	
}catch(Exception e){
	e.printStackTrace();
}
 
	
}
	%>



