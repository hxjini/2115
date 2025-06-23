<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProjectDAO dao = new ProjectDAO();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub4</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<div align="center">
			<h3>강사매출현황</h3>
			
			<table border="1" style="width: 70%">
				<tr>
					<th>강사코드</th>
					<th>강사코드</th>
					<th>강사코드</th>
					<th>강사코드</th>
				</tr>
				
				<% for() { %>
					<tr>
						<td><%=dto %></td>
					</tr>
				<% } %>
			</table>
		</div>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>