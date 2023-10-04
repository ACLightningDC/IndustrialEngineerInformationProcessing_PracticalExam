<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 조회/수정</title>
</head>
<body>
<%@include file="header.jsp" %>
<%

sql = " select member_no ,member_id, member_name ,";
sql+= " decode(member_grade ,'S','특별','A','우수','B','일반',' ') as member_grade ,";
sql+= " nvl(member_hobby,' '),to_char(member_date , 'YYYY,MM,DD') as member_date";
sql+= " from member_tbl_11";
sql+= " order by member_id ";

ps = con.prepareStatement(sql);
rs = ps.executeQuery();
%>
<section>
<div>
<h2>친구 조회/수정</h2>
</div>


	<div>
		<table>
			<tr>
				<th>회원번호</th>
				<th>회원ID</th>
				<th>이름</th>
				<th>등급</th>
				<th>취미</th>
				<th>등록일자</th>
			</tr>
			<%
			while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><a href="insert2.jsp?member_no=<%=rs.getString(1)%>"><%=rs.getString(2)%></a></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5).trim()%></td> <!-- null 처리 함수를 사용을 했을때 -->
				<%-- <td><%=rs.getString(5)!= null? rs.getString(5) :""%></td> --%>
				<%-- <td><%=if(rs.getString(5)!= null){out.printl("rs.getString(5)") }else{out.printl("")}%></td> --%>
				
				<td><%=rs.getString(6)%></td>
			</tr>
			<%
			}
			%>
			
		</table>
	</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>