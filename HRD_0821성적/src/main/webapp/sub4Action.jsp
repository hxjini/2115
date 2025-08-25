<%@page import="java.text.DecimalFormat"%>
<%@page import="exam.Sub4DTO"%>
<%@page import="java.util.List"%>
<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String searchSubcode = request.getParameter("searchSubcode");

ProjectDAO dao = new ProjectDAO();
List<Sub4DTO> list = dao.selectSub4(searchSubcode);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub4Action</title>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<section>
		<div align="center">
			<h3>과목별 성적조회</h3>
			<form action="sub4Action.jsp" method="post" name="sub4Form">
				<table border="1">
					<tr>
						<th>과목코드</th>
						<td><input type="text" name="searchSubcode"/></td>
						<td><input type="button" value="조회" onclick="fnSub4FormCheck()"/></td>
					</tr>
				</table>
			</form>
			
			</br>
			</br>
			
			<table border="1" style="width: 70%">
				<tr>
					<th>학번</th>
					<th>성명</th>
					<th>학과</th>
					<th>과목</th>
					<th>중간</th>
					<th>기말</th>
					<th>출석</th>
					<th>레포트</th>
					<th>기타</th>
					<th>총점</th>
					<th>학점</th>
				</tr>
				
			<%if(list.size() == 0){ %>
			<tr>
				<th colspan="11">검색결과가 없습니다!</th>
			</tr>
			<%} else { %>
				<%for(Sub4DTO dto : list){ %>
					<tr align="center">
						<td><%= dto.getStuid() %></td>
						<td><%= dto.getSname() %></td>
						<td><%= dto.getDeptname() %></td>
						<td><%= dto.getSubname() %></td>
						<td><%= dto.getMidscore() %></td>
						<td><%= dto.getFinalscore() %></td>
						<td><%= dto.getAttend() %></td>
						<td><%= dto.getReport() %></td>
						<td><%= dto.getEtc() %></td>
						
						<%
						double total = dto.getTotal();
						DecimalFormat df = new DecimalFormat("0.0");
						%>
						
						<td><%= df.format(total) %></td>
						<td><%= dto.getGrade() %></td>
					</tr>
				<%} %>
			<%} %>
			</table>
		</div>
		
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>