<%--
	작성자 : munhokang
	작성일 : 2023. 5. 11.
	comment : 
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="./style/header.css">
</head>
<body>
<header id="header">
    <div class="header-wrap">
      <h1><a href="index.jsp">CodeGrow</a></h1>
      <nav>
        <a href="header-select.jsp?lang=<%= 1 %>">HTML / CSS</a>
        <a href="header-select.jsp?lang=<%= 2 %>">JavaScript</a>
        <a href="header-select.jsp?lang=<%= 3 %>">DataBase</a>
        <a href="header-select.jsp?lang=<%= 4 %>">JSP</a>
        <a href="header-select.jsp?lang=<%= 5 %>">Spring</a>
        <a href="board.jsp">QnA</a>
      </nav>
      <div class="sub-gnb">
        <img src="./img/search.png" alt="">
        <img src="./img/mypage.png" alt="">
      </div>
    </div>
    <div id="search-box">
      <div class="slide-wrap">
        <form action="search.jsp" method="post">
          <img src="./img/search.png" alt="">
          <input type="text" placeholder="codegrow.com 검색하기" name="search" id="search-input">
        </form>
      </div>
    </div>
    <div id="account-box">
      <div class="slide-wrap">
        <h4>Welcome CodeGrow !</h4>
        <!-- session이 있다면 #login-span은 바꿔야 함 -->
        <%
        	if(session.getAttribute("email") == null) {
        		out.println("<span id='login-span'>저장해둔 항목이 있는지 확인하려면 <a href='login.jsp'>로그인</a>하세요</span>");
        	} else {
        %>
        <span id='login-span'><%= session.getAttribute("name") %>님 환영합니다.</span>
        <% } %>
        <span id="profile">내프로필</span>
        <div class="box-wrap">
          <div class="img-box">
            <img src="./img/list.jpg" alt="">
            <img src="./img/acount.jpg" alt="">
            <img src="./img/login.jpg" alt="">
          </div>
          <div class="label-box">
            <a href="#">관심 목록</a>
            <a href="update.jsp">계정</a>
            <!-- session이 있다면 하단 태그는 로그아웃 버튼으로 변경 -->
          <%    
        	if(session.getAttribute("email") == null) {
        		out.println("<a href='login.jsp'>로그인</a>");
        	} else {
          %>
        		<a href='logout.jsp'>로그아웃</a>
          <% } %>
          </div>
        </div>
      </div>
    </div>
  </header> <!-- header -->
  <!-- <script src="./script/header.js"></script> -->
</body>
</html>