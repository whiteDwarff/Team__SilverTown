<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	String email = request.getParameter("email");
	String pwd = request.getParameter("password");
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	String url = "jdbc:mariadb://localhost:3306/project01_db";
	String user = "munho";
	String password = "1111";
	
	try(Connection con = DriverManager.getConnection(url, user, password)) {
		
		String sql = "select * from member where email=? and password=?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.setString(2, pwd);
		
		ResultSet  rs = pstmt.executeQuery();
		
		if(rs.next()) {
			String name = rs.getString("name");
			session.setAttribute("email", email); 
			session.setAttribute("name", name);
			response.sendRedirect("index.jsp");
		} else {
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
<%
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
%>
<%= email %>
<%= password %>
</body>
</html>