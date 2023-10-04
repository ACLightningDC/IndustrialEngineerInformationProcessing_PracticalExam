<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %>
		<section>
		<div >
			<h2>회원매출조회</h2>	
		</div>	
		
		<table style="border:2px soild black;width: 900px;">
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>가입일</th>
				<th>성별</th><!-- 만약 , 성별과 전화번호는 null값이 올 수 있으므로 -->
				<th>전화번호</th>
			</tr>
			
			<%@ page import="member.*, java.util.List" %>
			
			<%
			ShoppingDAO dao =  new ShoppingDAO();
			
			List<MemberBeans> list =  dao.getMembers();
			
			for(int i = 0 ; i<list.size() ;i++){
				MemberBeans beans = list.get(i);
			%>
			<tr align="center">
			<td><a href="insert2.jsp?custno=<%=beans.getCustno()%>"><%=beans.getCustno()%></a></td>
			<td><%=beans.getCustname()%></td>
			<td><%=beans.getPhone()%></td>
			<td><%=beans.getAddress()%></td>
			<td><%=beans.getJoindate()%></td>
			<td><%=beans.getGrade()%></td>
			<td><%=beans.getCity()%></td>			
			</tr>
			<%
			}
			%>
			
		</table>
	
	</section>
	
	<%@ include file="footer.jsp" %>
</body>
</html>