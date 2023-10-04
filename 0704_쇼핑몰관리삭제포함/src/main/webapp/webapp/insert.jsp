<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type ="text/javascript">

	function check() {
		if(f.memno.value == ""){//javascript "" '' 둘다 문자열 취급 
			alert("회원번호를 입력해주세요.");//알림창
			//f.memno.focus();
			//return false;//false 주면 "submit"
			 f.memno.focus();//
			 return false;
			//return f.memno..select(); //글자 블록 설정하여 입력하는 글자로 덮어씌우기 편리하게 함
		}
		if(f.name.value == ""){
			alert("회원이름를 입력해주세요.");//알림창
			f.name.focus();
			return false;
		}
		if(f.address.value == ""){
			alert("주소를 입력해주세요.");
			f.address.focus();
			return false;
		}
		if(f.hiredate.value == ""){
			alert("가입일를 입력해주세요.");
			f.hiredate.focus();
			return false;
		}
		//★주의 : radio, checkbox
		if(f.gender[0].checked == false && f.gender[1].checked == false){
			alert("성별을 입력해주세요.");
			f.gender[0].focus();
			return false;
		}
		if(f.tel1.value == ""){
			alert("전화번호를 입력해주세요.");
			 f.tel1.focus();
			 return false;
		}
		if(f.tel2.value == ""){
			alert("전화번호를 입력해주세요.");
			f.tel2.focus();
			return false;
		}
		if(f.tel3.value == ""){//javascript "" '' 둘다 문자열 취급 
			alert("전화번호를 입력해주세요.");//알림창
			f.tel3.focus();	
			return false;
		}
		f.submit();//insertPro.jsp로 데이터 제출
	}

	</script>
	<%@ include file="header.jsp" %><!-- dbcon.jsp(DB +변수 선언) + style.css -->
	
	<% //bccon.jsp아래서 db 조회 가능
	
	/** 빈 구문객체-1 : Statment 구문객체 사용 : select => 반드시 결과로 ResultSet **/
	//[방법 -1] 반드시 "회원번호 4자리'fh 1001부터 시작한다면...
	sql = "select nvl(MAX(memno),1000)+1 as memno from member";//쿼리문
	
	//[방법 -2] "회원번호 4자리"로 0001부터 시작한다면...
	//sql = "select from nvl(MAX(memno),0)+1 from member";//쿼리문
	
	rs = stmt.executeQuery(sql);
	
	//[정석 방법]
	/*
	String memno =null;
	if(rs.next()){
		//memno = rs.getString(1);//index번호 (※SQL:1부터 시작) => "1010
		memno = rs.getString("memno");//별칭 =>(1010)
	}
	*/
	//[빠른 방법]
	rs.next();
	String memno=rs.getString("memno");
	
	/*------------------------------------------------*/
	sql = "select to_char(sysdate,'yyyy-mm-dd') as hiredate from dual";
	rs = stmt.executeQuery(sql);
	
	rs.next();
	String hiredate=rs.getString("hiredate");
	%>
<section>
		<div >
			<h2>회원등록</h2>	
		</div>	
		
		<form action="insertPro.jsp" method="post" name="f">
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
				<input type="text" name="name" value="" size="15" maxlength="30"/>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="address" value="" size="40" maxlength="100"/>
			</td>
		</tr>
		<tr>
			<td>가입일</td>
			<td>
			<input type="text" name="hiredate" value="<%=hiredate %>" size="10" maxlength="15" readonly/>자동 입력
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
			&nbsp;&nbsp;<label><input type="radio" name="gender" value="M"/>남자</label>
			&nbsp;&nbsp;<label>	<input type="radio" name="gender" value="F"/>여자</label>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
			<input type="text" name="tel1" value="" size="5" maxlength="3"/>
			<input type="text" name="tel2" value="" size="5" maxlength="4"/>
			<input type="text" name="tel3" value="" size="5" maxlength="4"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="submit" value="회원등록" onclick="check(); return false;"/>
			<input type="button" value="조회" onclick="location.href='select.jsp'"/>
			</td>
		</tr>
		</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!--  db 자원 모두 해제 -->
</body>
</html>