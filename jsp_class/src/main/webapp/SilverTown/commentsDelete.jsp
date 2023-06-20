<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String content = request.getParameter("content");
	String id = request.getParameter("boardId");
	String title = request.getParameter("title");
	
	BoardDto dto = new BoardDto();
	BoardDao dao = new BoardDao();
	
	dto.setContent(content);
	dto.setId(id);
	
	dao.commentFunction(dto, "D");

%>
<script>
alert('삭제되었습니다.');
location.href="board_content.jsp?title=<%= title %>"
</script>