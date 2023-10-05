<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

function CheckFrom(){
	 if(f.w_workno.value == null){
		 alert('작업지시번호를 입력해 주세요');
		 return f.w_workno.focus();
	 }
	 else if(f.p_p1[0].checked == false && f.p_p1[1].checked == false){
		 alert('재료 준비를 체크해 주세요');
		 return false;
	 }
	 else if(f.p_p2[0].checked == false && f.p_p2[1].checked == false){
		 alert('인쇄공정를 체크해 주세요');
		 return false;
	 }
	 else if(f.p_p3[0].checked == false && f.p_p4[1].checked == false){
		 alert('코팅공정를 체크해 주세요');
		 return false;
	 }
	 else if(f.p_p4[0].checked == false && f.p_p4[1].checked == false){
		 alert('합지공정를 체크해 주세요');
		 return false;
	 }
	 else if(f.p_p5[0].checked == false && f.p_p5[1].checked == false){
		 alert('접합공정를 체크해 주세요');
		 return false;
	 }
	 else if(f.p_p6[0].checked == false && f.p_p6[1].checked == false){
		 alert('포장적재를 체크해 주세요');
		 return false;
	 }
}

function insertSubmit(){
	CheckFrom()
	 
	 f.action = "insertWorkAction.jsp";
	 f.submit();
 }
function updateSubmit(){
	CheckFrom()
	 
	 f.action = "updateWorkAction.jsp";
	 f.submit();
 }
 
</script>
</head>

<body>
	<%@ include file="/Main/header.jsp" %>
	<div>
		<h2>작업 공정 등록</h2>
	</div>
	<div>
		<form method="post" name="f">
			<table>
				<tr>
					<th>작업지시번호</th>
					<td><input type="text" name="w_workno">예)20190001</td>
				</tr>
				<tr>
					<th>재료준비</th>
					<td>
						<input type="radio" name="p_p1">
						<input type="radio" name="p_p1">
					</td>	
				</tr>
				<tr>
					<th>인쇄공정</th>
					<td>
						<input type="radio" name="p_p2">
						<input type="radio" name="p_p2">
					</td>
				</tr>
				<tr>
					<th>코팅공정</th>
					<td>
						<input type="radio" name="p_p3">
						<input type="radio" name="p_p3">
					</td>
				</tr>
				<tr>
					<th>합지공정</th>
					<td>
						<input type="radio" name="p_p4">
						<input type="radio" name="p_p4">
					</td>
				</tr>
				<tr>
					<th>접합공정</th>
					<td>
						<input type="radio" name="p_p5">
						<input type="radio" name="p_p5">
					</td>
				</tr>
				<tr>
					<th>포장적재</th>
					<td>
						<input type="radio" name="p_p6">
						<input type="radio" name="p_p6">
					</td>
				</tr>
				<tr>
					<th>최종작업일자</th>
					<td><input type="text" name="w_workno">예)20190101</td>
				</tr>
				<tr>
					<th>최종작업시간</th>
					<td><input type="text" name="w_workno">예)1300</td>
				</tr>
			</table>
			<input type="submit" value="공정등록" onclick="insertSubmit(); return false;"> 
			<input type="submit" value="공정수정" onclick="updateSubmit(); return false;"> 
			<input type="reset" value="다시쓰기"> 
		</form>
	</div>
		
	<%@ include file="/Main/footer.jsp" %>

</body>
</html>