<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ include file="condb.jsp"%>
   
 <%
   try {
	      sql= " insert into member_tbl values(?,?,?,?,?,?)";
	      ps = con.prepareStatement(sql);
	      
	      ps.setString(1, request.getParameter("memno"));
	      ps.setString(2, request.getParameter("mname"));
	      ps.setString(3, request.getParameter("maddress"));
	      ps.setString(4, request.getParameter("joindate"));
	      ps.setString(5, request.getParameter("gender"));
	      ps.setString(6, request.getParameter("tel"));

	      ps.executeUpdate();
	      
		  %>
		  <script type="text/javascript">
			alert("회원 가입 성공");
			location.href="insert.jsp";
			</script>  
		  <%
	   }catch(Exception e){
		  e.printStackTrace();
	  %>
	  <script type="text/javascript">
		alert("회원 가입 실패");
		location.href="insert.jsp";
		</script>  
	  <%
   }finally{
	   try{
		   if(con!=null)con.close();
		   if(rs!=null)rs.close();
		   if(ps!=null)ps.close();
	   }catch(Exception e){
		   
	   }
	  
   }
   %>