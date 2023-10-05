<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/Main/header.jsp" %>
	<% sql = "select p_code , p_name , p_size , p_type , to_char(p_price ,'L999,999,999') from tbl_product ";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
	%>
		<section>
			<div>
				<h2>제품조회</h2>
			</div>
			<div>
				<table>
					<tr>
						<th>제품코드</th>
						<th>제품명</th>
						<th>제품규격</th>
						<th>제품구분</th>
						<th>제품단가</th>
					</tr>
					<%while(rs.next()){  %>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
					</tr>
					<%} %>
				</table>
			</div>
		</section>
	<%@ include file="/Main/footer.jsp" %>
</body>
</html>