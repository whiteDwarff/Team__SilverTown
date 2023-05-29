
<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Myeong.Hun.BoardDao"%>
<%
/*====================================
작성자 : 2023. 5. 12.
작성일 : seohyun
프로그램 기능 :
=====================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>CodeGrow</title>
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="./style/board.css?after">
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
</head>
<body>

	<%@include file="./header.jsp"%>

	<section id="board-section">
		<div class="board-list">
			<table class="table table-hover" id="foo-table">
			<thead>
				<tr class="post-item">
					<th class="post-title">게시글 제목</th>
					<th class="post-author">작성자</th>
					<th class="post-date">작성일</th>
				</tr>
				</thead>
				<tbody>
				<%
				request.setCharacterEncoding("utf-8");

				BoardDao dao = new BoardDao();
				ArrayList<BoardDto> dtos = dao.boardList();
				for (BoardDto dto : dtos) {
				%>
				
				<tr>
<<<<<<< HEAD
					<td><a href="board_content.jsp?title=<%=dto.getTitle()%>"><%=dto.getTitle()%></a></td>
					<td><%=dto.getAuthor_name()%></td>
					<td><%=dto.getCreated_date()%></td>
=======
<<<<<<< HEAD
					<td><a href="board_content.jsp?title=<%=title%>"><%=title%></a></td>
=======
					<td><a href="board_content.jsp?title=<%=id%>"><%=id%></a></td>
>>>>>>> branch 'hun' of https://github.com/whiteDwarff/Team__SilverTown.git
					<td><%=name%></td>
					<td><%=date%></td>
>>>>>>> branch 'hun' of https://github.com/whiteDwarff/Team__SilverTown.git
				</tr>
				<%
				}
				%>
</tbody>
			</table>
			<script type="text/javascript">
jQuery(function($){ 
	$("#foo-table").DataTable(); 
}); 
</script>
			<%
			if (session.getAttribute("email") != null) {
				out.println("<a id='qna-button' href='write.jsp'>문의하기</a>");
			} else {
				out.println("<a id='qna-button' href='login.jsp'>문의하기</a>");
			}
			%>
		</div>
	</section>

	<%@include file="./footer.jsp"%>
	<script src="./script/header.js"></script>
	<script>
		const li = document.querySelectorAll('nav a');
		const liLast = document.querySelector('nav a:last-child');
		for (let i = 0; i < li.length; i++) {
			li[i].style.filter = 'blur(1px)';
		}
		liLast.style.filter = 'blur(0)';
	</script>
</body>
</html>

