<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file ="header.jsp"  %>

	<%@ page import="member.*, java.util.List"%>
	
	<%
	String custno = request.getParameter("custno");
	
 	ShoppingDAO dao = new ShoppingDAO();
	MemberBeans beans = dao.getMembers(custno);
	%>
	
	<script type ="text/javascript" src="js.js"></script>

	
	<!-- <form action="" method="post" name="f"> --> <!-- 따로 처리 방법-1 -->
	<form action="insertPro2.jsp" name="f" method="post"><!-- 함께 처리 방법 -->
	<table>
		<tr>
			<td>회원번호(자동발생)</td><td><input type = "text" name = "custno" value="<%=beans.getCustno() %>" readonly/></td>
			<%-- <td>회원번호(자동발생)</td><td><input type = "text" name = "custno" value="<%=custno %>" /></td> --%>
		</tr>
		<tr>
			<td>회원이름</td><td><input type = "text" name = "custname" value="<%=beans.getCustname() %>" /></td>
		</tr>
		<tr>
			<td>회원전화</td><td><input type = "text" name = "phone" value="<%=beans.getPhone() %>" /></td>
		</tr>
		<tr>
			<td>회원주소</td><td><input type = "text" name = "address" value="<%=beans.getAddress() %>" size="30" /></td>
		</tr>
		<tr>
			<td>가입일자</td><td><input type = "text" name = "joindate" value="<%=beans.getJoindate() %>" readonly/></td>
		</tr>
		<tr>
			<td>고객등급 [A:VIP,B:일반,C:직원]</td><td><input type = "text" name = "grade" value="<%=beans.getGrade() %>" /></td>
		</tr>
		<tr>
			<td>도시코드</td><td><input type = "text" name = "city" value="<%=beans.getCity() %>" /></td>
		</tr>
		<tr>
			<td colspan="2">
			<input type = "submit" name="submit1" value="수정-1" onclick="checkUpdate();return false;"/>
			<input type = "submit" name="submit1" value="삭제-1" onclick="checkDelete();return false;"/>
			<input type="hidden" name="pro2" value=""/>			
			<button type = "button" name="btn" id="update" onclick="checkUpdateDelete(this.id);">수정-2</button>
			<button type = "button" name="btn" id="delete" onclick="checkUpdateDelete(this.id);">삭제-2</button>
			<!-- 정리
			<input/> 의 한꼐를 넘기 위해 나온 것이 <buttion> 태그이다
			<input type ="button"/> 을 써도 되지만, <button> 을쓰는 것이 권장된다.
			<buttion>은 자식 요소를 가질 수 있기 때문에 , 이미지/텍스트/가상 요소 등 다양한 활용이 가능하다. -->
			<input type = "button" value="조회" onclick="location.href='select.jsp'"/>
			<input type = "reset" value="다시쓰기"/>
			</td>
		</tr>
	</table>
	</form>
	<%@ include file="footer.jsp" %>
</body>
</html>