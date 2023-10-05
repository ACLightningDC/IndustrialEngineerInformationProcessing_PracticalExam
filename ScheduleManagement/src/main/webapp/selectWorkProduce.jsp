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
	<% sql = "select substr(w_workno,1,4)||'-'||substr(w_workno,5,8) , p_code , p_name , p_size , p_type ,w_quantity ,to_char(w_workdate ,'YYYY-MM-DD')from tbl_product join tbl_worklist using(p_code)";
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
						<th>작업지시번호</th>
						<th>제품코드</th>
						<th>제품명</th>
						<th>제품규격</th>
						<th>제품구분</th>
						<th>수량</th>
						<th>작업시작일</th>
					</tr>
					<%while(rs.next()){  %>
					<tr>
						<td><%=rs.getString(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getString(5) %></td>
						<td><%=rs.getString(6) %></td>
						<td><%=rs.getString(7) %></td>
					</tr>
					<%} %>
				</table>
			</div>
		</section>
	<%@ include file="/Main/footer.jsp" %>
</body>
</html>