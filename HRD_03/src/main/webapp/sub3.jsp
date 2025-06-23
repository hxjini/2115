<%@page import="java.util.List"%>
<%@page import="exam.Sub3DTO"%>
<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProjectDAO dao = new ProjectDAO();
List<Sub3DTO> list = dao.selectSub3();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub3</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<div align="center">
			<h3>회원정보조회</h3>
			<table border="1" style="width: 70%">
				<tr>
					<th>수강월</th>
					<th>수강월</th>
					<th>수강월</th>
					<th>수강월</th>
					<th>수강월</th>
					<th>수강월</th>
					<th>수강월</th>
				</tr>
				
				<% for(Sub3DTO dto : list) { %>
					<tr>
						<td><%= dt %></td>
					</tr>
				<% } %>
			</table>
		</div>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>