<%@page import="java.util.List"%>
<%@page import="exam.Sub4DTO"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProjectDAO dao = new ProjectDAO();
List<Sub4DTO> list = dao.selectSub4();
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
					<th>강의명</th>
					<th>강사명</th>
					<th>총매출</th>
				</tr>
				
				<% for(Sub4DTO dto : list) { %>
					<tr>
						<td align="center"><%=dto.getTeacher_code() %></td>
						<td align="center"><%=dto.getClass_name() %></td>
						<td align="center"><%=dto.getTeacher_name() %></td>
					</tr>
					
					<%
						int total = dto.getTotal();
						DecimalFormat df = new DecimalFormat("￦#,##0");
					%>
					<td align="right"><%=df.format(total) %></td>
				<% } %>
			</table>
		</div>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
