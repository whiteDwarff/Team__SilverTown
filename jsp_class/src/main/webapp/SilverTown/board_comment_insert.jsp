<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = (String) session.getAttribute("name");
	String content = request.getParameter("comment_content");
	String boardId = request.getParameter("board_Id");
	String title = request.getParameter("title");

	BoardDto dto = new BoardDto();
	BoardDao dao = new BoardDao();
	
	dto.setComment_content(content);
	dto.setAuthor_name(name);
	dto.setComment_post_id(boardId);
	
	dao.commentFunction(dto, "I");
%>
<script>
	alert('댓글이 등록되었습니다.')
	location.href = 'board_content.jsp?title=<%= title %>';
</script>