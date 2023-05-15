<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>    
    
<%
	request.setCharacterEncoding("utf-8");
	
	String email = request.getParameter("email");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String pwd = request.getParameter("password");
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");

	DataSource ds= (DataSource)ctx.lookup("jdbc/project01_db");

		String sql = "insert into member (name, email, password, phone_number, created_at)  values(?,?,?,?,?)";
	
	try(Connection con = ds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);) {
		
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); // 날짜 및 시간 포맷 지정
		 Date date = new Date(); // 현재 날짜와 시간을 가져옴
		 String currentDateTime = format.format(date); // 날짜 및 시간 포맷에 맞게 변환
		
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setString(3, pwd);
			pstmt.setString(4, tel);
			pstmt.setString(5, currentDateTime);
			
		
	  int i = pstmt.executeUpdate();
	  
	  if(i == 1) {
		  response.sendRedirect("index.jsp");
		 	session.setAttribute("name", name);
		 	session.setAttribute("email", email);
	  }
	} catch (Exception e) {
		e.printStackTrace();
	}

%>
