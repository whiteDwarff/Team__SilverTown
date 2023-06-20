<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

<%
   request.setCharacterEncoding("utf-8");

   String title = request.getParameter("title");
   String content = request.getParameter("content");
   String author_name =request.getParameter("author_name");


	BoardDto dto = new BoardDto();   
	BoardDao dao = new BoardDao();
	dto.setTitle(title);
	dto.setContent(content);
	
	dao.adminBoardInsert(dto);
%>
<script>
/* 	alert('게시글이 등록되었습니다.');
	location.href="board.jsp"; */

</script>
