<%@page import="exam.ProjectDAO"%>
<%@page import="exam.Sub2DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Sub2DTO dto = new Sub2DTO();
dto.setStuid(request.getParameter("stuid"));
dto.setSubcode(request.getParameter("subcode"));
dto.setMidscore(Integer.parseInt(request.getParameter("midscore")));
dto.setFinalscore(Integer.parseInt(request.getParameter("finalscore")));
dto.setAttend(Integer.parseInt(request.getParameter("attend")));
dto.setReport(Integer.parseInt(request.getParameter("report")));
dto.setEtc(Integer.parseInt(request.getParameter("etc")));

ProjectDAO dao = new ProjectDAO();
dao.insertSub2(dto);

out.println("<script>location.href='sub2.jsp';</script>");
%>
