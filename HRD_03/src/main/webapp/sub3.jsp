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
					<th>회원번호</th>
					<th>회원명</th>
					<th>강의명</th>
					<th>강의장소</th>
					<th>수강료</th>
					<th>등급</th>
				</tr>
				
				<% for(Sub3DTO dto : list) { %>
					<tr align="center">
						<td><%= dto.getResist_month() %></td>
						<td><%= dto.getC_no() %></td>
						<td><%= dto.getC_name() %></td>
						<td><%= dto.getClass_name() %></td>
						<td><%= dto.getClass_area() %></td>
						
						<%
							int tution = dto.getTuition();
						DecimalFormat df = new DecimalFormat("￦#,##0"); //￦ : ㄹ + 한자
						%>
						<td><%= df.format(tution) %></td>
						<td><%= dto.getGrade() %></td>
					</tr>
				<% } %>
			</table>
		</div>
		
	</section>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
