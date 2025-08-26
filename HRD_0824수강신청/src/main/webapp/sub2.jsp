<%@page import="java.util.List"%>
<%@page import="exam.Sub1DTO"%>
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
			<h3>교과목 추가</h3>
			<form action="sub2InsertAction.jsp" method="post" name="sub2InsertForm">
				<table border="1">
					<tr>
						<th>과목 코드</th>
						<td><input type="text" name="c_id"/></td>
					</tr>
					<tr>
						<th>과목명</th>
						<td><input type="text" name="c_name"/></td>
					</tr>
					<tr>
						<th>학점</th>
						<td><input type="number" name="credit"/></td>
					</tr>
					<tr>
						<th>담당강사</th>
						<td>
							<select name="l_id">
								<option value="">담당강사</option>
								<option value="1">김교수</option>
								<option value="2">이교수</option>
								<option value="3">박교수</option>
								<option value="4">우교수</option>
								<option value="5">최교수</option>
								<option value="6">임교수</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>요일</th>
						<td>
							<input type="radio" name="week" value="1"/> 월
							<input type="radio" name="week" value="2"/> 화
							<input type="radio" name="week" value="3"/> 수
							<input type="radio" name="week" value="4"/> 목
							<input type="radio" name="week" value="5"/> 금
						</td>
					</tr>
					<tr>
						<th>시작 시간</th>
						<td><input type="number" name="start_hour"/></td>
					</tr>
					<tr>
						<th>종료 시간</th>
						<td><input type="number" name="end_hour"/></td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="추가" onclick="fnInsertCheck()"/>
							<input type="button" value="취소" onclick="fnInsertReset()"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>