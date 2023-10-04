<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="javascript.js"></script>
</head>
<body>
<%@ include file="header.jsp" %>
<%

String memno =request.getParameter("memno");
String mname =request.getParameter("mname");


%>
	<section>
		<div>
			<h2>회원등록</h2>
		</div>
		
		
	
	<form action="insertPro2.jsp" method="post" name="f">
	<table>
		<tr>
			<td>회원번호</td><td><input type ="text" name = "memno" value ="<%=memno  %>" size ="20" maxlength="12"readonly="readonly">(자동생성)</td>
		</tr>
		<tr>
			<td>회원이름</td><td><input type ="text" name = "mname" value ="<%=mname  %>"size ="20" maxlength="15"></td>
		</tr>
		<tr>
			<td>트레이너</td>
			<td>
			<select name = "tno" onchange="changeSelect()">
			<%
			sql = " select *";
			sql+= " from trainer_tbl";

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			int i =1 ;
			while(rs.next()){
			%>
			<option value = "0<%=i++%>"><%=rs.getString(2)%><%=rs.getString(4)%></option>
			<%
			}
			%>
			</select>
			</td>
		</tr>
		<tr>
			<td>선택시간</td><td>
			
			<select name = "ttime" >
				<option value ="9:00~12:00" >9:00~12:00</option>
				<option value ="18:00~21:00" >12:00~15:00</option>
				<option value ="15:00~18:00" >15:00~18:00</option>
				<option value ="18:00~21:00" >18:00~21:00</option>
			</select>
			선택 트레이너와 담당시간을 선택해 주세요 
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type ="submit" value ="신청" onclick="check2(); return false;">
			<input type ="reset"  value ="조회" onclick="location.href=select2">
			</td>
		</tr>
	</table>
	</form>
	
	</section>
		
	

<%@ include file="footer.jsp" %>
</body>
</html>

<%@ page import ="java.util.TreeSet, java.util.Iterator"%>


