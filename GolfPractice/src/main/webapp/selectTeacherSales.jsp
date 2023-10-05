<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="header.jsp" %>
<% sql = "select teacher_code , class_name , teacher_name , to_char(sum(tuition) ,'L999,999,999')from tbl_teacher_202201 join tbl_class_202201 using (teacher_code) group by teacher_code , class_name , teacher_name order by teacher_code"; 
ps = con.prepareStatement(sql);
rs = ps.executeQuery();
%>
<table id="selectEacherSalesTable">
<tr>
	<th>강사코드</th>
	<th>강의명</th>
	<th>강사명</th>
	<th>총매출</th>
</tr>
<%while(rs.next()){%>
<tr>
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
</tr>
<%} %>
</table>
<%@include file="footer.jsp" %>

</body>
</html>