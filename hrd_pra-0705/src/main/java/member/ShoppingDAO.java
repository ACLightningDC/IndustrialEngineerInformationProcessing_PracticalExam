package member;
/*
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ShoppingDAO {
	//1. 멤버변수 = 필드 : 전역변수
	private Connection con;//기본값 null
	private PreparedStatement ps;
	private ResultSet rs;
	
	private String sql = "";
	//2. 생성자 : 기본 생성자 - 필드에 기본값(수 : 0, 0.0 ,false, null)을 채워 객체 생성
	/***
	 * 싱글톤 패턴 
	 * 
	 */
	//3. 매소드
	public static Connection getConnection(){
//		/*--------------- 첫 번째 방법 -----------------------------*/
//		//1. 오라클 드라이버 로딩 
//			Class.forName("oracle.jdbc.OracleDriver");
//		//2. Connection 
//			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system","1234");
//			return con;
//	}
//	
	/*-------------- 두 번째 방법 : 커넥션 풀  생성 ( 교재 443~ )------------------------------*/
	Connection con = null; //지역변수
	
	try {
		//부모 인터페이스 = 구현한 자식 클래스
		Context init = new InitialContext();
		//Context 
		DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
		con = ds.getConnection();
	}catch(Exception e) {
		e.printStackTrace();
	}
	
	return con;
	
	}
	
	//1. 다음 회원번호와 가입일 (=오늘날짜) 조회 : insert.jsp
	public MemberBeans getMaxCustnojoindate() {
		MemberBeans beans = null;
		
		//2. sql
		sql = " select NVL(MAX(custno),0)+1 as custno, " ;
		sql+= " to_char(sysdate,'yyyymmdd') as joindate ";
		sql+= " from member_tbl_02";
		
		try {
			//1. db연결 
			con = getConnection(); //전역변수인 필드

			//2. 실행
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			//3. 결과 처리
			if(rs.next()) {
				beans =  new MemberBeans();//기본값으로 채원진 객체
				beans.setCustno(rs.getString("custno"));//조회된 다음 회원번호와
				beans.setJoindate(rs.getString("joindate"));//조회된 가입날짜로 값 변경;
			}
		}catch(Exception e) {
			System.out.println("getMaxCustnojoindate() 에러 : " +e);
		}finally {
			//5. 연결해제
			try{
				if(con != null) con.close();
				if(ps!= null) ps.close();
				if(rs!= null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return beans;
	}
	
	//
	public int insertMember(MemberBeans beans) {
		int result = 0;
			// sql
			sql = " insert into member_tbl_02 values(?,?,?,?,?,?,?)" ;
		
		try {
			//1. db연결 
			con = getConnection(); //전역변수인 필드
			
			//2. 실행
			ps = con.prepareStatement(sql);
			ps.setString(1, beans.getCustno());
			ps.setString(2, beans.getCustname());
			ps.setString(3, beans.getPhone());
			ps.setString(4, beans.getAddress());
			ps.setString(5, beans.getJoindate());
			ps.setString(6, beans.getGrade());
			ps.setString(7, beans.getCity());
			//3. 결과 처리

			result = ps.executeUpdate();//성공:1, 실패:0
			System.out.println("회웑 추가 성공");
			
		} catch (Exception e) {
			System.out.println("insertMember() 에러 : " +e);
		}finally {
			//4. 연결해제
			try{
				if(con != null) con.close();
				if(ps!= null) ps.close();
				if(rs!= null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}
	//3.회원전체 조회 : select.jsp
	public ArrayList<MemberBeans> getMembers() {
		//MemberBeans list = null;
		ArrayList<MemberBeans> list = new ArrayList(); //기본값으로(null)으로 채워짐
		//sql
		sql = " select custno , custname , phone , address , to_char(joindate ,'yyyy-mm-dd')as joindate,decode(grade,'A','VIP','B','일반','C','직원')as grade,city";
		sql+= " from member_tbl_02";
		try {
			//1. db연결 
			con = getConnection(); //전역변수인 필드
			
			//2. 실행
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			//3. 결과 처리
			//ArrayList<MemberBeans> 객체 1번만 생성-[방법-1]
			/*
			while(rs.next()) {
				MemberBeans beans =  new MemberBeans();//기본값으로 채원진 객체
				beans.setCustno(rs.getString("custno"));//조회된 다음 회원번호와
				beans.setCustname(rs.getString("custname"));//조회된 가입날짜로 값 변경;
				beans.setPhone(rs.getString("phone"));//조회된 다음 회원번호와
				beans.setAddress(rs.getString("address"));//조회된 가입날짜로 값 변경;
				beans.setJoindate(rs.getString("joindate"));//조회된 다음 회원번호와
				beans.setGrade(rs.getString("grade"));//조회된 가입날짜로 값 변경;
				beans.setCity(rs.getString("city"));//조회된 다음 회원번호와
				list.add(beans);
				}
				*/
			//ArrayList<MemberBeans> 객체 1번만 생성-[방법-2]
			if(rs.next()) {
				list = new ArrayList<>();
				do {
					//MemberBeans 생성자 : 필드에 파라미터값을  채우는 생성자 - set~()
//										메서드 사용할 필요없이 필드값이 채워짐
					list.add(new MemberBeans(rs.getString("custno"),
											rs.getString("custname"),
											rs.getString("phone"),
											rs.getString("address"),
											rs.getString("joindate"),
											rs.getString("grade"),
											rs.getString("city")
									)
							);
				}while(rs.next());
			}
			
		}catch(Exception e) {
			System.out.println("getMember() 에러 : " +e);
		}finally {
			//5. 연결해제
			try{
				if(con != null) con.close();
				if(ps!= null) ps.close();
				if(rs!= null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return list;
	}
	
	//4. 회원 조회 : 회원번호를 매개값으로 받아 조회한 회원정보객체를 리턴
	public MemberBeans getMembers(String custno) {
		MemberBeans beans = null;
		sql = " select custno , custname , phone , address , to_char(joindate ,'yyyy-mm-dd')as joindate, grade ,city";
		sql+= " from member_tbl_02";
		sql+= " where custno = ? ";//[Statement 방법]sql : 패턴 ('"+변수+"') String('문자')-> 수로 자동변환되엇 실행
		try {
			con = getConnection();
			
			//[statement 방법]
			//Statment stmt = c on.createStatment();
			//rs=stmt.executeQuery(sql);//dbms에서 컴파일 ->실행(속도가 느리다.)
			
			//[PreparedStatment 방법]
			ps = con.prepareStatement(sql);//자바에서 SQL문 컴파일-> 실행(속도가 빠르다)
			//ps.setInt(1 , custno);//[방법1]
			ps.setString(1, custno);//[방법2]
			
			rs = ps.executeQuery();
			
			
			if(rs.next()) {
				beans = new MemberBeans();
				beans.setCustno(rs.getString("custno"));//조회된 다음 회원번호와
				beans.setCustname(rs.getString("custname"));//조회된 가입날짜로 값 변경;
				beans.setPhone(rs.getString("phone"));//조회된 다음 회원번호와
				beans.setAddress(rs.getString("address"));//조회된 가입날짜로 값 변경;
				beans.setJoindate(rs.getString("joindate"));//조회된 다음 회원번호와
				beans.setGrade(rs.getString("grade"));//조회된 가입날짜로 값 변경;
				beans.setCity(rs.getString("city"));//조회된 다음 회원번호와
						

			}
		} catch (SQLException e) {
			System.out.println("getMember() 에러 : " +e);
		}finally {
			try{
				if(con != null) con.close();
				if(ps!= null) ps.close();
				if(rs!= null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		return beans;
	}
	
	//
	public int updateMember(MemberBeans beans) {
		int result = 0;
			// sql
			sql = " update member_tbl_02";
			sql+= " set custname = ?, phone = ?, address = ?, joindate = ?, grade =?,city =?";
			sql+= " where custno = ? ";
		try {
			//1. db연결 
			con = getConnection(); //전역변수인 필드
			
			//2. 실행
			ps = con.prepareStatement(sql);
			ps.setString(7, beans.getCustno());
			ps.setString(1, beans.getCustname());
			ps.setString(2, beans.getPhone());
			ps.setString(3, beans.getAddress());
			ps.setString(4, beans.getJoindate());
			ps.setString(5, beans.getGrade());
			ps.setString(6, beans.getCity());
			//3. 결과 처리
		
			result = ps.executeUpdate();//성공:1, 실패:0
			System.out.println("회원 수정 성공");
			
		} catch (Exception e) {
			System.out.println("updateMember() 에러 : " +e);
		}finally {
			//4. 연결해제
			try{
				if(con != null) con.close();
				if(ps!= null) ps.close();
				if(rs!= null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}
	public int deleteMember(MemberBeans beans) {
		int result = 0;
		
		sql  = " delete member_tbl_02";
		sql += " where custno = ?";
		
		try {
			con = getConnection();
			
			ps= con.prepareStatement(sql);
			
			ps.setString(1, beans.getCustno());
			
			result = ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("deleteMember() 에러 : " +e);
		}finally {
			//4. 연결해제
			try{
				if(con != null) con.close();
				if(ps!= null) ps.close();
				if(rs!= null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result; 
		
	}
	//7. 매출 전체 조회 : select2.jsp
	public ArrayList<SalesBeans> getSales() {
		//MemberBeans list = null;
		ArrayList<SalesBeans> list = null; //기본값으로(null)으로 채워짐
		//sql
		sql = " select custno , custname ,decode(grade,'A','VIP','B','일반','C','직원')as grade , to_char(sum(price) ,'L999,999,999')as totalprice";
		sql+= " from member_tbl_02 join money_tbl_02";
		sql+= " using(custno)";
		sql+= " group by custno , custname , grade ";
		sql+= " order by totalprice desc";
		try {

			con = getConnection(); //전역변수인 필드
			

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			if(rs.next()) {
				list = new ArrayList<>();
				do {list.add(new SalesBeans(rs.getString("custno"),rs.getString("custname"),rs.getString("grade"),rs.getString("totalprice")));
				}while(rs.next());
			}
			
		}catch(Exception e) {
			System.out.println("getSales() 에러 : " +e);
		}finally {
			//5. 연결해제
			try{
				if(con != null) con.close();
				if(ps!= null) ps.close();
				if(rs!= null) rs.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return list;
	}
}
