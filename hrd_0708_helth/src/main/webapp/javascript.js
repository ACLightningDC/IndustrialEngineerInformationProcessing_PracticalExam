/**
 * 
 */

function check(){
	if(!f.me_id.value){
		alert("회원번호를 입력해 주세요.")
		return f.me_id.focus()
	}
	if(!f.me_pass.value){
		alert("회원이름를 입력해 주세요.")
		return f.me_pass.focus()
	}
	if(!f.me_name.value){
		alert("회원주소를 입력해 주세요.")
		return f.me_name.focus()
	}
	if(!f.me_gender.value){
		alert("등록일을 입력해 주세요.")
		return f.me_gender.focus()
	}
	if(f.gender[0].checked == false && f.gender[1].checked == false){
		alert("성별을 입력해 주세요.")
		return f.birth[0].focus()
	}
	if(!f.address.value){
		alert("전화번호를 입력해 주세요.")
		return f.address.focus()
	}
	
	f.submit();
}

function check2(){
	if(!f.me_id.value){
		alert("회원번호를 입력해 주세요.");
		return f.me_id.focus();
	}
	if(!f.me_pass.value){
		alert("회원이름를 입력해 주세요.");
		return f.me_pass.focus();
	}
		if(!f.tno.value){
		alert("회원이름를 입력해 주세요.");
		return f.me_pass.focus();
	}
		if(!f.ttime.value){
		alert("회원이름를 입력해 주세요.");
		return f.me_pass.focus();
	}
		f.submit();
}

function changeSelect(){
	alert("실행")	;
	return f.ttime.options[f.tno.selectedIndex].selected = true;
}