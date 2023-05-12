<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DBCP-Test</title>
</head>
<body>
	<% 
	InitialContext initCtx = new InitialContext();
	
	Context ctx = (Context)initCtx.lookup("java:comp/env");
	
	DataSource ds = (DataSource)ctx.lookup("jdbc/munho");
	
	Connection con = ds.getConnection();
	
	out.println("연결성공");
	
	String sql = "select * from member";
	
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		String id = rs.getString("id");
		String name = rs.getString("name");
		String pwd = rs.getString("pwd");
	%>
	<p><%= id %></p>
	<p><%= name %></p>
	<p><%= pwd %></p>
	<% } 
	rs.close();
	stmt.close();
	con.close();
	%>
</body>
</html>