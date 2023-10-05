/**
 * 
 */

function insertInjectSubmit(){
	 if(f.p_send.value == null){
		 alert("예방접종이력번호 부탁드립니다.");
		 return f.p_send.focus();
	 }
	 if(f.p_no.value == ""){
		 alert("고객번호 부탁드립니다.");
		 return f.p_no.focus();
	 }
	 if(f.i_code.value == ""){
		 alert("백신코드 부탁드립니다.");
		 return f.i_code.focus();
	 }
	 if(f.p_date.value == ""){
		 alert("접종일자 부탁드립니다.");
		 return f.p_date.focus();
	 }
	 
	 f.submit();
 }