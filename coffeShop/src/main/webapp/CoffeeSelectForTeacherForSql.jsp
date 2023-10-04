<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커피숍 회원관리 프로그램</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section>
		<div>
			<h2>커피목록조회</h2>
		</div>
		<table border="1" width="600">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>상품단가</th>				
			</tr>
			
			<%
			ArrayList<Integer> pcost= new ArrayList<Integer>();
			
			sql="SELECT PCODE,PNAME,PCOST FROM coffee_tbl";	
			
			rs=stmt.executeQuery(sql);
			while(rs.next()){
			%>
				<tr align="center">
					<td><a href="update2Delete2.jsp?PCODE=<%=rs.getString(1)%>"><%=rs.getString(1) %></a></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>					
				</tr>
			<%
			 	pcost.add(rs.getInt(3));//int ? 아래에서 비교연산자(!=)사용하기 위해(비교연산자는 '수 또는 문자'만 가능)
			}
			%>
		</table>
		
		<p>
		
		<div>
			<h2>커피목록조회(수정된 커피 가격)</h2>
		</div>
		
		<table border="1" width="600">
			<tr>
				<th>상품코드</th>
				<th>상품명</th>
				<th>상품단가</th>				
			</tr>
						
			<%			
			sql="SELECT PCODE,PNAME,PCOST FROM coffee_tbl2";	
			
			rs=stmt.executeQuery(sql);
			
			int i=0;//ArrayList의 index 번호			
				
			while(rs.next()){
				
			}			
			%>
		</table>
	</section>
	<%@ include file="footer.jsp"%>
</body>
</html>