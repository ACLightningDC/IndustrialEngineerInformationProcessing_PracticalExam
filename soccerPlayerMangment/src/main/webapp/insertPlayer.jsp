<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<td><input type="text" name="player_no" ></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="player_name" ></td>
				</tr>
				<tr>
					<th>소속팀 번호</th>
					<td><input type="text" name="team_no" ></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="player_phone" ></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" name="player_birth" ></td>
				</tr>
				<tr>
					<th>메일주소</th>
					<td>
						<input type="text" name="player_email" >@
						<select name="player_email">
							<option value="@naver.com"> naver.com </option>
							<option value="@daum.com"> daum.com </option>
							<option value="@gmail.com"> gmail.com </option>
						</select>
					</td>
				</tr>
				<tr>
					<th>등번호</th>
					<td><input type="text" name="back_no" ></td>
				</tr>
			</table>
				<input type="submit" value="등록" >
				<input type="button" value="조회" onclick="location.href='selectPlayer.jsp'">
			</form>
		</div>
	</section>
</body>
</html>