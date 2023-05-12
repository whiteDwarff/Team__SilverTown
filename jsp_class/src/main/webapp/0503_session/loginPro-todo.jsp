<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import ="java.sql.*" %>

<%
	// 
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	
		InitialContext initCtx = new InitialContext();
		
		Context ctx = (Context)initCtx.lookup("java:comp/env");
		
		DataSource ds = (DataSource)ctx.lookup("jdbc/munho");
		
	  /* Connection con = ds.getConnection(); */
	
	try(Connection con = ds.getConnection()){
		
		String sql = "select id, pwd from member where id=? and pwd=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next()) {
			session.setAttribute("id", id); 
			session.setAttribute("password", pwd); 
			response.sendRedirect("welcome-todo.jsp");
		} else {
%>
<script>
	if(confirm("존재하지 않는 사용자입니다.")) {
		location.href="insertForm.jsp";
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