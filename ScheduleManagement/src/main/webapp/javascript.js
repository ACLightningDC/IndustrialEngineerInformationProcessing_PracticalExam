/**
 * 
 */

 function insertSubmit(){
	 document.log(f.w_workno.value);
	 if(f.w_workno.value == ""){
		 alert('작업지시번호를 입력해 주세요');
		 return f.w_workno.focus();
	 }
	 else if(f.p_p1[0].checked == false && f.p_p1[1].checked == false){
		 alert('재료 준비를 체크해 주세요');
		 return ;
	 }
	 else if(f.p_p2[0].checked == false && f.p_p2[1].checked == false){
		 alert('인쇄공정를 체크해 주세요');
		 return ;
	 }
	 else if(f.p_p3[0].checked == false && f.p_p4[1].checked == false){
		 alert('코팅공정를 체크해 주세요');
		 return ;
	 }
	 else if(f.p_p4[0].checked == false && f.p_p4[1].checked == false){
		 alert('합지공정를 체크해 주세요');
		 return ;
	 }
	 else if(f.p_p5[0].checked == false && f.p_p5[1].checked == false){
		 alert('접합공정를 체크해 주세요');
		 return ;
	 }
	 else if(f.p_p6[0].checked == false && f.p_p6[1].checked == false){
		 alert('포장적재를 체크해 주세요');
		 return ;
	 }
	 
	 f.action = "insertWorkAction.jsp";
	 f.submit();
 }
 
 function updateSubtmi(){
	 
 } 