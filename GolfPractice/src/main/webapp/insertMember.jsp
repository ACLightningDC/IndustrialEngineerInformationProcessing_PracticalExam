<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

<%
sql ="";
%>
<%
Date today = new Date(); 
//mm -> 분
SimpleDateFormat simpleDateFormat= new SimpleDateFormat("yyyy년 MM월 dd일");
String nowDay = simpleDateFormat.format(today);
%>
<script type="text/javascript">
function cNoChange(){
	f.tuition.value = "";//주의 : 초기화 위치 (이유? 다른 회원이름을 클릭하면 수강료가 빈 상태로)
	
	f.teacher_code.option[0].selected = true;
	f.c_no.value = f.c_name.value; // 회원이름을 선택하면 자동으로 회원번호 넣어주기
}

function tuitionChange(){
	var price = f.teacher_code.value * 1000;//수강료 (예)100 * 1000 = 100000원
	var c_no = f.c_no.value;
	
	if(c_no >= 20000) price * = 0.5 ;
	f.tuition.value = price;
}
</script>
<%=nowDay %>

<select onchange="()"></select>

	<section>
		<div>
			<h2>수강 신청</h2>
		</div>
		<div>
		
		</div>
	</section>
</body>
</html>