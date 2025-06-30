//회원명 선택 시 회원번호 자동입력
function fnC_nameChange(){
	document.sub2Form.tuition.value = ""; //수강료 초기화
	document.sub2Form.class_name.options[0].selected = true; //강의명 초기화
	document.sub2Form.c_no.value = document.sub2Form.c_name.value;
} //fnC_nameChange()

//강의명 선택 시 수강료 자동입력
function fnClass_nameChange(){
	var tuition = document.sub2Form.class_name.value;
	var c_no = document.sub2Form.c_no.value;
	
	
	if(c_no >= 20000){
		document.sub2Form.tuition.value = tuition * 1000 * 0.5;
	} else{
		document.sub2Form.tuition.value = tuition * 1000;
	}
} //fnClass_nameChange()

//수강신청 입력화면 유효성 검사
function fnSub2FormCheck(){
	var resist_month = document.sub2Form.resist_month.value;
	var c_name = document.sub2Form.c_name.value;
	var c_no = document.sub2Form.c_no.value;
	var class_area = document.sub2Form.class_area.value;
	var class_name = document.sub2Form.class_name.value;
	
	if(resist_month == "" || resist_month.trim().length == 0){
		alert("수강월이 입력되지 않았습니다.");
		
		document.sub2Form.resist_month = "";
		document.sub2Form.resist_month.focus();
		
		return false;
	} 
	
	else if(c_name = "" || c_name.trim().length == 0){
		alert("회원명이 입력되지 않았습니다.");
		
		document.sub2Form2.c_name = "";
		document.sub2Form2.c_name.focus();
		
		return false;
	} 	
	
	else if(c_no = "" || c_no == 0){
		alert("회원명이 입력되지 않았습니다.");
		
		document.sub2Form2.c_no.focus();
			
		return false;
	}	
	
	else if(class_area = ""){
		alert("강의장소가 입력되지 않았습니다.");
			
		document.sub2Form2.class_area.focus();			
		return false;
	} 	
	
	else if(class_name = "" || class_name == 0){
		alert("강의명이 입력되지 않았습니다.");
		
		document.sub2Form2.class_name.focus();
			
		return false;
	} 
	
	else{
		alert("수강신청이 정상적으로 완료되었습니다!");
		document.sub2Form.submit();
	}
}//fnSub2FormCheck()


//다시쓰기
function fnSub2FormReset(){	
	document.sub2Form.reset();
	alert("정보를 지우고 처음부터 다시 입력합니다!");
} //fnSub2FormReset()

//강사조회 삭제
function fnSub1Delete(teacher_code){
	//alert("강사코드 : " + teacher_code);
	if(confirm("정말 삭제하시겠습니까?")){
		location.href = "sub1Action.jsp?teacher_code=" + teacher_code;
		alert("삭제되었습니다!");
	} else{
		alert("취소되었습니다!");
		return false;
	}
}//fnSub1Delete()

//수정화면 유효성 검사
function fnUpdateCheck(){
	var tearcher_name = "document.sub1UpdateForm.teacher_name.value";
	var class_name = "document.sub1UpdateForm.class_name.value";
	var class_price = "document.sub1UpdateForm.class_price.value";
	var teach_resist_date = "document.sub1UpdateForm.teach_resist_date.value";
	
	//유효성 검사 코드 구현
	
	alert("강사 정보가 수정되었습니다!");
	document.sub1UpdateForm.submit();
}//updateCheck()


//수정화면 초기화
function fnUpdateReset(){
	alert("강사 정보가 초기화 되었습니다!");
	document.sub1UpdateForm.reset();
}//fnUpdateReset()

