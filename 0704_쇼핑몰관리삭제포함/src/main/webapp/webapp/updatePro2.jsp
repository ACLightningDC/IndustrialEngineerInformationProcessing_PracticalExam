<%@page import="java.awt.print.Printable"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="dbcon.jsp" %>

<% 
String pro = request.getParameter("pro");
out.print(pro);
switch(pro)
{
case "수정" :
	try{

		sql =  " update member";
		sql += " set name=?, address=? ,hiredate=? , gender=?, tel1=? , tel2=? , tel3=?";
		sql += " where memno=?";

		ps = con.prepareStatement(sql);

		ps.setString(1, request.getParameter("name"));
		ps.setString(2, request.getParameter("address"));
		ps.setString(3, request.getParameter("hiredate"));
		ps.setString(4, request.getParameter("gender"));
		ps.setString(5, request.getParameter("tel1"));
		ps.setString(6, request.getParameter("tel2"));
		ps.setString(7, request.getParameter("tel3"));
		ps.setString(8, request.getParameter("memno"));

		ps.executeUpdate();

			
			%>
				<script type= "text/javascript">
				alert("회원수정이 완료되었습니다");
				location.href="insert.jsp";
				</script>

			<% 

		} catch(Exception e) {
			
			%>
			<script type= "text/javascript">
			alert("회원수정이 실패되었습니다");
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

		break;//"수정 끝"
		
case "삭제" :
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

		break;//"삭제 끝"
}//switch 끝
%>	

