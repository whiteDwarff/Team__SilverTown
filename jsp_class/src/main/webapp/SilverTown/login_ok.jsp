<%@page import="member.MemberDto"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	
	MemberDao dao = new MemberDao();
	MemberDto dto = dao.loginDao(email, pwd);
	
	if(email.equals(dto.getEmail()) && pwd.equals(dto.getPassword())) {
		session.setAttribute("email", dto.getEmail());
		session.setAttribute("password", dto.getPassword());
		session.setAttribute("name", dto.getName());
		session.setAttribute("phone", dto.getPhone());
		response.sendRedirect("index.jsp");
	} else { %>
	 <script>
		  if(confirm("아이디 / 비밀번호가 일치하지 않습니다.")) location.href="login.jsp";
		  else history.back();
	 </script>
<% } %>
</body>
</html>