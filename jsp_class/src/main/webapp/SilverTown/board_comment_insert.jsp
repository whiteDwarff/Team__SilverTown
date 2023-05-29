<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%
/*
=============================================
작성자 : 박훈명
작성일 : 2023. 5. 13.
프로그램 기능 : 댓글 작성
=============================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<<<<<<< HEAD
        
        
<%
	request.setCharacterEncoding("utf-8");
	String name = (String) session.getAttribute("name");
	String comment_content = request.getParameter("comment_content");
	int boardId = Integer.parseInt(request.getParameter("board_Id"));
	String title = request.getParameter("title");
	
	if (name == null || name.length() < 1) {
		%>
		<script>
			alert("로그인을 먼저 해주세요.");
			location.href = 'login.jsp';
		</script>
	<%}
	else {%>
	

	
	
<%--
	  InitialContext initCtx = new InitialContext();
	  Context ctx = (Context)initCtx.lookup("java:comp/env");
	  DataSource ds= (DataSource)ctx.lookup("jdbc/project01_db");
=======
    
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("comment_name");
	String content = request.getParameter("comment_content");
	String boardId = request.getParameter("board_Id");
	
	
	
	  InitialContext initCtx = new InitialContext();
	  Context ctx = (Context)initCtx.lookup("java:comp/env");
	  DataSource ds= (DataSource)ctx.lookup("jdbc/project");
>>>>>>> branch 'hun' of https://github.com/whiteDwarff/Team__SilverTown.git
	
	String sql = "INSERT INTO COMMENT (author_id, post_id, content) VALUES ((SELECT ID FROM MEMBER WHERE NAME = ?), ?, ?)";
	
	try(Connection con = ds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
		pstmt.setString(1, name);
		pstmt.setString(2, boardId);
		pstmt.setString(3, content);
		
		int i = pstmt.executeUpdate();
		--%>
		<%
	BoardDto dto = new BoardDto();
		dto.setName(name);
		dto.setPost_id(boardId);
		dto.setComment_content(comment_content);
	BoardDao dao = new BoardDao();
	dao.commentFunction(dto, "I");
		
		%>
			<script>
			alert("댓글이 정상적으로 등록되었습니다.");
			location.href = 'board_content.jsp?title=<%=title %>';
			</script>
<%}%>