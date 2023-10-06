<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="header.jsp" %>
<%
sql = "select * from player_tbl where player_no = ? ";

ps = con.prepareStatement(sql);
ps.setString(1, request.getParameter("player_no"));
rs = ps.executeQuery();
rs.next();
String [] emailArray =null;
if(rs.getString(6)!=null){
	emailArray =  rs.getString(6).split("@");
}

%>
<script type="text/javascript">
function resetConfirm(){
	
}

</script>
</head>
<body>
	<section>
		<div>
			<h1>선수 정보 등록</h1>
		</div>
		<div>
			<form action="insertPlayerAction.jsp" method ="post">
			<table>
				<tr>
					<th>선수번호</th>
					<td><input type="text" name="player_no" value="<%=rs.getString(1)%>"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="player_name" value="<%=rs.getString(2)%>"></td>
				</tr>
				<tr>
					<th>소속팀 번호</th>
					<td><input type="text" name="team_no" value="<%=rs.getString(3)%>"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="player_phone" value="<%=rs.getString(4)%>"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="player_birth" value="<%=rs.getString(5)%>"></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td>
						<input type="text" name="player_email" value="<%=rs.getString(6)!=null?emailArray[0]:""%>">@
						<select name="player_email">
							<option value="@naver.com" <%= rs.getString(6)!=null?emailArray[1].equals("naver.com")?"selected":"":"" %>> naver.com </option>
							<option value="@daum.com" <%= rs.getString(6)!=null?emailArray[1].equals("daum.com")?"selected":"":"" %>> daum.com </option>
							<option value="@gmail.com" <%= rs.getString(6)!=null?emailArray[1].equals("gmail.com")?"selected":"":"" %>> gmail.com </option>
						</select>
					</td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><input type="text" name="back_no" value="<%=rs.getString(7)%>"></td>
				</tr>
			</table>
				<input type="submit" value="수정" >
				<input type="reset" value="초기화" onclick="if(!confirm('다시쓰기를 하겠습니까?'))return false;" >
			</form>
		</div>
	</section>
</body>
</html>