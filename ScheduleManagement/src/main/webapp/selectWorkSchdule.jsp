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
	<% sql = "select substr(w_workno,1,4)||'-'||substr(w_workno,5,8) w_workno, p_code ,p_name ,decode(p_p1,'Y','완료','N','-') ,decode(p_p2,'Y','완료','N','-') ,decode(p_p3,'Y','완료','N','-'), decode(p_p4,'Y','완료','N','-') ,decode(p_p5,'Y','완료','N','-') , decode(p_p6,'Y','완료','N','-') ,to_char(to_date(w_lastdate ,'yyyymmdd'),'YYYY-MM-DD'), to_char(to_date(w_lasttime ,'HH24MI'),'HH24:MI')from tbl_product join tbl_worklist using(p_code) join tbl_process using(w_workno) order by w_workno";
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
						<th>준비</th>
						<th>인쇄</th>
						<th>코팅</th>
						<th>한지</th>
						<th>접합</th>
						<th>포장</th>
						<th>최종공정일자</th>
						<th>최종공정시간</th>
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
						<td><%=rs.getString(8) %></td>
						<td><%=rs.getString(9) %></td>
						<td><%=rs.getString(10) %></td>
						<td><%=rs.getString(11) %></td>
					</tr>
					<%} %>
				</table>
			</div>
		</section>
	<%@ include file="/Main/footer.jsp" %>
</body>
</html>