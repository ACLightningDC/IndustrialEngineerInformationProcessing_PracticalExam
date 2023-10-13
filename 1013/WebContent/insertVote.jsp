<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		function check(){
			if(!f.v_jumin.value){
				alert('주민번호가 입력되지 않았습니다!');
				return f.v_jumin.focus();
			}
			if(!f.v_name.value){
				alert('성명이 입력되지 않았습니다!');
				return f.v_name.focus();
			}
			if(!f.v_no[0].selected == true){
				alert('후보번호가 선택되지 않았습니다!');
				return f.v_jumin.focus();
			}
			if(!f.v_time.value){
				alert('투표시간이 입력되지 않았습니다!');
				return f.v_time.focus();
			}
			if(!f.v_area.value){
				alert('주민번호가 입력되지 않았습니다!');
				return f.v_area.focus();
			}
			if(f.v_confirm[0].checked == false && f.v_confirm[1].checked == false){
				alert('유권자확인이 선택되지 않았습니다!');
				return false;
			}
			
			f.submit();
		}
	</script>
	<%@include file="header.jsp" %>
	<% sql="select m_no , m_name from tbl_member_202005";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	%>
	<section>
		<div>
			<h1>투표하기</h1>
		</div>
		<div>
			<form action="insertVoteAction.jsp" method="post" name="f">
			<table>
				<tr>
					<th>주민번호</th>
					<td><input type="text" name="v_jumin"> 예 : 89061531154726</td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="v_name"> </td>
				</tr>
				<tr>
					<th>투표번호</th>
					<td>
						<select name="m_no">
							<option value="0">선택하십시오</option>
							<%while(rs.next()){%>
							<option value="<%=rs.getString(1)%>">[<%=rs.getString(1)%>] <%=rs.getString(2)%></option>
							<%} %>
						</select>
					</td>
				</tr>
				<tr>
					<th>투표시간</th>
					<td><input type="text" name="v_time"> </td>
				</tr>
				<tr>
					<th>투표장소</th>
					<td><input type="text" name="v_area"> </td>
				</tr>
				<tr>
					<th>유권자확인</th>
					<td>
						<input type="radio" name="v_confirm" value="Y"> 확인 
						<input type="radio" name="v_confirm" value="N"> 미확인
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="투표하기" onclick="check(); return false;">
						<input type="reset" value="다시하기" >
					</td>
			</table>
			</form>
		</div>
	</section>
	<%@include file="footer.jsp" %>
</body>
</html>