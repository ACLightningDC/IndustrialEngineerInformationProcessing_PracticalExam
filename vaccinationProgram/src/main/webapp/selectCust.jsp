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
	sql="select p_no , p_name ,to_char(to_date(p_birth ,'yyyymmdd'),'YYYY\"년\"MM\"월\"DD\"일\"')|| '('||trunc(months_between('20200101',to_date(p_birth ,'yyyymmdd'))/12,0)||')',decode(p_gender ,'M','남','F','여'),p_tel1||'-'||p_tel2||'-'||p_tel3 , decode(p_city, '10','서울','20','경기','30','강원','40','대구')from tbl_cust_201004";
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
					<th>고객번호</th>
					<th>고객명</th>
					<th>고객생년월일</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>지역</th>
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