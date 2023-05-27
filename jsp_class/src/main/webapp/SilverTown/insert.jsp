<%@page import="Myeong.Hun.LoginDto"%>
<%@page import="Myeong.Hun.LoginDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
    
<%
	request.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String pwd = request.getParameter("password");

	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto();
	
	dto.setEmail(email);
	dto.setName(name);
	dto.setPhone_number(tel);
	dto.setPassword(pwd);
	
	dto = dao.memberFunction(dto, "I");
	
	  
    session.setAttribute("name", dto.getName());
	session.setAttribute("email", dto.getEmail());
	session.setAttribute("password", dto.getPassword());
	session.setAttribute("phone_number", dto.getPhone_number());
	response.sendRedirect("index.jsp");
			
%>
