<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="Myeong.Hun.BoardDto"%>
<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	// content로 전송되는 parameter 받기
	String content = request.getParameter("content");
	String title = request.getParameter("title"); 
	
	BoardDto dto = new BoardDto();
	dto.setUpdate_Content(content);
	dto.setUpdate_Title(title);
	
	BoardDao dao = new BoardDao();
	dao.boardUpdate(dto);
	
/* 	response.sendRedirect("board_content.jsp"); */
%>


<%= request.getParameter("content") %>
<%= request.getParameter("title") %>
<script>
	alert("수정되었습니다.");
	location.href="board.jsp";
</script>

=======
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
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	
	BoardDto dto = new BoardDto();
	BoardDao dao = new BoardDao();
	
	dto = dao.boardView(title);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<form action="boardUpdatePro.jsp" method="post">
		<div>
			<label for="title">제목:</label>
			<input type="text" id="title" name="update_Title" value="<%=dto.getTitle()%>">
		</div>
		<div>
			<label for="content">내용:</label>
			<input type="text" id="content"name="update_Content" value="<%=dto.getContent()%>">
		</div>
			<!-- 나중에 세션으로 바꾸기! -->
			<input type="text" name="title" value="<%=title%>" style="display: none;">
		<input type="submit" value="수정하기">
		</form>
</body>
</html>
>>>>>>> branch 'hun' of https://github.com/whiteDwarff/Team__SilverTown.git
