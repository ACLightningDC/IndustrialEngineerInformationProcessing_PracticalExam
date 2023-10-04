/**
 * 
 */
function check(){
	if(!f.member_no.value){
		alert("잘못된 회원번호입니다");
		return f.member_no.focus();
	}
		if(!f.member_id.value){
		alert("잘못된 아이디입니다");
		return f.member_id.focus();
	}
		if(!f.member_name.value){
		alert("잘못된 이름입니다");
		return f.member_name.focus();
	}
	//주의 : select => selected
		if(f.member_grade[0].selected ==false &&f.member_grade[1].selected ==false &&f.member_grade[2].selected ==false ){
		alert("잘못된 등급입니다");
		return f.member_grade.focus();
	}
	//주의 : radio, checkbox => ckecked
		if(f.member_hobby[0].checked ==false &&f.member_hobby[1].checked ==false &&f.member_hobby[2].checked ==false ){
		alert("하나이상의 취미가 필요합니다");
		return f.member_hobby[0].focus();
	}
		if(!f.member_date.value){
		alert("잘못된 날짜입니다");
		return f.member_date.focus();
	}
	f.sw.value="1";
	f.submit();
}

function deleteup(){
		if(!f.member_no.value){
		alert("회원번호 입력부탁드립니다.");
		return f.member_no.focus();
	}else{
			f.sw.value="2";
	f.submit();
	}

}