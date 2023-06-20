<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// content로 전송되는 parameter 받기
	String content = request.getParameter("content");
	String title = request.getParameter("boardTitleName"); 
	// String id = request.getParameter("boardTitle"); 
	
	BoardDto dto = new BoardDto();
	dto.setUpdate_Content(content);
	dto.setUpdate_Title(title);
	
	BoardDao dao = new BoardDao();
	dao.boardUpdate(dto);
	
%>

<%= request.getParameter("content") %>
<%= request.getParameter("title") %>
<script>
  alert("수정되었습니다.");
	location.href="board_content.jsp?title=<%=title%>";
</script>

