/**
 * 
 */

function check(){
	
	const regIdPass = "/^[a-zA-A0-9]{3,12}$/";
	
	const regName = "/^[가-힝a-zA-Z]{2,}$/";
	
	const regTel = "/^\d{3}-\d{4}-\d{4}$/";
	
	//회원 아이디 유효성 검사 - 정규화 공식 이용
	if(!f.me_id.value){
		alert("아이디를 입력해 주세요.");
		return f.me_id.focus();
	}else if(!regIDPass.test(f.me_id.value)){
		alert("회원아이디는 3~12자의 영어 대소문자와 숫자로만 입력가능합니다.");
		return f.me_id.select();
		
	}
	if(!f.me_pass.value){
		alert("비밀번호를 입력해 주세요.");
		return f.me_pass.focus();
	}else if(!regIDPass.test(f.me_id.value)){
		alert("비밀번호는 3~12자의 영어 대소문자와 숫자로만 입력가능합니다.");
		return f.me_id.select();
	}
	if(!f.me_name.value){
		alert("아이디를 입력해 주세요.");
		return f.me_name.focus();
	}else if(!regIDPass.test(f.me_id.value)){
		alert("회원아이디는 3~12자의 영어 대소문자와 숫자로만 입력가능합니다.");
		return f.me_id.select();
		}
	if(f.me_gender[0].checked == false && f.gender[1].checked ==false ){
		alert("아이디를 입력해 주세요.")
		return f.me_gender.focus()
	}
	if(!f.birth.value){
		alert("아이디를 입력해 주세요.")
		return f.birth.focus()
	}
	if(!f.address.value){
		alert("아이디를 입력해 주세요.")
		return f.address.focus()
	}
	if(!f.tel.value){
		alert("아이디를 입력해 주세요.")
		return f.tel.focus()
	}
	
	f.submit();
}

function check2(){
	if(!f.me_id.value){
		alert("아이디를 입력해 주세요.")
		return f.me_id.focus()
	}
	if(!f.me_pass.value){
		alert("아이디를 입력해 주세요.")
		return f.me_pass.focus()
	}
	if(!f.me_name.value){
		alert("아이디를 입력해 주세요.")
		return f.me_name.focus()
	}
	if(!f.rm_date.value){
		alert("아이디를 입력해 주세요.")
		return f.birth.focus()
	}
	
	f.submit();
	}
	
	
function rewirte(){
	if(confirm("다시 입력하시겠습니까")){
		f.reset();
		f.me_id.focus();
	}else {return};
}
	
	
	