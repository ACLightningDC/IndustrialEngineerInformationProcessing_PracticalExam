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
<% 
	sql="select i_code , i_name , count(i_code)from tbl_injection_201004 join tbl_order_201004 using(i_code)group by i_code , i_name order by i_code asc";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
%>
	<section>
		<div>
			<h1>고객조회</h1>
		</div>
		<div>
			<table>
				<tr>
					<th>백신코드</th>
					<th>백신주사명</th>
					<th>백신별총건수</th>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
				</tr>
				<%} %>
			</table>
		</div>
	</section>
</body>
</html>