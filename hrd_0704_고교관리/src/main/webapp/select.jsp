<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp"%>
	<section>
		<div>
			<h2>성적 조회</h2>
		</div>
	
	<table>
		<tr>
			<th>학년 반 번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>총점</th>
			<th>평균</th>
		</tr>
	
	<%
	

	sql =  " select *";
	sql += " from (select syear||'_'||sclass||'-'||sno as ycn, sname , decode(gender , 'M','남','F','여')from examtbl_1) t1";
	sql += " left outer join (select syear||'_'||sclass||'-'||sno as ycn, kor, eng, math ,kor + eng+ math ,round((kor + eng+ math)/3,1)";
	sql += " from examtbl_3) t3";
	sql += " using (ycn)";
	
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	while(rs.next()){
		%>
			<tr>
				<!-- 링크를 사용한 get 방식으로 요청시 : "요청URL? 파라미터이름1=파라미터값1&파라미터이름2=파라미터값2" -->
				<td><%=rs.getString(1) %></td>
				<td><%=rs.getString(2) %></td>
				<td><%=rs.getString(3) %></td>
				<td><%=rs.getString(4) %></td>
				<td><%=rs.getString(5) %></td>
				<td><%=rs.getString(6) %></td>
				<td><%=rs.getString(7)%></td>
				<!--  null 값을 처리 하는 방법 , sql ,and java -> -->
				<td><%=rs.getString(8)!=null?rs.getString(8):"" %></td>
			</tr>
		<%	
		}

	
	/*--------------------*/
	sql="select count(*) from examtbl_1";
	rs= stmt.executeQuery(sql);
	rs.next();
	int studentCnt = rs.getInt(1);
	//NVL(kor,0)이유 ? 학생등록 후 성적등록 안해도 0으로 처리하여 평균에 이 학생을 포함하도록 하기 위함

	sql = " select sum(kor),sum(eng),sum(math)";
	sql +="	from examtbl_3";

	//NVL(kor,0)이유 ? 학생등록 후 성적등록 안해도 0으로 처리하여 평균에 이 학생을 포함하도록 하기 위함
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	
	while(studentCnt !=0){
	%>
	<tr>
		<td></td><td></td>
		<td>총점수합계</td>
		<td><%=rs.getString(1)!=null?rs.getString(1):""%></td>
		<td><%=rs.getString(2)!=null?rs.getString(2):""%></td>
		<td><%=rs.getString(3)!=null?rs.getString(3):""%></td>
		<td></td><td></td>
	<tr>	
	<%
	}
	sql =" select round(avg(kor),1),round(avg(eng),1),round(avg(math),1)";
	sql +="	from examtbl_3";
	
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();
	while(studentCnt !=0)
	{
	
	%>
	<tr>
		<td></td><td></td>
		<td>총점수평균</td>
		<td><%=rs.getString(1)!=null?rs.getString(1):""%>%></td>
		<td><%=rs.getString(2)!=null?rs.getString(2):""%> %></td>
		<td><%=rs.getString(3)!=null?rs.getString(3):""%> %></td>
		<td></td><td></td>
	<tr>
	<%
	}
	%>
	</table>
	
	</section>


<%@ include file="footer.jsp" %>

</body>
</html>