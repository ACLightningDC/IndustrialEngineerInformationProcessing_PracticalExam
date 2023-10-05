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

<section>
	<div>
		<form action="insertInjectAction.jsp" method="post" name="f">
			<table>
				<tr>
					<th>예방접종이력번호</th>
					<td>
						<input type="text" name="p_send" size="20">
						예)20200001
					</td>
				</tr>
				<tr>
					<th>고객번호</th>
					<td>
						<input type="text" name="p_no" >
					</td>
				</tr>
				<tr>
					<th>백신코드</th>
					<td>
						<input type="text" name="i_code" >
					</td>
				</tr>
				<tr>
					<th>접종일자</th>
					<td>
						<input type="text" name="p_date" >
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="예방접종등록" onclick="insertInjectSubmit(); return false;">
						<input type="reset" value="다시쓰기" onclick="alert('정보를 지우고 처음부터 다시 입력합니다.')">
					</td>
				</tr>
			</table>
		</form>
	</div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>