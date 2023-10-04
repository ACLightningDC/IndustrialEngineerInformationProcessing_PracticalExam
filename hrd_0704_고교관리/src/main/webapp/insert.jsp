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
		alert("번호을 입력해 주세요.")
		return f.sno.focus();
	}
	if(!f.sname.value){
		alert("학생이름을 입력해 주세요.")
		return f.sname.focus();
	}
	if(!f.birth.value){
		alert("생년월일을 입력해 주세요.")
		return f.birth.focus();
	}
	if(!(f.gender[0].checked)  &&  !(f.gender[1].checked)){
		alert("성별을 입력해 주세요.")
		return f.gender[0].focus();
	}
	if(!f.tel1.value){
		alert("학년을 입력해 주세요.")
		return f.tel1.focus();
	}
	if(!f.tel2.value){
		alert("학년을 입력해 주세요.")
		return f.tel2.focus();
	}
	if(!f.tel3.value){
		alert("학년을 입력해 주세요.")
		return f.tel3.focus();
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
<h2>학생등록</h2>
</div>


<form action="insertPro.jsp" method="post" name="f">
<table>
	<tr>
		<td>학년</td><td><input type="text" name = "syear" value="" size="10" maxlength="1"/>(예)1</td>
	</tr>
	<tr>
		<td>반</td><td><input type="text" name = "sclass" value="" size="10" maxlength="2"/>(예)01</td>
	</tr>
	<tr>
		<td>번호</td><td><input type="text" name = "sno" value="" size="10" maxlength="2"/>(예)YYYYMMDD</td>
	</tr>
	<tr>
		<td>학생이름</td><td><input type="text" name = "sname" value="" size="10" maxlength="20"/></td>
	</tr>
	<tr>
		<td>생년월일</td><td><input type="text" name = "birth" value="" size="10" maxlength="8"/>(예)01</td>
	</tr>
	<tr>
		<td>성별</td>
	<td>
	&nbsp;&nbsp;<label><input type="radio" name = "gender" value="M"/></label>
	&nbsp;&nbsp;<label><input type="radio" name = "gender" value="F"/></label>
	</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>
		<input type="text" name = "tel1" value="" size="5" maxlength="3"/>
		<input type="text" name = "tel2" value="" size="5" maxlength="4"/>
		<input type="text" name = "tel3" value="" size="5" maxlength="4"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="submit" value="학생등록" onclick="check(); return false;" />
		<input type="reset" value="다시쓰기" />		
		</td>
	</tr>

</table>
</form>
</section>



</body>
</html>