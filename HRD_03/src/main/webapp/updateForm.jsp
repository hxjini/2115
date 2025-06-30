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
</head>
<body>
<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<div align="center">
			<h3>강사정보 수정</h3>
			
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>