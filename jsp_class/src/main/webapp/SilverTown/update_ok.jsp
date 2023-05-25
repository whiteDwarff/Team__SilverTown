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
 String password = request.getParameter("password");
 
 MemberDao dao = new MemberDao();
 MemberDto dto = new MemberDto(name, email, password, tel);
 
 dao.memberFunction(dto, "U");
 
 

 %>
<script type="text/javascript">
alert("수정완료!");
location.href="index.jsp";
</script> 