<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="member.*, java.util.List" %>
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
				<th>회원성명</th>
				<th>고객등극</th>
				<th>매출</th>
			</tr>
			
			
			<%
			ShoppingDAO dao =  new ShoppingDAO();
			List<SalesBeans> list =  dao.getSales();
			
			for(int i = 0 ; i<list.size() ;i++){
				SalesBeans beans = list.get(i);
			%>
			<tr align="center">
			
			<td><%=beans.getCustno()%></td>
			<td><%=beans.getCustname()%></td>
			<td><%=beans.getGrade()%></td>
			<td><%=beans.getTotalprice()%></td>			
			
			</tr>
			<%
			}
			%>
			
		</table>
	
	</section>
	
	<%@ include file="footer.jsp" %>
</body>
</html>