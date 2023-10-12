/**
 * 
 */

function studentInsertCheck(){
	console.log('실행');
	
	if(f.student_name.value== ""){
		alert('이름을 입력하십시오');
		return f.student_name.focus();
	}
	if(f.student_name.value == ""){
		alert('주소를 입력하십시오');
		return f.student_addr.focus();
	}
	if(f.student_name.value == ""){
		alert('연락처를 입력하십시오');
		return f.student_phone.focus();
	}
	if(f.student_name.value == ""){
		alert('생년월일을 입력하십시오');
		return f.student_birth.focus();
	}
	if(f.student_name.value == ""){
		alert('아이디를 입력하십시오');
		return f.student_id.focus();
	}
	if(f.student_name.value == ""){
		alert('비밀번호를 입력하십시오');
		return f.student_pw.focus();
	}
	
	f.submit();
	
}