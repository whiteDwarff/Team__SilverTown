<%@page import="member.MemberDao"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %> 
<%
	request.setCharacterEncoding("utf-8");

	MemberDao dao = new MemberDao();
	dao.memberFunction(
			request.getParameter("email"),
			request.getParameter("name"),
			request.getParameter("password"),
			request.getParameter("tel"),"I");
	
	session.setAttribute("email", request.getParameter("email"));
	session.setAttribute("password", request.getParameter("pwd"));
	session.setAttribute("name", request.getParameter("name"));
	session.setAttribute("phone", request.getParameter("tel"));
	
	response.sendRedirect("index.jsp");
%>
