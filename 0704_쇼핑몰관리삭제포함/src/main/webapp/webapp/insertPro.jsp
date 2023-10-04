<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- ★중요 : DB 연결 + 변수 선언 -> 붙여넣기 (db연결 , 변수 선언)-->   
<%@ include file="dbcon.jsp"%>

<%
try{
	String memno = request.getParameter("memno");
	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String hiredate = request.getParameter("hiredate");
	String gender = request.getParameter("gender");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");

	/** [구문객체] Statment 사용 **/
	//insert into member values('문자','수')=> '수'는 자동형변환 되어 입력됨 => 따라서 , 수에도 '수' 입력해도 됨
	//sql  ="insert into member values ('"+memno+"','"+name+"','"+address+"','"+hiredate+"','"+gender+"','"+tel1+"','"+tel2+"','"+tel3+"')";
	//int result = stmt.executeUpdate(sql);//insert, delete , update(업데이트 성공하면 1 리턴받음, 실패하면 0 리턴);
	
	/** [구문객체-2] PreparedStatement 사용**/
	sql = "insert into member values(?,?,?,?,?,?,?,?)";
	ps = con.prepareStatement(sql);
	
	ps.setString(1, memno);//ps.setString(1, request.getParameter("memno"))
	ps.setString(2, name);
	ps.setString(3, address);
	ps.setString(4, hiredate);
	ps.setString(5, gender);
	ps.setString(6, tel1);
	ps.setString(7, tel2);
	ps.setString(8, tel3);
	
	
	//[방법-2]
	/*
	ps.setString(1, request.getParameter("memno"));//ps.setString(1, request.getParameter("memno"))
	ps.setString(2, request.getParameter("name"));
	ps.setString(3, request.getParameter("address"));
	ps.setString(4, request.getParameter("hiredate"));
	ps.setString(5, request.getParameter("gender"));
	ps.setString(6, request.getParameter("tel1"));
	ps.setString(7, request.getParameter("tel2"));
	ps.setString(8, request.getParameter("tel3"));
	*/
	
	int result = ps.executeUpdate();//성공=> 성공알림창
	
	//if(result > 0 ){//성공=> 성공알림창
	%>
		<script type= "text/javascript">
		alert("회원등록이 완료되었습니다");
		location.href="insert.jsp";//문제 확인하기
		//location.href="select.jsp";//만약, 회원조회 페이지로...
		</script>
	<% 
	//}
} catch(Exception e) {//실패 : 예외객체 생성되어 이것을 잡아서 처리=> 실패 알림창
		
	%>
	<script type= "text/javascript">
	alert("회원등록이 실패되었습니다");
	//location.href="insert.jsp";//문제 확인하기
	history.back();//이전 페이지로 돌아옴
	//history.go(-1);
	</script>
<% 
	
} finally{//예외발생여부에 관계없이 무조건 실행(DB연결 해제)
	try{
		if(con != null) con.close();
		if(stmt != null) stmt.close();
		if(ps != null) ps.close();
		if(rs != null) rs.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
}
%>	