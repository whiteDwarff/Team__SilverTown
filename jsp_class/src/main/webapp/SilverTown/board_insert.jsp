<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="Myeong.Hun.BoardDao"%>


<%
 request.setCharacterEncoding("utf-8");

   String TITLE = request.getParameter("title");
   String CONTENT = request.getParameter("content");
   String author_name =request.getParameter("author_name");
   BoardDao dao = new BoardDao();
   BoardDto dto = new BoardDto(TITLE, CONTENT, author_name); 

   dao.boardFunction(dto, "I");

   response.sendRedirect("board.jsp");  
%>
