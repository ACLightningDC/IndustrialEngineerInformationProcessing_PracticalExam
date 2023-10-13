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
	sql ="select m_no , m_name, p_name,decode(p_school,'1','고졸','2','학사','3','석사','4','박사') ,substr(m_jumin , '1','6') ||'-'||substr(m_jumin , '6') ,m_city,p_tel1||'-'||p_tel2||'-'||p_tel3 from tbl_party_202005 natural join tbl_member_202005 ";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	%>
	<section>
		<div>
			<h1>후보조회</h1>
		</div>
		<div>
			<table>
				<tr>
					<td>후보번호</td>
					<td>성명</td>
					<td>소속정당</td>
					<td>학력</td>
					<td>주민번호</td>
					<td>지역구</td>
					<td>대표전화</td>
				</tr>
				<%while(rs.next()){ %>
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
	<%@include file="footer.jsp" %>
</body>
</html>