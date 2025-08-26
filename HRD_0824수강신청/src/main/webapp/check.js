//유효성 검사
function fnUpdateCheck(){
	var c_name= document.sub1UpdateForm.c_name.value;
	var credit = document.sub1UpdateForm.credit.value;
	var l_id = document.sub1UpdateForm.l_id.value;
	var start_hour = document.sub1UpdateForm.start_hour.value;
	var end_hour = document.sub1UpdateForm.end_hour.value;
	
	if(c_name == "" || c_name.trim().length == 0){
		alert("과목명이 입력되지 않았습니다!");
		
		document.sub1UpdateForm.c_name.value = "";
		document.sub1UpdateForm.c_name.focus();
		
		return false;
	} else if(credit == "" || credit == 0){
		alert("학점이 입력되지 않았습니다!");
		
		document.sub1UpdateForm.credit.value = "";
		document.sub1UpdateForm.credit.focus();
		
		return false;
	} else if(l_id == ""){
		alert("담당강사가 입력되지 않았습니다!");
		
		document.sub1UpdateForm.l_id.focus();
		
		return false;
	} else if(start_hour == "" || start_hour == 0){
		alert("시작시간이 입력되지 않았습니다!");
		
		document.sub1UpdateForm.start_hour.value = "";
		document.sub1UpdateForm.start_hour.focus();
		
		return false;
	} else if(end_hour == ""||end_hour==0){
		alert("종료 시간이 입력되지 않았습니다!");
		
		document.sub1UpdateForm.end_hour.value="";
		document.sub1UpdateForm.end_hour.focus();
		
		return false;
	} else{
		alert("교과목 수정이 완료되었습니다!");
		
		document.sub1UpdateForm.submit();
	}
}//fnUpdateCheck()

//수정 취소
function fnUpdateReset(){
	alert("교과목 수정이 취소되었습니다!");
	
	document.sub1UpdateForm.reset();
	document.sub1UpdateForm.c_name.focus();
}//fnUpdateReset()

//삭제
function fnSub1Delete(c_id){
	if(confirm("정말 삭제하시겠습니까?")){
		alert("교과목이 삭제되었습니다!");
		location.href="sub1DeleteAction.jsp?c_id="+ c_id;
		return true;
	}else{
		alert("교과목 삭제가 취소되었습니다!");
		return false;
	}
}//fnSub1Delete()

//추가
function fnInsertCheck(){
	var c_id = document.sub2InsertForm.c_id.value;
	var c_name = document.sub2InsertForm.c_name.value;
	var credit = document.sub2InsertForm.credit.value;
	var l_id = document.sub2InsertForm.l_id.value;
	var week = document.sub2InsertForm.week.value;
	var start_hour = document.sub2InsertForm.start_hour.value;
	var end_hour = document.sub2InsertForm.end_hour.value;
	
	if(c_id == "" || c_id.trim().length == 0){
		alert("과목 코드가 입력되지 않았습니다.");
		
		document.sub2InsertForm.c_id.value = "";
		document.sub2InsertForm.c_id.focus();
		
		return false;
	} else if(c_name == "" || c_name.trim().length == 0){
		alert("과목명이 입력되지 않았습니다.");
		
		document.sub2InsertForm.c_name.value = "";
		document.sub2InsertForm.c_name.focus();
		
		return false;
	} else if(credit == "" || credit == 0){
		alert("학점이 입력되지 않았습니다!");
		
		document.sub2InsertForm.credit.value = "";
		document.sub2InsertForm.credit.focus();
		
		return false;
	} else if(l_id == ""){
		alert("담당강사가 선택되지 않았습니다!");
		
		document.sub2InsertForm.l_id.value = "";
		document.sub2InsertForm.l_id.focus();
		
		return false;
	} else if(week == ""	){
		alert("요일이 선택되지 않았습니다!");
		
		
		
		return false;
	} else if(start_hour == "" || start_hour == 0){
		alert("시작 시간이 입력되지 않았습니다!");
		
		document.sub2InsertForm.start_hour.value ="";
		document.sub2WInsertForm.start_hour.focus();
		
		return false;
	} else if(end_hour == "" || end_hour == 0){
		alert("종료 시간이 입력되지 않았습니다!");
				
		document.sub2InsertForm.end_hour.value ="";
		document.sub21InsertForm.end_hour.focus();
				
		return false;
	} else {
		alert("교과목 등록이 완료되었습니다!");
		
		document.sub1InsertForm.submit();
	}
}//fnInsertCheck()

//목록
function fnInsertReset(){
	location.href="sub1.jsp";
}//fnInsertReset()




