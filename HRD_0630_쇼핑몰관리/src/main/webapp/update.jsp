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
			return f.memno.focus();//
			//return f.memno..select(); //글자 블록 설정하여 입력하는 글자로 덮어씌우기 편리하게 함
		}
		if(f.name.value == ""){
			alert("회원이름를 입력해주세요.");//알림창
			return f.name.focus();
		
		}
		if(f.address.value == ""){
			alert("주소를 입력해주세요.");
			return f.address.focus();
		}
		if(f.hiredate.value == ""){
			alert("가입일를 입력해주세요.");
			return f.hiredate.focus();
			
		}
		//★주의 : radio, checkbox
		if(f.gender[0].checked == false && f.gender[1].checked == false){
			alert("성별을 입력해주세요.");
			return f.gender.focus();
			
		}
		if(f.tel1.value == ""){
			alert("전화번호를 입력해주세요.");
			return f.tel1.focus();
			 
		}
		if(f.tel2.value == ""){
			alert("전화번호를 입력해주세요.");
			return f.tel2.focus();
		}
		if(f.tel3.value == ""){//javascript "" '' 둘다 문자열 취급 
			alert("전화번호를 입력해주세요.");//알림창
			return f.tel3.focus();	
			
		}
		f.submit();//insertPro.jsp로 데이터 제출
		

	}

	
	function reWrite(){
		var x = confirm("다시 쓰시겠습니까?");//[확인]==true, [취소]==false
		f.reset();//초기화
		f.name.select();//커서 위치
	}
	</script>
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
		
		<form action="updatePro2.jsp" method="post" name="f">
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
			<input type="submit" value="회원등록" onclick="check();return false;"/>
			<!-- <input type="reset" value="다시쓰기" /> -->
			<input type="button" value="다시쓰기" onclick="reWrite();"/>
			</td>
		</tr>
		</table>
		</form>
	</section>
	<%@ include file="footer.jsp" %> <!--  db 자원 모두 해제 -->
</body>
</html>