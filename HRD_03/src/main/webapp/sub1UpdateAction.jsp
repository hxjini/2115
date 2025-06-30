<%@page import="exam.ProjectDAO"%>
<%@page import="exam.Sub1DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Sub1DTO dto = new Sub1DTO();
dto.setTeacher_code(request.getParameter("teacher_code"));
dto.setTeacher_name(request.getParameter("teacher_name"));
dto.setClass_name(request.getParameter("class_name"));
dto.setClass_price(Integer.parseInt(request.getParameter("class_price")));
dto.setTeach_resist_date(request.getParameter("teach_resist_date"));

ProjectDAO dao = new ProjectDAO();
dao.updateSub1(dto);

out.println("<script>location.href='sub1.jsp';</script>");
%>
