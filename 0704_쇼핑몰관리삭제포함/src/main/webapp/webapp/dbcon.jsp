<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 한글 처리가 제대로 되기 위해서는 '클라이언트(브라우저) 문자처리방식 = 서버에서 문자처리방식
톰캣 서버(기본 : UTF - 8)로 전송되는 한글 파라미터 값이 제대로 처리되기 위해서 인코딩 방식을 UTF-8 로 지정-->

<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); //post 방식의 한글 깨짐 방지 위해(※get 방식 안해도 됨)

//1. 오라클 드라이버 로딩	: webapp/WEB-INF/lib/ojdbc6.jar 안에 있음
Class.forName("oracle.jdbc.OracleDriver");//throws ClassNotFoundException 예외 방생 가능성 있으므로 => try~catch 처리 ( => 실기에서는 생략)

//2. Connection 객체 생성 : java.sql.* 안에 여러 클래스 파일들이 있음
//String url은 Data Source Explorer -> New Oracle  위 마오 -> 속성->Driver 속성들-> url 복사 -> 붙여넣기

Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "1234");
		
/*--------------------- 옵션 -------------------------------*/
//3.구문 객체 생성

/*
[Statment 객체]는 메모리에 흔적 생성
넘겨주는 SQL문은 단순 문자열이기 때문에 DBMS로 넘겨주면 DBMS가 그 "SQL문자열"을 쿼리로 컴파일하느라 오래 걸린다
-select(조회)할 때


[PreparedStatment]는 메모리에 상주
- "SQL 문자열" 을 컴파일된 채로 DBMS에게 넘겨주기 때문에 Statement 보다 속도가 빠르다.
- insert, delete, update 일 때 : 코딩도 편리
*/

Statement stmt = con.createStatement();//SQL문이 없는 비어있는 구문객체
PreparedStatement ps = null; //참조하는 객체 없다. ※ 선언만? SQL 문이 있어야 PreparedStatment객체 생성됨


//4. 결과 셋 선언 : select(조회) 결과로 ResultSet 리턴받음
ResultSet rs = null; 

//5. 쿼리문 선언
//String sql = null;// 참조하는 객체가 없다.
String sql = "";//값이 없는 String 객체를 참조, 향후 긴 "SQL문자열"을 연결할때 사용하기 위해
%>

