<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");


String updateContent = request.getParameter("content");   //수정 내용
String content = request.getParameter("title");   //수정 전
String boardTitle = request.getParameter("boardTitle");
String boardTitleName = request.getParameter("boardTitleName");

BoardDto dto = new BoardDto();
dto.setUpdate_Content(updateContent);
dto.setContent(content);
dto.setTitle(boardTitle);


BoardDao dao = new BoardDao();
dao.commentFunction(dto, "U");

out.println(updateContent);
out.println(content);
out.println(boardTitle);
out.println(boardTitleName);
%>
<script>
	alert("수정되었습니다.");
	location.href="board_content.jsp?title=<%=boardTitleName%>";

</script>
