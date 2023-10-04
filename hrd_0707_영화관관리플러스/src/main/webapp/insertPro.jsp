<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ include file="condb.jsp"%>
   
 <%
   try {
      sql= "insert into movie_1 values(?,?,?,?,?,?,?)";
      ps = con.prepareStatement(sql);
      
      ps.setString(1, request.getParameter("me_id"));
      ps.setString(2, request.getParameter("me_pass"));
      ps.setString(3, request.getParameter("me_name"));
      ps.setString(4, request.getParameter("me_gender"));
      ps.setString(5, request.getParameter("birth"));
      ps.setString(6, request.getParameter("address"));
      ps.setString(7, request.getParameter("tel"));
      
      
      ps.executeUpdate();
      
      
      
      
	   %>
	   <script type="text/javascript">
		alert("회원가입 완료");
		location.href ="insert.jsp";
		
		</script>
	   <%
      
      
   }catch(Exception e){
	   e.printStackTrace();
	   %>
	   <script type="text/javascript">
		alert("회원가입 실패");
		location.href ="insert.jsp";
		</script>
	   <%
   }
 finally{
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