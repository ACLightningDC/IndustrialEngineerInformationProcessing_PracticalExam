<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="condb.jsp" %>

<%
try{
sql = "insert into member_tbl_11 values(?,?,?,?,?,?)";
ps =con.prepareStatement(sql);

String[] member_hobby = request.getParameterValues("member_hobby");

//[방법-1]
//String MEMBER_HOBBY2=String.join(","MEMBER_HOBBY);//"독서,영화"
//[방법-2]
/* 
if(MEMBER_HOBBY != null){
	for(int; i<MEMBER_HOBBY.length ; i++){
		
			MEMBER_HOBBY2 += MEMBER_HOBBY[2]+",";
			
			//[방법-3]
			//기준 : 0 index를 기준으로 
			MEMBER_HOBBY2 += (i==0)?MEMBER_HOBBY[i]:","+MEMBER_HOBBY[i];
			//기준 :
			MEMBER_HOBBY2 += (i != MEMBER_HOOBY.length-1)?MEMBER_HOBBY[i]+",":MEMBER_HOBBY[i];
		}
	MEMBER_HOBBY2 = MEMBER_HOBBY2.substring(0, MEMBER_HOBBY2.length()-1);//안에 ", "이면
	
	
	}
*/
String member_h ="";
for(int i =0 ; i < member_hobby.length; i++){
		member_h += member_hobby[i];
		if(!(i == member_hobby.length-1)){
			member_h +=",";
		}
}

ps.setString(1, request.getParameter("member_no"));
ps.setString(2, request.getParameter("member_id"));
ps.setString(3, request.getParameter("member_name"));
ps.setString(4, request.getParameter("member_grade"));
ps.setString(5, member_h);
ps.setString(6, request.getParameter("member_date"));

ps.executeUpdate();

%>
<script type="text/javascript">
alert("회원등록이 완료 되었습니다.");
location.href="insert.jsp";
</script>
<%
}catch(Exception e){
	%>
	<script type="text/javascript">
	alert("회원등록이 실패 되었습니다.");
	location.href="insert.jsp";
	</script>
	<%
}finally{
	try{
		if(con!=null)con.close();
		if(ps!=null)ps.close();
		if(rs!=null)rs.close();
	}catch(Exception e){
		
	}
}

%>