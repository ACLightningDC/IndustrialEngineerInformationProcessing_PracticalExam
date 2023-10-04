/**
 * 자바빈은 JSP 페이지의 디자인 부분과 비지니스 로직(=자바코드) 부분을 분리함으로써
 * 복잡한 JSP 코드들을 줄이고 프로그램 재사용성을 증가
 * 
 * DTD(Data Transfer Object) : 자바빈 -selct/insert/delete/update에 관한 값을 담은 객체
 * DAO(Data Access Object) :insert/delete/update -사용자가 입력한 내용으로 DAO 클래스의 메소드로 DB 에 접근하여 DB로부터 가져온 내용을 객체로 바꾸기 위해 필요한 클래스
 * 							select-DAO 클래스로 DB에 접근하여 DB로부터 가져온 내용을 객체로 바꾸기 위해 필요한 클래스
 */

//DTD(Data Transfer Object) : 자바빈
//만드는 방법
package member;
//	1. 클래스 접근제한자 : public
public class MemberBeans {//회원정보
	//2. 필드 접근제한자 : private
	private String custno;//private int custno; //
	private String custname;
	private String phone;
	private String address;
	private String joindate;
	private String grade;
	private String city;
	
	//3.매개변수가 없는생성자 : 기본생성자 - 반드시 존재해야 함
	public MemberBeans() {}
	
	//매개변수가 있는 생성자 생성자를 추가하면 반드시 기본생성자는 직접 추가
	//ShoppingDAO.java의 getMembers()에서 ArrayList<MemberBeans> 객체 1번만 생성-[방법-2] 참조
	public MemberBeans(String custno, String custname, String phone, String address, String joindate, String grade,
			String city) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.phone = phone;
		this.address = address;
		this.joindate = joindate;
		this.grade = grade;
		this.city = city;
	}
	
	//4. 메서드 접근제한자 : public (단, 읽기전용 get~()만

	public String getCustno() {
		return custno;
	}
	public void setCustno(String custno) {
		this.custno = custno;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	
}
