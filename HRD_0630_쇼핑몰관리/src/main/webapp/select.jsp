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
			<h2>회원 조회</h2>	
		</div>	
		
		<table style="border:2px soild black;width: 900px;">
			<tr>
				<th>회원번호</th>
				<th>이름</th>
				<th>주소</th>
				<th>가입일</th>
				<th>성별</th><!-- 만약 , 성별과 전화번호는 null값이 올 수 있으므로 -->
				<th>전화번호</th>
			</tr>
			
			<%
			/* -- 회원 조회 쿼리문 실행 --------*/
			sql =  " select memno , name ,address,";
			sql += " to_char(hiredate, 'YYYY.MM.DD.') as hiredate,";
			sql += " nvl(decode(gender,'M','남','F','여'),' ')as gender,";//만약 해법 : NVL(,'') 또한''이므로 해결 안됨 
			sql += " tel1||'-'||tel2||'-'||tel3 as tel";//그래서 nvl(,' ')로 해결가능 (?' '출력용으로 가능. BUT, ' ') " "
			sql += " from member";//★주의 : 반드시 처음 한칸 띄우기 
			
			
			/* -- 리턴 받은 ResultSet의 내용을 --------*/
			// [구문객체-1] Statement 사용
			rs = stmt.executeQuery(sql);
			
			//[" "=>""] 방법-1
			//String gender=rs.getString("gender").trim();
			//[" "=>""] 방법-1
			//String gender=rs.getString("gender")
			//if(gender.equals(" ")) gender="";	
					
			// [구문객체-2] PreparedStatement 사용
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
			/* -- 한 줄씩 만들고 6칸안에 칸안에 한사람의 회원정보를 각각 넣기=> 반복 --------*/
			%>
				<tr>
					<!-- 링크를 사용한 get 방식으로 요청시 : "요청URL? 파라미터이름1=파라미터값1&파라미터이름2=파라미터값2" -->
					<td><a href="update.jsp?memno=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5)!=null?rs.getString(5):"" %>
					<%-- <td><%out.print (rs.getString(5)!==null?r.getString(5):""); %></td> --%>
					
					<td><%=rs.getString(6).equals("--")?"":rs.getString(6) %></td>
				</tr>
			<%	
			}
					
			%>
		</table>
	
	</section>
	
	<%@ include file="footer.jsp" %> <!--  db 자원 모두 해제 -->
</body>
</html>