<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
function check(){
	if(!f.syear.value){
		alert("학년을 입력해 주세요.")
		return f.syear.focus();
	}
	if(!f.sclass.value){
		alert("반을 입력해 주세요.")
		return f.sclass.focus();
	}
	if(!f.sno.value){
		alert("번호를 입력해 주세요.")
		return f.sno.focus();
	}
	if(!f.kor.value){
		alert("국어성적을 입력해 주세요.")
		return f.kor.focus();
	}
	if(!f.eng.value){
		alert("영어성적을 입력해 주세요.")
		return f.eng.focus();
	}
	if(!(f.math.checked)  &&  !(f.gender[1].checked)){
		alert("수학성적을 입력해 주세요.")
		return f.math.focus();
	}
	
	f.submit();
}
</script>
	<%
	



	%>
<body>
<%@ include file="header.jsp" %>
<section>
<div>
<h2>성적등록</h2>
</div>
	
<form action="insertPro2.jsp" method="post" name="f">
<table>
	<tr>
		<td>학년</td><td><input type="text" name = "syear" value="" size="10" maxlength="1"/>(예)1</td>
	</tr>
	<tr>
		<td>반</td><td><input type="text" name = "sclass" value="" size="10" maxlength="2"/>(예)01</td>
	</tr>
	<tr>
		<td>번호</td><td><input type="text" name = "sno" value="" size="10" maxlength="2"/>(예)01</td>
	</tr>
	<tr>
		<td>국어</td><td><input type="text" name = "kor" value="" size="5" maxlength="3"/>성적범위(0-100)</td>
	</tr>
	<tr>
		<td>영어</td><td><input type="text" name = "eng" value="" size="5" maxlength="3"/>성적범위(0-100)</td>
	</tr>
	<tr>
		<td>수학</td><td><input type="text" name = "math" value="" size="5" maxlength="3"/>성적범위(0-100)</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="성적등록" onclick="check(); return false;" />
		<input type="button" value="조회"  onclick="location.href='select.jsp'"/>		
		</td>
	</tr>

</table>
</form>
</section>

</body>
</html>