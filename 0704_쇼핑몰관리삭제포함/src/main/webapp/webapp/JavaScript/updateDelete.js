/**
 * 
 */

 function check() {
		if(f.memno.value == ""){//javascript "" '' 둘다 문자열 취급 
			alert("회원번호를 입력해주세요.");//알림창
			//f.memno.focus();
			//return false;//false 주면 "submit"
			return f.memno.focus();//
			//return f.memno..select(); //글자 블록 설정하여 입력하는 글자로 덮어씌우기 편리하게 함
		}
		if(f.name.value == ""){
			alert("회원이름를 입력해주세요.");//알림창
			return f.name.focus();
		
		}
		if(f.address.value == ""){
			alert("주소를 입력해주세요.");
			return f.address.focus();
		}
		if(f.hiredate.value == ""){
			alert("가입일를 입력해주세요.");
			return f.hiredate.focus();
			
		}
		//★주의 : radio, checkbox
		if(f.gender[0].checked == false && f.gender[1].checked == false){
			alert("성별을 입력해주세요.");
			return f.gender.focus();
			
		}
		if(f.tel1.value == ""){
			alert("전화번호를 입력해주세요.");
			return f.tel1.focus();
			 
		}
		if(f.tel2.value == ""){
			alert("전화번호를 입력해주세요.");
			return f.tel2.focus();
		}
		if(f.tel3.value == ""){//javascript "" '' 둘다 문자열 취급 
			alert("전화번호를 입력해주세요.");//알림창
			return f.tel3.focus();	
			
		}
		
		//따로처리 방법-1
		//f.action = "updatePro.jsp";
		
		//함께 처리 방법
		f.pro.value="수정";
		
		f.submit();//insertPro.jsp로 데이터 제출
		

	}

	
	function reWrite(){
		var x = confirm("다시 쓰시겠습니까?");//[확인]==true, [취소]==false
		if(x == true) {f.reset();}//초기화
		f.name.select();//커서 위치
	}
	
	 function checkDelete() {
		if(f.memno.value == ""){
			alert("회원번호를 입력해주세요");
			return f.memno.focus();
		}
		
		if(confirm("회원을 정말로 삭제하시겠습니까?")){
			
			f.pro.value="삭제";
		
			f.submit();
		}else return false;
}