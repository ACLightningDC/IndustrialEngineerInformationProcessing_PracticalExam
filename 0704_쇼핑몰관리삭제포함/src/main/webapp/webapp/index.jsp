<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="header.jsp" %><!-- dbcon.jsp(DB +변수 선언) + style.css -->
		<section>
		<div >
			<h2>쇼핑몰 관리 프로그램</h2>	
		</div>	
		<div>
			
	
	쇼핑몰에서 회원정보, 매출정보, 등급정보 데이터베이스를 구축하고 회원관리와 회원조회 및 매출조회를 위한 프로그램을 작성하는 프로그램이다.
	프로그램 작성순서
	<ol>
		<li>회원정보 테이블을 생성한다</li>
		<li>매출정보 테이블을 생성한다</li>
		<li>등급정보 테이블을 생성한다</li>
		<li>회원정보 입력 화면프로그램을 작성한다</li>
		<li>회원조회/수정 프로그램을 작성한다</li>
		<li>매출조회 프로그램을 작성한다	</li>
	</ol>			
		</div>
	
	</section>
	
	<%@ include file="footer.jsp" %> <!--  db 자원 모두 해제 -->
</body>
</html>