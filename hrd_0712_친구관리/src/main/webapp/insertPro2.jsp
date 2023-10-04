<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="condb.jsp" %>

<%
String sw = request.getParameter("sw");
out.print(sw);

switch(sw){
case "1" :
	try{
		sql ="	update member_tbl_11";
		sql +="	set member_id=? ,member_name= ?,member_grade= ?,member_hobby= ?,member_date=?";
		sql +="	where member_no = ?";

		ps =con.prepareStatement(sql);

		String[] member_hobby = request.getParameterValues("member_hobby");

		String member_h ="";

		for(int i =0 ; i < member_hobby.length; i++){
			member_h += member_hobby[i];
			if(!(i == member_hobby.length-1)){
				member_h +=",";
		}
		}

		ps.setString(6, request.getParameter("member_no"));
		ps.setString(1, request.getParameter("member_id"));
		ps.setString(2, request.getParameter("member_name"));
		ps.setString(3, request.getParameter("member_grade"));
		ps.setString(4, member_h);
		ps.setString(5, request.getParameter("member_date"));

		ps.executeUpdate();

		%>
		<script type="text/javascript">
		alert("회원등록이 완료 되었습니다.");
		location.href="insert.jsp";
		</script>
		<%
		}catch(Exception e){
			%>
			<script type="text/javascript">
			alert("회원등록이 실패 되었습니다.");
			location.href="insert.jsp";
			</script>
			<%
			e.printStackTrace();
		}finally{
			try{
				if(con!=null)con.close();
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();
			}catch(Exception e){
				
			}
		}
	
	break;
case "2" :
	try{
		sql = "	delete member_tbl_11";
		sql +="	where member_no = ?";
		

		ps =con.prepareStatement(sql);
		

		ps.setString(1, request.getParameter("member_no"));

		ps.executeUpdate();

		%>
		<script type="text/javascript">
		alert("회원삭제가 완료 되었습니다.");
		location.href="insert.jsp";
		</script>
		<%
		}catch(Exception e){
			%>
			<script type="text/javascript">
			alert("회원삭제가 실패 되었습니다.");
			location.href="insert.jsp";
			</script>
			<%
			e.printStackTrace();
		}finally{
			try{
				if(con!=null)con.close();
				if(ps!=null)ps.close();
				if(rs!=null)rs.close();
			}catch(Exception e){
				
			}
		}
	break;
}




%>