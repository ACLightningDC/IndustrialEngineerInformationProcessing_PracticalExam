/**
 * 
 */
function check(){
	 if(f.custno.value == "")
 {
	 alert("회원번호가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.custname.value == "")
 {
	 alert("회원이름이 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.phone.value == "")
 {
	 alert("전화번호가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.address.value == "")
 {
	 alert("주소가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.joindate.value == "")
 {
	 alert("가입일자가 입력되지 않았습니다.");
	 return f.city.focus();
 }
 if(f.grade.value !="A" && f.grade.value !="B" && f.grade.value !="c")
 {
	 alert("회원등급이 잘못입력되었습니다.");
	 return f.grade.select();
 }
 
/*
 if(!(f.grade.value !="A" || f.grade.value !="B" ||f.grade.value !="c"))
{
	 alert("회원등급이 잘못입력되었습니다.");
	 return f.grade.select();
 }
 */
 
 if(f.city.value == "")
 {
	 alert("도시코드가 입력되지 않았습니다.");
	 return f.city.focus();
 }
 f.submit();
}

function checkUpdate(){
		 if(f.custno.value == "")
 {
	 alert("회원번호가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.custname.value == "")
 {
	 alert("회원이름이 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.phone.value == "")
 {
	 alert("전화번호가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.address.value == "")
 {
	 alert("주소가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.joindate.value == "")
 {
	 alert("가입일자가 입력되지 않았습니다.");
	 return f.city.focus();
 }
 if(f.grade.value !="A" && f.grade.value !="B" && f.grade.value !="c")
 {
	 alert("회원등급이 잘못입력되었습니다.");
	 return f.grade.select();
 }
 
/*
 if(!(f.grade.value !="A" || f.grade.value !="B" ||f.grade.value !="c"))
{
	 alert("회원등급이 잘못입력되었습니다.");
	 return f.grade.select();
 }
 */
 
 if(f.city.value == "")
 {
	 alert("도시코드가 입력되지 않았습니다.");
	 return f.city.focus();
 }
 //f.action="updatePro.jsp"; //따로 처리 방법 : post방식으로 저달해야 함(?회원정보는 보안상중요한 정보가 담겨있어서 외부에 노출x)
 f.pro2.value="수정";//post방식 updateDeletePro.jsp에서 한글깨짐 방지 위해-request.setCharacterEncoding("UTF-8")
 
 f.submit();
}
	
function checkDelete(){
	if(f.custno.value ==""){
		alert("회원번호가 입력되지 않았습니다.");
		return f.custno.focust();
	}
	if(confirm("정말로 삭제하시겠습니까?")){
		//f.action="deletePro.jsp	"//따로 처리 방법-1"
		//따로 처리 방법-2 : get 방식으로 
	//	location.href="deletePro.jsp?custno=" +f.custno.value;//
	f.pro2.value="삭제";//[함꼐 처림 방법-1]
	 f.submit();
	}else {}

}
function checkUpdateDelete(btnId){
		 if(f.custno.value == "")
 {
	 alert("회원번호가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.custname.value == "")
 {
	 alert("회원이름이 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.phone.value == "")
 {
	 alert("전화번호가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.address.value == "")
 {
	 alert("주소가 입력되지 않았습니다.");
	 return f.city.focus();
 }
  if(f.joindate.value == "")
 {
	 alert("가입일자가 입력되지 않았습니다.");
	 return f.city.focus();
 }
 if(f.grade.value !="A" && f.grade.value !="B" && f.grade.value !="c")
 {
	 alert("회원등급이 잘못입력되었습니다.");
	 return f.grade.select();
 }
 
/*
 if(!(f.grade.value !="A" || f.grade.value !="B" ||f.grade.value !="c"))
{
	 alert("회원등급이 잘못입력되었습니다.");
	 return f.grade.select();
 }
 */
 
 if(f.city.value == "")
 {
	 alert("도시코드가 입력되지 않았습니다.");
	 return f.city.focus();
 }
 //f.action="updatePro.jsp"; //따로 처리 방법 : post방식으로 저달해야 함(?회원정보는 보안상중요한 정보가 담겨있어서 외부에 노출x)
 f.pro2.value="수정";//post방식 updateDeletePro.jsp에서 한글깨짐 방지 위해-request.setCharacterEncoding("UTF-8")
 
 if(btnId == 'update'){
	 if(confirm("회원정보를 수정하시겠습니까?")){
		 	f.pro2.value="수정";//[함께 처리 방법-2
		 	 f.submit();
	 }else return;
 }else if(btnId=='delete'){
	 if(confirm("회원정보를 삭제하시겠습니까?")){
		  f.pro2.value="삭제";//[함께 처리 방법-2
		  f.submit();
	 }else return;
	
 }
 
 f.submit();
}