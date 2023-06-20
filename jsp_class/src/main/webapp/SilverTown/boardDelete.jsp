<%
/*
=============================================
작성자 : 박훈명
작성일 : 2023. 5. 13.
프로그램 기능 :
1...
2...
=============================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Myeong.Hun.BoardDao"%>
<%
	request.setCharacterEncoding("utf-8");

	String boardId = request.getParameter("boardId");
	
	new BoardDao().boardDelete(boardId);
%>

<script>
	alert("삭제되었습니다.");
	if (<%= session.getAttribute("name").equals("admin") %>){
		location.href='news.jsp';
	} else {
		location.href='board.jsp';
	}
</script>