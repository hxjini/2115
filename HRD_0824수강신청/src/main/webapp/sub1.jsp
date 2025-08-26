<%@page import="java.util.List"%>
<%@page import="exam.Sub1DTO"%>
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
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<section>
		<div align="center">
			<h3>교과목 목록</h3>
			<table border="1" style="width: 70%">
				<tr>
					<th>과목코드</th>
					<th>과목명</th>
					<th>학점</th>
					<th>담당강사</th>
					<th>요일</th>
					<th>시작시간</th>
					<th>종료시간</th>
					<th>삭제</th>
				</tr>
				
				<%for(Sub1DTO dto : list) { %>
				<tr align="center">
					<td><a href="sub1UpdateForm.jsp?c_id=<%= dto.getC_id() %>"><%= dto.getC_id() %></a></td>
					<td><%= dto.getC_name() %></td>
					<td><%= dto.getCredit() %></td>
					<td><%= dto.getL_name() %></td>
					<%
					String weekday = "";
					if(dto.getWeek() == 1) weekday = "월요일";
					if(dto.getWeek() == 2) weekday = "화요일";
					if(dto.getWeek() == 3) weekday = "수요일";
					if(dto.getWeek() == 4) weekday = "목요일";
					if(dto.getWeek() == 5) weekday = "금요일";
					%>
					<td><%= weekday %></td>
					<%
					String start = "";
					if(dto.getStart_hour() <= 999){
						start = "0" + dto.getStart_hour();
						start = start.substring(0,2) + "시" + start.substring(2) + "분";
					}else{
						start = "" + dto.getStart_hour();
						start = start.substring(0, 2) + "시" + start.substring(2) + "분";
					}
					%>
					
					<td><%= start %></td>
					<%
					String end = "";
					if(dto.getEnd_hour()<= 999){
						end = "0" + dto.getEnd_hour();
						end = end.substring(0,2) + "시" + end.substring(2) + "분";
					}else{
						end = "" + dto.getEnd_hour();
						end = end.substring(0, 2) + "시" + end.substring(2) + "분";
					}
					%>
					<td><%= end %></td>
					<td><a href="#" onclick="fnSub1Delete('<%= dto.getC_id() %>')">삭제</a></td>
				</tr>
				<% } %>
			</table>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>