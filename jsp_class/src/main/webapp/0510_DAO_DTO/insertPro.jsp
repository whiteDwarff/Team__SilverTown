<%@page import="dit.cs.LoginDto"%>
<%@page import="dit.cs.LoginDao"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>
<%	
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	/* LoginDto dto = new LoginDto(id, name, pwd); */
	LoginDto dto = new LoginDto(id, name, pwd);
/* 	dto.setId(id);
	dto.setName(name);
	dto.setPwd(pwd); */
	
	LoginDao dao = new LoginDao();
	dao.insertLogin(dto);
	
	response.sendRedirect("list.jsp");
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>

</body>
</html>