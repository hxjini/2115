<%@page import="exam.Sub1DTO"%>
<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String teacher_code = request.getParameter("teacher_code");

ProjectDAO dao = new ProjectDAO();
Sub1DTO dto = dao.selectOneSub1(teacher_code);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<div align="center">
			<h3>강사정보 수정</h3>
			<form action="sub1UpdateAction.jsp" method="post" name="sub1UpdateForm">
			<table>
				<tr>
					<th>강사코드</th>
					<td>
						<input type="text" name="teacher_code" value="<%= dto.getTeacher_code() %>" readonly="readonly" />
					</td>
				</tr>
				
				<tr>
					<th>강사명</th>
					<td>
						<input type="text" name="teacher_name" value="<%= dto.getTeacher_name() %>" />
					</td>
				</tr>
				
				<tr>
					<th>강의명</th>
					<td>
						<input type="text" name="class_name" value="<%= dto.getClass_name() %>" />
					</td>
				</tr>
				
				<tr>
					<th>수강료</th>
					<td>
						<input type="text" name="class_price" value="<%= dto.getClass_price()%>" />
					</td>
				</tr>
				<tr>
					<th>강사자격취득일</th>
					<td>
						<input type="text" name="teach_resist_date" value="<%= dto.getTeach_resist_date()%>" />
					</td>
				</tr>
				
				<tr>
					<td colspan="2" align="center">
						<input type="button" value="수정" onclick="fnUpdateCheck()" />
						<input type="button" value="취소" onclick="fnUpdateReset()" />
					</td>
				</tr>
			</table>
			</form>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
