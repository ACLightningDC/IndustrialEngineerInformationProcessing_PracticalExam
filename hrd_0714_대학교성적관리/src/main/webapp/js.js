/**
 * 
 */
function check(){
	if(!f.studno.value){
		alert("학번을 입력해 주세요");
		f.studno.focus();
	}
	if(!f.syear.value){
		alert("학년을 입력해 주세요");
		f.syear.focus();
	}
	if(!f.sname.value){
		alert("이름을 입력해 주세요");
		f.sname.focus();
	}
	if(!f.address.value){
		alert("주소를 입력해 주세요");
		f.address.focus();
	}
	if(!f.gender[0].checked && !f.gender[1].checked  ){
		alert("성별을 입력해 주세요");
		f.gender.focus();
	}
	if(!f.tel.value){
		alert("전화번호를 입력해 주세요");
		f.tel.focus();
	}
	if(!f.idnum.value){
		alert("주민번호을 입력해 주세요");
		f.idnum.focus();
	}
	
	f.submit();
}

function check2(){
	if(!f.studno.value){
		alert("학번을 입력해 주세요");
		f.studno.focus();
	}
	if(!f.syear.value){
		alert("학년을 입력해 주세요");
		f.syear.focus();
	}
	if(!f.m_subject1.value){
		alert("전공1 성적을 입력해 주세요");
		f.m_subject1.focus();
	}
	if(!f.m_subject2.value){
		alert("전공2 성적을 입력해 주세요");
		f.m_subject2.focus();
	}
	if(!f.m_subject3.value){
		alert("전공3 성적을 입력해 주세요");
		f.m_subject3.focus();
	}
	if(!f.s_subject1.value){
		alert("교양1 성적을 입력해 주세요");
		f.s_subject1.focus();
	}
	if(!f.s_subject2.value){
		alert("교양2 성적을 입력해 주세요");
		f.s_subject2.focus();
	}
	f.submit();
 }