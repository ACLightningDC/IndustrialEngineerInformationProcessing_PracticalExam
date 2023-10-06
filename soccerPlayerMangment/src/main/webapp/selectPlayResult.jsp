<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="header.jsp" %>
<%
	sql="select match_no ,sum(player_score) ,sum(yellow_card),sum(red_card) from record_tbl group by match_no order by match_no asc";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();

%>
<body>
	<section>
		<div>
			<h1>경기 결과 조회</h1>
		</div>
		<div>
			<table>
				<tr>
					<th>경기번호</th>
					<th>득점</th>
					<th>경고수</th>
					<th>퇴장수</th>
				</tr>
				<%while(rs.next()){ %>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
				</tr>
				<%} %>
			</table>
			<%
			sql="select player_no , player_name ,sum(player_score) as playerScoreSum ,sum(yellow_card) as playerYellow_cardSum ,sum(red_card) as playerRed_cardSum from record_tbl join player_tbl using(player_no) group by player_no , player_name order by playerScoreSum desc  ,playerRed_cardSum asc , playerYellow_cardSum asc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int preSum = -1;
			do {%>
			최우수 선수 <%= rs.getString(1) %> <%= rs.getString(2) %> <%= rs.getString(3) %>골<br>
			<%
			preSum = rs.getInt(3);
			rs.next(); 
			}
			while(preSum == rs.getInt(3));%>
		</div>
	</section>
</body>
</html>