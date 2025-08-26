<%@page import="exam.Sub1UpdateDTO"%>
<%@page import="java.util.List"%>
<%@page import="exam.Sub1DTO"%>
<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String c_id = request.getParameter("c_id");

ProjectDAO dao = new ProjectDAO();
Sub1UpdateDTO dto = dao.selectOneSub1(c_id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sub1Update</title>
<script type="text/javascript" src="check.js"></script>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<jsp:include page="nav.jsp"/>
	<section>
		<div align="center">
			<h3>교과목 수정</h3>
			<form action="sub1UpdateAction.jsp" method="post" name="sub1UpdateForm">
				<table border="1">
					<tr>
						<th>과목 코드</th>
						<td><input type="text" name="c_id" value="<%= dto.getC_id() %>"/></td>
					</tr>
					<tr>
						<th>과목명</th>
						<td><input type="text" name="c_name" value="<%= dto.getC_name() %>"/></td>
					</tr>
					<tr>
						<th>학점</th>
						<td><input type="text" name="credit" value="<%= dto.getCredit() %>"/></td>
					</tr>
					<tr>
						<th>담당강사</th>
						<td>
							<select name="l_id">
								<option value="">담당교수</option>
								<option value="1" <%if(dto.getL_id().equals("1")) out.println("selected"); %>>김교수</option>
								<option value="2" <%if(dto.getL_id().equals("2")) out.println("selected"); %>>이교수</option>
								<option value="3" <%if(dto.getL_id().equals("3")) out.println("selected"); %>>박교수</option>
								<option value="4" <%if(dto.getL_id().equals("4")) out.println("selected"); %>>우교수</option>
								<option value="5" <%if(dto.getL_id().equals("5")) out.println("selected"); %>>최교수</option>
								<option value="6" <%if(dto.getL_id().equals("6")) out.println("selected"); %>>임교수</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>요일</th>
						<td>
							<input type="radio" name="week" value="1" <%if(dto.getWeek() ==1 ) out.println("checked"); %>)/> 월
							<input type="radio" name="week" value="2" <%if(dto.getWeek() ==2 ) out.println("checked"); %>)/> 화
							<input type="radio" name="week" value="3" <%if(dto.getWeek() ==3 ) out.println("checked"); %>)/> 수
							<input type="radio" name="week" value="4" <%if(dto.getWeek() ==4 ) out.println("checked"); %>)/> 목
							<input type="radio" name="week" value="5" <%if(dto.getWeek() ==5 ) out.println("checked"); %>)/> 금
						</td>
					</tr>
					<tr>
						<th>시작 시간</th>
						<%
						String start_hour = "";
						if(dto.getStart_hour() <= 999) start_hour = "0" + dto.getStart_hour();
						else start_hour = "" + dto.getStart_hour();
						%>
						<td><input type="number" name="start_hour" value="<%= start_hour %>"/></td>
					</tr>
					<tr>
						<th>종료시간</th>
						<%
						String end_hour = "";
						if(dto.getEnd_hour() <= 999) end_hour = "0" + dto.getEnd_hour();
						else end_hour = "" + dto.getEnd_hour();
						%>
						<td><input type="number" name="end_hour" value="<%= end_hour %>"/></td>
					</tr>
					<tr align="center">
						<td colspan="2">
							<input type="button" value="수정" onclick="fnUpdateCheck()"/>
							<input type="button" value="취소" onclick="fnUpdateReset()"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</section>
	<jsp:include page="footer.jsp"/>
</body>
</html>