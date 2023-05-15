<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="Myeong.Hun.BoardDao"%>
<%
/*
=============================================
작성자 : 박훈명
작성일 : 2023. 5. 13.
프로그램 기능 :
=============================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String update_Title = request.getParameter("update_Title");
	String update_Content = request.getParameter("update_Content");
	String title = request.getParameter("title");
	
	
	//out.println(title + update_Title + update_Content);
	
	BoardDto dto = new BoardDto();
	dto.setUpdate_Content(update_Content);
	dto.setUpdate_Title(update_Title);
	dto.setTitle(title);
	
	new BoardDao().boardUpdate(dto);
%>

<script>
	let ans = alert("변경되었습니다!");
	if (!ans){
		location.href = "board.jsp";
	}
</script>