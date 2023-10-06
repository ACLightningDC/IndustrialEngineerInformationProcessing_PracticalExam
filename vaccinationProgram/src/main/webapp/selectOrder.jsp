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
	sql="select substr(p_send , 1,4)||'-'||substr(p_send,5,4),p_no,p_name,i_code,i_name,to_char(p_date,'yyyy-mm-dd')from tbl_order_201004 join tbl_cust_201004 using (p_no) join tbl_injection_201004 using(i_code)order by p_no asc ,i_code asc";
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
					<th>예방접종이력번호</th>
					<th>고객번호</th>
					<th>고객명</th>
					<th>백신코드</th>
					<th>백신주사명</th>
					<th>접종일자</th>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1)%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
				</tr>
				<%} %>
			</table>
		</div>
	</section>
</body>
</html>