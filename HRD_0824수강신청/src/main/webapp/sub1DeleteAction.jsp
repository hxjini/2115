<%@page import="exam.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String c_id = request.getParameter("c_id");

ProjectDAO dao = new ProjectDAO();
dao.deleteSub1(c_id);

out.println("<script>location.href='sub1.jsp';</script>");
%>
