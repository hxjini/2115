<%@page import="java.text.DecimalFormat"%>
<%@page import="exam.Sub1DTO"%>
<%@page import="java.util.List"%>
<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ProjectDAO dao = new ProjectDAO();
List<Sub1DTO> list = dao.selectSub1();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub1</title>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"></jsp:include>
	<section>
		<div align="center">
			<h3>강사조회</h3>
			<table border="1" style="width: 70%">
				<tr>
					<th>강사코드</th>
					<th>강사명</th>
					<th>강의명</th>
					<th>수강료</th>
					<th>강사자격취득일</th>
				</tr>
				
				<% for(Sub1DTO dto : list){%>
					<tr align="center">
						<td><%= dto.getTeacher_code() %></td>
						<td><%= dto.getTeacher_name() %></td>
						<td><%= dto.getClass_name() %></td>
						
						<%
						int class_price = dto.getClass_price();
						DecimalFormat df = new DecimalFormat("￦#,##0"); // ￦ : ㄹ + 한자
						%>
						<td><%= df.format(class_price)%></td>
						
						<td><%= dto.getTeach_resist_date() %></td>
					</tr>
				<%} %>
			</table>
		</div>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>