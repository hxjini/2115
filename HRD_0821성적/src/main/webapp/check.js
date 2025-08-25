//과목별 성적입력(sub2.jsp) 유효성 검사
function fnSub2FormCheck(){
	var stuid = document.sub2Form.stuid.value;
	var midscore = document.sub2Form.midscore.value;
	var finalscore = document.sub2Form.finalscore.value;
	var attend = document.sub2Form.attend.value;
	var report = document.sub2Form.report.value;
	var etc = document.sub2Form.etc.value;
	
	if(stuid == ""|| stuid.trim().length == 0){
		alert("학번이 입력되지 않았습니다!");
		
		document.sub2Form.stuid.value = "";
		document.sub2Form.stuid.focus();
		
		return false;
	} else if(midscore == "" || midscore.trim().length == 0){
		alert("중간고사는 숫자가 아니거나 입력되지 않았습니다!");
		
		document.sub2Form.midscore.value = "";
		document.sub2Form.midscore.focus();
		
		return false;
	} else if(finalscore == ""|| finalscore.trim().length == 0){
		alert("기말고사는 숫자가 아니거나 입력되지 않았습니다!");
		
		document.sub2Form.finalscore.value = "";
		document.sub2Form.finalscore.focus();
		
		return false;
	} else if(attend == "" || attend.trim().length == 0){
		alert("출석은 숫자가 아니거나 입력되지 않았습니다!");
		
		document.sub2Form.attend.value = "";
		document.sub2Form.attend.focus();
		
		return false;
	} else if(report = "" || report.trim().length == 0){
		alert("레포트는 숫자가 아니거나 입력되지 않았습니다!");
		
		document.sub2Form.report.value = "";
		document.sub2Form.report.focus();
		
		return false;
	} else if(etc == "" || etc.trim().length == 0){
		alert("기타는 숫자가 아니거나 입력되지 않았습니다!");
		
		document.sub2Form.etc.value = "";
		document.sub2Form.etc.focus();
		
		return false;
	} else{
		alert("성적정보가 정상적으로 등록되었습니다!");
		document.sub2Form.submit();
	}
}//fnSub2FormCheck

//취소(sub2.jsp)
function fnSub2FormReset(){
	if(confirm("정보를 지우고 처음부터 다시 입력gkqslek!")){
		document.sub2Form.reset();
	}else{
		return false;
	}
}//fnSub2FormReset()

//조회(sub4.jsp)
function fnSub4FormCheck(){
	var searchSubcode = document.sub4Form.searchSubcode.value;
	if(searchSubcode == "" || searchSubcode.trim().length == 0){
		alert("과목코드가 입력되지 않았습니다!");
		
		document.sub4Form.searchSubcode.value = "";
		document.sub4Form.searchSubcode.focus();
		
		return false;
	}
	document.sub4Form.submit();
}//fnSub4FormCheck()




