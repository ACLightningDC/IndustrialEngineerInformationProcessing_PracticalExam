<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import ="member.*"%>
<!-- dbcon.jsp 없음 -->

<%
request.setCharacterEncoding("UTF-8");
%>

<%-- beans:참조변수, member.MemberBeans 클래스의 기본생성자로 기본값으로 체워진 객체 생성 --%>	
<jsp:useBean id="beans" class="member.MemberBeans"/>
<%-- 파라미터로 전송된 값들을 필드들의 값으로 셋팅 (이때 , 반드시 '파라미터명=필드명') --%>
<jsp:setProperty name ="beans" property="*"/>

<%
ShoppingDAO dao = new ShoppingDAO();
int result = dao.insertMember(beans);

if(result > 0 ){
	%>
	<script type="text/javascript">
		alert("회원등록이 완료되었습니다.");
		location.href="insert.jsp";
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
		alert("회원등록이 실패되었습니다.");
		history.back();
	</script>
	<%
}
	
%>
