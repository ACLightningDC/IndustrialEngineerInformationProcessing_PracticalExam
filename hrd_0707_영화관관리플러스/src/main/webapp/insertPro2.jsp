<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   <%@ include file="condb.jsp"%>
   
 <%
   try {
	      sql= " insert into apptrainer_tbl values(?,?,?,?)";
	      ps = con.prepareStatement(sql);
	      
	      ps.setString(1, request.getParameter("memno"));
	      ps.setString(2, request.getParameter("mname"));
	      ps.setString(3, request.getParameter("tno"));
	      ps.setString(4, request.getParameter("ttime"));

	      ps.executeUpdate();
	      
		  %>
		  <script type="text/javascript">
			alert("트레이너 신청 성공");
			location.href="insert.jsp";
			</script>  
		  <%
	   }catch(Exception e){
		  e.printStackTrace();
	  %>
	  <script type="text/javascript">
		alert("트레이너 가입 실패");
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