<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub2</title>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<div align="center">
			<h3>수강신청</h3>
			
			<form action="sub2Action.jsp" method="post" name="sub2Form">
				<table border="1" style="width: 70%">
					<tr>
						<th>수강월</th>
						<td>
							<input type="text" name="resist_month"/> 예)202203
						</td>
					</tr>
					<tr>
						<th>회원명</th>
						<td>
							<select name="c_name" onchange="fnC_nameChange()">
								<option value="">회원명</option>
								<option value="10001">홍길동</option>
								<option value="20002">장발장</option>
								<option value="10003">임꺽정</option>
								<option value="20001">성춘향</option>
								<option value="20002">이몽룡</option>
								
							</select>
						</td>
					</tr>
					<tr>
						<th>회원번호</th>
						<td>
							<input type="text" name="c_no" readonly="readonly"/>
						</td>
					</tr>
					
					<tr>
						<th>강의장소</th>
						<td>
							<input type="radio" name="class_area" value="서울본원"/> 서울본원
							<input type="radio" name="class_area" value="성남분원"/> 성남분원
							<input type="radio" name="class_area" value="대전분원"/> 대전분원
							<input type="radio" name="class_area" value="부산분원"/> 부산분원
							<input type="radio" name="class_area" value="대구분원"/> 대구분원
						</td>
					</tr>
					
					<tr>
						<th>강의명</th>
						<td>
							<select name="class_name" onchange="fnClass_nameChange()">
								<option value="">강의신청</option>
								<option value="100">초급반</option>
								<option value="200">중급반</option>
								<option value="300">고급반</option>
								<option value="400">심화반</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>수강료</th>
						<td>
							<input type="text" name="tuition" readonly="readonly"/> 원
						</td>
					</tr>
					
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="수강신청" onclick="fnSub2FormCheck()"/>
							<input type="button" value="다시쓰기" onclick="fnSub2FormReset()"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>