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
<%
sql =" select '성적 우수자' ,                                                   ";
sql +=" count(case when m_subject1 <= hiscore then '1'end)||'명',                ";
sql +=" count(case when m_subject2 <= hiscore then '1'end)||'명',                ";
sql +=" count(case when m_subject3 <= hiscore then '1'end)||'명',                ";
sql +=" count(case when s_subject1 <= hiscore then '1'end)||'명',                ";
sql +=" count(case when s_subject2 <= hiscore then '1'end)||'명'                 ";
sql +=" from score_tbl join (select hiscore from grade_tbl where grade ='F')     ";
sql +=" on 1 = 1                                                                 ";
sql +=" union                                                                    ";
sql +=" select '재수강 대상자',                                                  ";
sql +=" count(case when m_subject1 >= loscore then '1'end)||'명',                ";
sql +=" count(case when m_subject2 >= loscore then '1'end)||'명',                ";
sql +=" count(case when m_subject3 >= loscore then '1'end)||'명',                ";
sql +=" count(case when s_subject1 >= loscore then '1'end)||'명',                ";
sql +=" count(case when s_subject2 >= loscore then '1'end)||'명'                 ";
sql +=" from score_tbl                                                           ";
sql +=" join (select loscore from grade_tbl where grade ='A')                    ";
sql +=" on 1 = 1                                                                 ";

ps = con.prepareStatement(sql);
rs = ps.executeQuery();

ResultSetMetaData rsmd = rs.getMetaData();

String collab = rsmd.getColumnLabel(2);
String collname = rsmd.getColumnName(3);
String collclassname = rsmd.getColumnClassName(4);
%>

<section>
	<div>
		<table>
			<tr>
				<th>과목</th>
				<th>전공1</th>
				<th>전공2</th>
				<th>전공3</th>
				<th>교양1</th>
				<th>교양2</th>
			</tr>
			<% 
			while(rs.next()){
			%>
			<tr>
				<th><%= rs.getString(1) %></th>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
				<td><%= rs.getString(5) %></td>
				<td><%= rs.getString(6) %></td>
			</tr>
			<%
			}
			%>
		</table>
	</div>
<%=collab + collname + collclassname%>
</section>

<%@include file="footer.jsp" %>
</body>
</html>