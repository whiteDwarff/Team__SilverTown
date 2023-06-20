<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="Myeong.Hun.BoardDao"%>

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
	String name = (String) session.getAttribute("name");
	String content = request.getParameter("comment_content");
	String boardId = request.getParameter("board_Id");
	String title = request.getParameter("title");
	out.println(name + content + boardId + title);
	if (name == null || name.length() < 1) {
		%>
<script>
	alert("로그인을 먼저 해주세요.");
	location.href = 'login.jsp';
</script>
<%}
	else {
BoardDao dao = new BoardDao(); 
BoardDto dto = new BoardDto(boardId,name, content); 
dao.commentFunction(dto, "I");



	}
%>
<script>
location.href = 'board_content.jsp?title=<%=title%>'
</script> 