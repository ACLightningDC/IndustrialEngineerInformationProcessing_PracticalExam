<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구현황조회</title>
</head>
<body>
<%@include file="header.jsp" %>
<%



sql = " select t2.member_id ,t2.member_name,to_char(t1.req_date,'YYYY-MM-DD')";
sql+= " from friend_tbl_11 t1 join member_tbl_11 t2 ";
sql+= " on t1.req_member_no = member_no or t1.res_member_no = member_no";
sql+= " where (t1.req_member_no ='1001' or t1.res_member_no ='1001') and t1.allow_yn ='Y' and not t2.member_no='1001'";



ps = con.prepareStatement(sql);
rs = ps.executeQuery();
%>


<section>
<div>
<h2>친구조회(1001)</h2>
</div>
	<div>
	<figure>
		<table>
			<tr>
				<th>회원ID</th>
				<th>회원명</th>
				<th>요청일자</th>
			</tr>
			<%
			int friendCnt = 0;
			while(rs.next()){
				friendCnt++;
			%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<%
			}
			%>
			<%
			
			//친구 세기 방법-1
			

			sql = " select count(t2.member_id)" ;
			sql+= " from friend_tbl_11 t1 join member_tbl_11 t2";
			sql+= " on t1.req_member_no = member_no or t1.res_member_no = member_no" ;
			sql+= " where (t1.req_member_no ='1001' or t1.res_member_no ='1001') and t1.allow_yn ='Y' and not t2.member_no='1001'";
			
			
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			%>
		</table>
			
			<figcaption style ="text-align:left;">친구 : <%=rs.getString(1) %></figcaption>
			<td><%=rs.getRow()%> 명
			</figure>
	</div>
</section>
<%@include file="footer.jsp" %>
</body>
</html>