<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="condb.jsp"%>

<%



try{
	


String me_id = request.getParameter("me_id");
String me_pass = request.getParameter("me_pass");
String[] mo_name = request.getParameterValues("mo_name");
String rm_date = request.getParameter("rm_date");


sql  =" select me_pass";
sql +=" from movie_1";
sql +=" where me_id = ?";
ps = con.prepareStatement(sql);
ps.setString(1, me_id);


rs = ps.executeQuery();

if(rs.next()){
	if(!(rs.getString(1).equals(me_pass))){
		%>
		<script type="text/javascript">
		alert("비밀번호가 틀립니다.");
		location.href="insert2.jsp";
		</script>
		<%
	}
	
}else{
	%>
	<script type="text/javascript">
	alert("회원이 아닙니다.");
	location.href="insert.jsp";
	</script>
	<%
}

	
sql="insert into movie_2 values(?,?,?,?)";


for(int i =0; i < mo_name.length; i++ ){
	
	ps =con.prepareStatement(sql);
	
	out.print(mo_name[i]);
	ps.setString(1, me_id);
	ps.setString(2, me_pass);
	ps.setString(3, mo_name[i]);
	ps.setString(4,rm_date);
	
	ps.executeUpdate();
}



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
	e.printStackTrace();
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



