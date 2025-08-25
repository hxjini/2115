<%@page import="exam.ProjectDAO"%>
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
	<jsp:include page="nav.jsp"/>
	<section>
		<div align="center">
			<h3>성적입력</h3>
			
			<form action="sub2Action.jsp" method="post" name="sub2Form">
				<table border="1">
					<tr>
						<th>학번</th>
						<td><input type="text" name="stuid"></td>
					</tr>
					<tr>
						<th>교과코드</th>
						<td>
							<select name="subcode">
								<option value="A001">A001-자바</option>
								<option value="A002">A002-C언어</option>
								<option value="A003">A003-데이터베이스</option>
								<option value="A004">A004-웹프로그래밍</option>
								<option value="A005">A005-영어</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>중간</th>
						<td><input type="number" name="midscore"></td>
					</tr>
					<tr>
						<th>기말</th>
						<td><input type="number" name="finalscore"></td>
					</tr>
					<tr>
						<th>출석</th>
						<td><input type="number" name="attend"></td>
					</tr>
					<tr>
						<th>레포트</th>
						<td><input type="number" name="report"></td>
					</tr>
					<tr>
						<th>기타</th>
						<td><input type="number" name="etc"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="button" value="등록" onclick="fnSub2FormCheck()"/>
							<input type="button" value="취소" onclick="fnSub2FormReset()"/>
						</td>
					</tr>
					
				</table>
			</form>
		</div>
		
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>