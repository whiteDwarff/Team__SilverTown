<%@page import="Myeong.Hun.LoginDto"%>
<%@page import="Myeong.Hun.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	
	
	LoginDao dao = new LoginDao();
	LoginDto dto = new LoginDto();
	
	dto.setEmail(email);
	dto.setPassword(pwd);
	
	dto = dao.memberFunction(dto, "L");
	
	if(dto.getName() != null){
		session.setAttribute("name", dto.getName());
		session.setAttribute("email", dto.getEmail());
		session.setAttribute("password", dto.getPassword());
		session.setAttribute("phone_number", dto.getPhone_number());
		session.setAttribute("created_at", dto.getCreated_at());
		response.sendRedirect("index.jsp");
	}else{
		%>
		<!DOCTYPE html>
		<html>
		<head>
			<meta charset="UTF-8">
			<title>Insert title here</title>
		</head>
		<body>
			<script>
			  if(confirm("아이디 / 비밀번호를 다시 입력하세요.")) {
					location.href="login.jsp";
				} else {
					history.back();
				} 
			</script>
		</body>
		</html>
				<%
				}
		%>