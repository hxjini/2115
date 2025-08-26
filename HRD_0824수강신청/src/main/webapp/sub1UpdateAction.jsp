<%@page import="exam.ProjectDAO"%>
<%@page import="exam.Sub1UpdateDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Sub1UpdateDTO dto = new Sub1UpdateDTO();
dto.setC_id(request.getParameter("c_id"));
dto.setC_name(request.getParameter("c_name"));
dto.setCredit(Integer.parseInt(request.getParameter("credit")));
dto.setL_id(request.getParameter("l_id"));
dto.setWeek(Integer.parseInt(request.getParameter("week")));
dto.setStart_hour(Integer.parseInt(request.getParameter("start_hour")));
dto.setEnd_hour(Integer.parseInt(request.getParameter("end_hour")));

ProjectDAO dao = new ProjectDAO();
dao.updateSub1(dto);

out.println("<script>location.href='sub1.jsp';</script>");
%>
