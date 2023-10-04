<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>친구 등록</title>
<script type="text/javascript" src="js.js">

</script>

</head>
<body>
<%@include file="header.jsp" %>
<%
sql = " select member_no ,member_id ,member_name ,member_grade ,member_hobby ,to_char(member_date,'YYYY/MM/DD') ";
sql += " from member_tbl_11";
sql += " where member_no = ?";

ps=con.prepareStatement(sql);
ps.setString(1, request.getParameter("member_no"));
rs = ps.executeQuery();
rs.next();
String member_hobby = rs.getString(5);
String member_hobby_ar []= null;
int b = 0;
int w = 0;
int m = 0;
if(!(member_hobby==null)){
	member_hobby_ar = member_hobby.split(",");
	
	for(int i = 0 ;i < member_hobby_ar.length ; i++){
		if(member_hobby_ar[i].equals("독서")){
			b=1;
		}
		if(member_hobby_ar[i].equals("운동")){
			w=1;
		}
		if(member_hobby_ar[i].equals("영화")){
			m=1;
		}
		
	}
}

String member_grade = rs.getString(4);


%>
<section>
<div>
	<h2>친구 수정</h2>
</div>
<form action="insertPro2.jsp" method="post" name="f">
	
<div>
<table>
<tr>
	<td>회원번호</td><td><input type="text" name="member_no" value="<%=rs.getString(1) %>" size="" maxlength=""></td>
</tr>
<tr>
	<td>회원ID</td><td><input type="text" name="member_id" value="<%=rs.getString(2) %>" size="" maxlength="10"></td>
</tr>
<tr>
	<td>이름</td><td><input type="text" name="member_name" value="<%=rs.getString(3) %>" size="" maxlength="20"></td>
</tr>
<tr>
	<td>등급</td>
	<td>
	<select name ="member_grade" size ="4">
		<option value="S" <%if(member_grade.equals("S")){out.print("selected");}%>>특별회원</option>
		<option value="A" <%if(member_grade.equals("A")){out.print("selected");}%>> 우수회원</option>
		<option value="B" <%=member_grade.equals("B")?"selected":""%>>일반회원</option>
	</select>
	</td>
</tr>
<tr>
	<td>취미</td>
	<td>
	<!-- String MEMBER_HOBBY = "독서, 영화" 1. indexOF("해당문자열")!=-1 2.contains("해당문자열")-->
	<label><input type="checkbox" name="member_hobby" value="독서" <%if(b==1){out.print("checked");}%>>독서</label>
	<label><input type="checkbox" name="member_hobby" value="운동" <%if(member_hobby.contains("운동")){out.print("checked");}%>>운동</label>
	<label><input type="checkbox" name="member_hobby" value="영화" <%if(member_hobby.indexOf("영화")!=-1){out.print("checked");}%>>영화</label>
	</td>
</tr>
<tr>
	<td>등록일자</td><td><input type="text" name="member_date" value="<%=rs.getString(6) %>" size="" maxlength=""></td>
</tr>
<tr>

	<td colspan="2">
	<input type="hidden" value="none" name= "sw"/>
	<input type="submit" onclick="check();return false;" value ="등록">
	<input type="submit" onclick="deleteup();return false;" value ="삭제">
	<input type="button" onclick="location.href='select.jsp'" value ="조회">
	</td>
</tr>
</table>
</div>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>