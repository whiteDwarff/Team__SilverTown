<%
%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

<%	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String author_id = (String)session.getAttribute("id");
	
	InitialContext initCtx = new InitialContext();

	Context ctx = (Context)initCtx.lookup("java:comp/env");
	
	DataSource ds= (DataSource)ctx.lookup("jdbc/project01_db");
	
	Connection con = ds.getConnection();

	String sql = "INSERT INTO board(title,content,author_id) VALUES(?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3,author_id);
	
	int i = pstmt.executeUpdate();
	

	
	response.sendRedirect("board.jsp");
%>

