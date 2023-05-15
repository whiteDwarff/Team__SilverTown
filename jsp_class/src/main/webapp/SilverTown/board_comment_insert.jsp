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
        
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("comment_name");
	String content = request.getParameter("comment_content");
	String boardId = request.getParameter("board_Id");
	
	
	

	  InitialContext initCtx = new InitialContext();
	  Context ctx = (Context)initCtx.lookup("java:comp/env");
	  DataSource ds= (DataSource)ctx.lookup("jdbc/project01_db");
	
	String sql = "INSERT INTO COMMENT (author_id, post_id, content) VALUES ((SELECT ID FROM MEMBER WHERE NAME = ?), ?, ?)";
	
	try(Connection con = ds.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
		pstmt.setString(1, name);
		pstmt.setString(2, boardId);
		pstmt.setString(3, content);
		
		int i = pstmt.executeUpdate();
		
		if(i>0){
			%>
			<script>
			alert("댓글이 정상적으로 등록되었습니다.");
			history.back();
			</script>
			
			<%
		}
	}
	
%>