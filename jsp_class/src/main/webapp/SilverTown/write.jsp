
<%
/*====================================
작성자 : 2023. 5. 12.
작성일 : seohyun
프로그램 기능 :
=====================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CodeGrow</title>
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="./style/write.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<%@include file="./header.jsp"%>

	<form action="board_insert.jsp" method="post">
		<div id="form-input">
			<input name=title type="text" placeholder="제목" id="title-input">
			<input name=author_name type="text"
				value=<%=session.getAttribute("name") %> readonly
				style="display: none;"></input> <input name="content"
				placeholder="내용" id="content-intpu"></input>
				</div>
				<div id="form-btn">
		<button type="submit" id="submit-button" class="btn btn-success">작성</button>
		<button type="button" class="btn btn-danger" onclick="location.href = 'board.jsp';">취소</button>
		</div>
	</form>

	<%@include file="./footer.jsp"%>

	<script src="./script/header.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>

