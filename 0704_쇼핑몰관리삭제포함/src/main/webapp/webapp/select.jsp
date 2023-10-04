<%@ page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰관리 프로그램</title>
</head>

<script type="text/javascript">		
	
	function checkDelete3(remove) {			
    	
		if(confirm("정말로 삭제하시겠습니까?")){	
	
			//location.href="deletePro.jsp?memno="+remove;
			
			location.href="updatePro2.jsp?memno="+remove+"&pro="+encodeURIComponent("삭제");
		}else{
			return false;
		}
		
	}
</script>

<body>
	<%@ include file="header.jsp" %><!-- dbcon.jsp(DB 연결+변수 선언) + style.css -->
	<section>
		<div>
			<h2>회원 조회</h2>
		</div>
		
		<table border="1" width="900" id="memberList">
		
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>가입일</th>
				<th>성별</th> <!-- 만약, 성별과 전화번호는 NULL값이 올 수 있으므로 -->
				<th>전화번호</th>
				<th>삭제-2</th>
				<th>삭제-3</th>
			</tr>
			
			<% 
			/* -- 회원조회 쿼리문 실행   ---------------------------------------*/
			sql += "select memno, name, address,"; 
			sql += " TO_CHAR(hiredate,'yyyy.mm.dd.') as hiredate,";
			sql += " DECODE(gender,'M','남','F','여') as gender,";
			//sql += " NVL(DECODE(gender,'M','남','F','여'),' ') as gender,"; //만약 해법:NVL(,'') 또한 ''	널이므로 해결안됨
			sql += " tel1||'-'||tel2||'-'||tel3 as tel";//그래서 NVL(,' ')로 해결가능 (?' '출력용으로 가능. BUT, ' '로 입력용이면 커서가 한칸 떨어져 있어서) 
			sql += " from member";//★주의 : 반드시 처음 한칸 띄우기 		
			
			
			/* -- 리턴받은 ResultSet의 내용을 ----------------------------------*/
			// [구문객체-1] Statement 사용
			rs = stmt.executeQuery(sql);
			
			//[" "=>""] 방법-1
			//String gender=rs.getString("gender").trim();//' '=>" "=>""
			
			//[" "=>""] 방법-2
			//String gender=rs.getString("gender");
			//if(gender.equals(" ")) gender="";
					
			// [구문객체-2] PreparedStatement 사용
			//ps = con.prepareStatement(sql);
			//rs = ps.executeQuery();
			
			while(rs.next()){
			/* --한 줄씩 만들고 6칸 만들어 칸안에 한사람의 회원정보를 각각 넣기=>반복 ---- */
			%>
				<tr align="center">					
					<!-- 링크를 사용한 get 방식으로 요청 시 : "요청URL?파라미터이름1=파라미터값1&파라미터이름2=파라미터값2"-->
					<%-- <td><a href="update.jsp?memno=<%=rs.getString(1)%>&name=<%=URLEncoder.encode(rs.getString(2), "UTF-8") %>"><%=rs.getString(1)%></a></td> --%>
					<td><a href="update.jsp?memno=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
					
					<!-- name : 파라미터 값이 한글일 때 자바로 utf-8 로 인코딩하여 전송하는 방법 -->
					<td><a href="update.jsp?name="<%=URLEncoder.encode(rs.getString(2),"utf-8")%>"><%=rs.getString(2)%></a></td>
					
					<%-- <td><%=rs.getString(2) %></td> --%>
					
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td><!-- 자동입력이므로 null값은 올 수 없다. -->
					
					<%-- <td><%=rs.getString(5) %></td> --%>
					<td><%=rs.getString(5)!=null?rs.getString(5):""%></td>
					<%-- <td><%out.print(rs.getString(5)!=null?rs.getString(5):"");%></td> --%>
					
					<td><%=rs.getString(6).equals("--")?"":rs.getString(6) %></td>
					
					<!-- [삭제] 버튼 추가 -->
					
					<td><input type="button" value="삭제-2" onclick="location.href='deletePro.jsp?memno=<%=rs.getString(1)%>'"/></td>
					<td><input type="button" value="삭제-3" onclick="checkDelete3(<%=rs.getString(1) %>);" /></td>
				</tr>
			<%
			}
			%>
		
		</table>
	</section>	
	<%@ include file="footer.jsp" %><!-- DB 자원 모두 해제 -->
</body>
</html>










