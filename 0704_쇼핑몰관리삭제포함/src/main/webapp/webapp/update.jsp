<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function checkDelete2() {
	let pro;
	if(confirm("정말로 삭제하시겠습니까?")){
		//따로 처리 방법
		//location.href="deletePro.jsp?memno="+f.memno.value;
		
		//함께 처리 방법 : get방식으로 한글파라미터값을 넘기면 아래 오류 발생가능성 있음
		//오류메세지:요청 타겟에서 유효하지 않은 문자가 발견되었습니다. 유효한 문자들은 RFC 7230과 RFC 3986에 정의되어 있습니다.
		//[해결법]
/*
- encodeURI(문자열) : 인터넷 주소에서 사용하는 특정문자(:, ;, /, =, ?, &)를 제외하고 "utf-8"로 인코딩하는 함수
- encodeURIComponent(문자열) : 모든 문자를 "utf-8"로 인코딩하는 함수

- decodeURI(인코딩된 문자열) : encodeURI(문자열)로 인코딩한 문자열을 디코딩하는 함수
- decodeURIComponent(인코딩된 문자열) : encodeURIComponent(문자열)로 인코딩한 문자열을 디코딩하는 함수
*/
		pro="삭제";//pro가 한글이면 "utf-8"로 인코딩하여 전송하기 위해
		location.href="updatePro2.jsp?memno="+f.memno.value+"&pro="+encodeURIComponent(pro);
		
	}else{
		return false;
	}
}
</script>
</head>
<body>
<script type="text/javascript" src="./JavaScript/updateDelete.js"></script>




	<%@ include file="header.jsp" %><!-- dbcon.jsp(DB +변수 선언) + style.css -->
	
	<% //bccon.jsp아래서 db 조회 가능
	String memno = request.getParameter("memno");
	
	/** 빈 구문객체-1 : Statment 구문객체 사용 : select => 반드시 결과로 ResultSet **/
	//[방법 -1] 반드시 "회원번호 4자리'fh 1001부터 시작한다면...
	sql = " select memno, name, address, to_char(hiredate, 'yyyy-mm-dd'), gender, tel1, tel2, tel3";
	sql += " from member";
	sql += " where memno='"+memno+"'";
	
	rs = stmt.executeQuery(sql);
	
	
	String name = null;
	String address= null;
	String hiredate= null;
	String gender= null;
	String tel1= null;
	String tel2 = null;
	String tel3 = null;
	
	if(rs.next()){
		name=rs.getString(2);
		address=rs.getString(3);
		hiredate=rs.getString(4);
		gender=rs.getString(5);
		//tel1=rs.getString(6);
		tel1=rs.getString(6).trim();		
		//tel1= (rs.getString(5).equals(" ")?"":rs.getString(5));		
		tel2=rs.getString(7);
		tel3=rs.getString(8);
	}
	out.print(name);
	

	%>
<section>
		<div >
			<h2>회원수정</h2>	
		</div>	
		<!--  따로 처리 방법-->
		<!--  form action="" method="post" name="f"-->
		
		<!-- 함꼐 처리 방법 -->
		<form action="updatePro2.jsp" method="post" name="f">
		<input type="hidden" name="pro" value="none" />

		
		<table border="1" width="500">
		<tr>
			<td>회원번호</td>
			<td>
				<input type="text" name="memno" value="<%=memno%>" size="10" maxlength="4" readonly/>자동 입력
			</td>
		</tr>
		<tr>
			<td>회원이름</td>
				
			<td>						<%-- value="<% out.print(memno); %>"   --%>
				<input type="text" name="name" value="<%=name %>" size="15" maxlength="30"/>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="address" value="<%=address %>" size="40" maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>
			<input type="text" name="hiredate" value="<%=hiredate %>" size="10" maxlength="15" readonly/>자동 입력
			</td>
		</tr>
		<tr>
			<td>성별</td>													<!-- type"radio" 또는 "select" => "selected" -->
			<td>															<!-- type"radio" 또는 "checkbox" => "checked" -->
			&nbsp;&nbsp;<label><input type="radio" name="gender" value="M"<%=(gender != null && gender.equals("M"))?"checked":"" %>/>남자</label>
			&nbsp;&nbsp;<label>	<input type="radio" name="gender" value="F"<%=(gender != null && gender.equals("F"))?"checked":"" %>/>여자</label>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
			<input type="text" name="tel1" value="<%=tel1 %>" size="5" maxlength="3"/>
			<input type="text" name="tel2" value="<%=tel2==null?"":tel2 %>" size="5" maxlength="4"/>
			<input type="text" name="tel3" value="<% if(tel3==null){out.print("");}else{out.print(tel3);} %>" size="5" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<!-- 아래 1개만 위함수 사용하고 나머지는 javaScript / -->
			<input type="submit" value="회원등록" onclick="check();return false;"/>
			
			<!-- <input type="reset" value="다시쓰기" /> -->
			<input type="submit" value="삭제2" onclick="checkDelete2();return false;"/>
			
			
			<input type="button" value="다시쓰기" onclick="reWrite();"/>
			<input type="submit" value="삭제" onclick="checkDelete();return false;"/>
			</td>
		</tr>
		</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!--  db 자원 모두 해제 -->
</body>
</html>