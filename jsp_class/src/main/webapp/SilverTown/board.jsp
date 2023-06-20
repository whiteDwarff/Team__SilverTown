
<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Myeong.Hun.BoardDao"%>
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
</head>
<body>

	<%@include file="./header.jsp"%>

	<section id="board-section">
		<div class="board-list">
			<table class="table table-hover">
				<tr class="post-item">
					<th class="post-title">게시글 제목</th>
					<th class="post-author">작성자</th>
					<th class="post-date">작성일</th>
				</tr>
				<%
				request.setCharacterEncoding("utf-8");

				BoardDao dao = new BoardDao();
				ArrayList<BoardDto> dtos = dao.boardList();
				for (BoardDto dto : dtos) {
				%>
				<tr>
					<td><a href="board_content.jsp?title=<%=dto.getTitle()%>"><%=dto.getTitle()%></a></td>
					<td><%=dto.getAuthor_name()%></td>
					<td><%=dto.getCreated_date()%></td>
				</tr>
				<%
				}
				%>

			</table>
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
		const liLast = document.querySelector('nav a:nth-child(6)');
		for (let i = 0; i < li.length; i++) {
			li[i].style.filter = 'blur(1px)';
		}
		liLast.style.filter = 'blur(0)';
	</script>
</body>
</html>

