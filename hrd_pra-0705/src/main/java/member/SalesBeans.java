package member;
//회원매출조회-select2.jsp
public class SalesBeans {
	//회원번호
	private String custno; 
	private String custname; 
	private String grade; 
	private String totalprice;
	
	public SalesBeans() {}
	public SalesBeans(String custno, String custname, String grade, String totalprice) {
		super();
		this.custno = custno;
		this.custname = custname;
		this.grade = grade;
		this.totalprice = totalprice;
	}
	
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(String totalprice) {
		this.totalprice = totalprice;
	} 

	
}
