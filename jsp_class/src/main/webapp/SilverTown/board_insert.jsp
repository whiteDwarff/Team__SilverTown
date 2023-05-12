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
	
	DataSource ds= (DataSource)ctx.lookup("jdbc/project");
	
	Connection con = ds.getConnection();

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "INSERT INTO board(title,content,author_id) VALUES(?,?,?)";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setString(3,author_id);
	
	//4. SQL 실행
	int i = pstmt.executeUpdate();
	

	
	response.sendRedirect("board.jsp");
%>

