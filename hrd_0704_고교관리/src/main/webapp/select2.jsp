<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "header.jsp" %>

<section>
<div>
<h2>반별 평균</h2>
</div>
<table>
<tr>
	<th>학년</th>
	<th>반</th>
	<th>교사명</th>
	<th>국어 총점</th>
	<th>영어 총점</th>
	<th>수학 총점</th>
	<th>국어 평균</th>
	<th>영어 평균</th>
	<th>수학 평균</th>
</tr>

<%
sql = " select syear , sclass, tname,  sum(kor), sum(eng), sum(math) ,";
sql +=" round(avg(nvl(kor,0)),1), round(avg(nvl(eng,0)),1),round(avg(nvl(math,0)),1)";
sql +=" from examtbl_2  join examtbl_3";
sql +=" using (syear , sclass)";
sql +=" group by syear ,sclass , tname";
sql +=" order by syear , sclass";

ps =  con.prepareStatement(sql);
rs = ps.executeQuery();

while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString(1) %></td>
		<td><%=rs.getString(2) %></td>
		<td><%=rs.getString(3)!=null?rs.getString(3):"" %></td>
		<td><%=rs.getString(4) %></td>
		<td><%=rs.getString(5) %></td>
		<td><%=rs.getString(6) %></td>
		<td><%=rs.getString(7) %></td>
		<td><%=rs.getString(8) %></td>
		<td><%=rs.getString(9) %></td>
	</tr>
	
	<%
}

%>

</table>
</section>


<%@ include file = "footer.jsp" %>
</body>
</html>