<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
Sub2DTO dto = new Sub2DTO();
dto.setResist_month(request.getParameter("resist_month"));
dto.setC_name(request.getParameter("c_name"));
dto.setC_no(request.getParameter("c_no"));
dto.setClass_area(request.getParameter("class_area"));
dto.setClass_name(request.getParameter("class_name"));
dto.setTuition(Integer.parseInt(request.getParameter("tuition")));

ProjectDAO dao = new ProjectDAO();
dao.insertSub2(dto);

out.println("<script>location.href='sub2.jsp;'</script>"); //세미콜론 잊지 말기!
%>
