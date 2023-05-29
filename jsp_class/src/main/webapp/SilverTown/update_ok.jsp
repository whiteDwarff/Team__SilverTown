<%@page import="member.MemberDto"%>
<%@page import="member.MemberDao"%>
<%
/*====================================
작성자 : 2023. 5. 25.
작성일 : seohyun
프로그램 기능 :
=====================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%
 request.setCharacterEncoding("utf-8");
 
 String email = request.getParameter("email");
 String name = request.getParameter("name");
 String tel = request.getParameter("tel");
 String newPwd = request.getParameter("newPwd");
 
 MemberDao dao = new MemberDao();
 MemberDto dto = new MemberDto(name, email, newPwd, tel);
 
 dao.memberFunction(dto, "U");
 
 session.invalidate();

 %>
<script type="text/javascript">
alert("수정이 완료되었습니다. 다시 로그인해주세요!");
location.href="login.jsp";
</script> 