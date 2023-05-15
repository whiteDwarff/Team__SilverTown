
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
<%
request.setCharacterEncoding("utf-8");

InitialContext initCtx = new InitialContext();

Context ctx = (Context) initCtx.lookup("java:comp/env");

DataSource ds = (DataSource) ctx.lookup("jdbc/project");

//2. 연결 객체 생성
try (Connection con = ds.getConnection(); Statement st = con.createStatement();) {

	//3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
	String sql = "SELECT board.*, DATE(board.created_at) as created_date, member.name as author_name FROM board INNER JOIN member ON board.author_id = member.id;";

	//4. SQL 실행
	ResultSet rs = st.executeQuery(sql);
%>

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
				//5. 결과집합 처리 
				while (rs.next()) {
					String id = rs.getString("title");
					String name = rs.getString("author_name");
					String pwd = rs.getString("created_date");
				%>
				<tr>
					<td><a href="board_content.jsp?title=<%=id%>"><%=id%></a></td>
					<td><%=name%></td>
					<td><%=pwd%></td>
				</tr>
				<%
				}
				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>
			<a id="qna-button" href="border_content.jsp">문의하기</a>
		</div>
	</section>

	<%@include file="./footer.jsp"%>
	<script src="./script/header.js"></script>
</body>
</html>

