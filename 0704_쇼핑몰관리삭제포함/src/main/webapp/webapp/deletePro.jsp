<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file ="dbcon.jsp" %>
    <%
try{
		
		String memno = request.getParameter("memno");

		sql =  " delete member";
		sql += " where memno =?";

		ps = con.prepareStatement(sql);

		ps.setString(1, memno);

		ps.executeUpdate();

			
			%>
				<script type= "text/javascript">
				alert("회원삭제가 완료되었습니다");
				location.href="insert.jsp";
				</script>

			<% 

		} catch(Exception e) {
			
			%>
			<script type= "text/javascript">
			alert("회원삭제가 실패되었습니다");
			history.back();
			</script>
		<%
			
		} finally{
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
	