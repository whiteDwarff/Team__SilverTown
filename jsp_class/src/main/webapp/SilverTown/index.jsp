<%@page import="java.util.ArrayList"%>
<%@page import="Myeong.Hun.VideoListDao"%>
<%@page import="Myeong.Hun.VideoListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CodeGrow</title>
  <link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
  <link rel="stylesheet" href="./style/index.css?after"> 
  <link rel="stylesheet" href="./style/index-media.css"> 
</head>

<body>
  <%@include file="./header.jsp" %>
 
  <section id="white-bg">
    <span>CodeGrow는 회원가입 후 무료로 이용하실 수 있습니다.</span>
  </section>

  <section>
    <div class="section-wrap">
      <article id="dev-list">
        <h2>The Only RoadMap You Need<br><span id="h2-span">차근차근 따라만가면 완성되는 개발자의 꿈.</span></h2>
        <div class="dev-list-wrap">
          <div class="thum">
            <img src="./img/html.png" alt="">
            <span>HTML</span>
          </div>
          <div class="thum">
            <img src="./img/css.png" alt="">
            <span>CSS</span>
          </div>
          <div class="thum">
            <img src="./img/script.png" alt="">
            <span>JavaScript</span>
          </div>
          <div class="thum">
            <img src="./img/database.png" alt="">
            <span>DataBase</span>
          </div>
          <div class="thum">
            <img src="./img/java.png" alt="">
            <span>java</span>
          </div>
          <div class="thum">
            <img src="./img/jsp.png" alt="">
            <span>JSP</span>
          </div>
          <div class="thum">
            <img src="./img/spring.png" alt="">
            <span>Spring</span>
          </div>
        </div>
      </article>
  </section>
  <section>
    <article id="html" class="relative">
      <h2 class="h2-title">웹클라이언트의 시작. <span class="h2-title-gray">HTML/CSS</span></h2>
      <div class="scroll-box">
      	 <img src="./img/scroll-left.png" class="scroll-img left hidden">
         <img src="./img/scroll-rt.png" class="scroll-img right">
        <div class="card-wrap">
        <div class="url-card background-none"></div>
				<%
				request.setCharacterEncoding("utf-8");

				VideoListDao vldao = new VideoListDao();
				String categoryId = "1";
				ArrayList<VideoListDto> videoList = vldao.list(categoryId);
				for (VideoListDto vldto : videoList) {
				%>
  <div class="url-card">
    <a href="education-page.jsp?title=<%=vldto.getTitle()%>&content=<%=vldto.getDescription()%>&url=<%=vldto.getUrl()%>&lang=<%=vldto.getCategory_id()%>">
      <!-- ######### java 코드 삽입 영역#######-->
      <!-- title -->
      <span class="url-title"><%= vldto.getTitle() %></span>
      <!-- content -->
      <span class="url-content"><%= vldto.getDescription() %></span>
      <!-- url -->
      <embed controls=0 src="https://img.youtube.com/vi/<%= vldto.getUrl() %>/maxresdefault.jpg" allowfullscreen></embed>
    </a>
  </div>
 <%
						}
%>
 
        </div>
      </div>
    </article><!--  html -->
  </section> 
  <section>
    <article id="script" class="relative">
      <h2 class="h2-title">동적인 웹페이지를 구현.<span class="h2-title-gray"> JavaScript</span></h2>
      <div class="scroll-box">
      	<img src="./img/scroll-left.png" class="scroll-img left hidden">	
        <img src="./img/scroll-rt.png" class="scroll-img right">
        <div class="card-wrap">
        <div class="url-card background-none"></div>
         <%
			request.setCharacterEncoding("utf-8");

			VideoListDao vldao2 = new VideoListDao();
			String categoryId2 = "2";
			ArrayList<VideoListDto> videoList2 = vldao.list(categoryId2);
			for (VideoListDto vldto2 : videoList2) {
				%>
  <div class="url-card">
    <a href="education-page.jsp?title=<%=vldto2.getTitle()%>&content=<%=vldto2.getDescription()%>&url=<%=vldto2.getUrl()%>&lang=<%=vldto2.getCategory_id()%>">
      <!-- ######### java 코드 삽입 영역#######-->
      <!-- title -->
      <span class="url-title"><%= vldto2.getTitle() %></span>
      <!-- content -->
      <span class="url-content"><%= vldto2.getDescription() %></span>
      <!-- url -->
      <embed controls=0 src="https://img.youtube.com/vi/<%= vldto2.getUrl() %>/maxresdefault.jpg" allowfullscreen></embed>
    </a>
  </div>
		  <%
					}
		  %>
        </div>
      </div>
      
    </article> <!-- script  -->
    </section>
    <section>
    <article id="database"  class="relative">
      <h2 class="h2-title">관계형 데이터 베이스의 시작.<span class="h2-title-gray"> DataBase</span></h2>
      <div class="scroll-box">
      	<img src="./img/scroll-left.png" class="scroll-img left hidden">
        <img src="./img/scroll-rt.png" class="scroll-img right">
        <div class="card-wrap">
        <div class="url-card background-none"></div>
         <%
			request.setCharacterEncoding("utf-8");

			VideoListDao vldao3 = new VideoListDao();
			String categoryId3 = "3";
			ArrayList<VideoListDto> videoList3 = vldao.list(categoryId3);
			for (VideoListDto vldto3 : videoList3) {
				%>
  <div class="url-card">
    <a href="education-page.jsp?title=<%=vldto3.getTitle()%>&content=<%=vldto3.getDescription()%>&url=<%=vldto3.getUrl()%>&lang=<%=vldto3.getCategory_id()%>">
      <!-- ######### java 코드 삽입 영역#######-->
      <!-- title -->
      <span class="url-title"><%= vldto3.getTitle() %></span>
      <!-- content -->
      <span class="url-content"><%= vldto3.getDescription() %></span>
      <!-- url -->
      <embed controls=0 src="https://img.youtube.com/vi/<%= vldto3.getUrl() %>/maxresdefault.jpg" allowfullscreen></embed>
    </a>
  </div>
		  <%}%>
        </div>
      </div>
    </article> <!-- database  -->
    </section>
    <section>
    <article id="jsp" class="relative">
      <h2 class="h2-title">웹 애플리케션 개발의 기초.<span class="h2-title-gray"> JSP</span></h2>
      <div class="scroll-box">
      	<img src="./img/scroll-left.png" class="scroll-img left hidden">
        <img src="./img/scroll-rt.png" class="scroll-img right">
        <div class="card-wrap">
        <div class="url-card background-none"></div>
         <%
			request.setCharacterEncoding("utf-8");

			VideoListDao vldao4 = new VideoListDao();
			String categoryId4 = "4";
			ArrayList<VideoListDto> videoList4 = vldao.list(categoryId4);
			for (VideoListDto vldto4 : videoList4) {
				%>
  <div class="url-card">
    <a href="education-page.jsp?title=<%=vldto4.getTitle()%>&content=<%=vldto4.getDescription()%>&url=<%=vldto4.getUrl()%>&lang=<%=vldto4.getCategory_id()%>">
      <!-- ######### java 코드 삽입 영역#######-->
      <!-- title -->
      <span class="url-title"><%= vldto4.getTitle() %></span>
      <!-- content -->
      <span class="url-content"><%= vldto4.getDescription() %></span>
      <!-- url -->
      <embed controls=0 src="https://img.youtube.com/vi/<%= vldto4.getUrl() %>/maxresdefault.jpg" allowfullscreen></embed>
    </a>
  </div>
		  <%}%>
        </div>
      </div>
    </article> <!-- jsp  -->
    </section>
    <section>
    <article id="spring" class="relative">
      <h2 class="h2-title">Java를 기반으로 한 오픈 소스 프레임워크.<span class="h2-title-gray"> Spring</span></h2>
      <div class="scroll-box">
      	 <img src="./img/scroll-left.png" class="scroll-img left hidden">
         <img src="./img/scroll-rt.png" class="scroll-img right">
        <div class="card-wrap">
        <div class="url-card background-none"></div>
         <%
			request.setCharacterEncoding("utf-8");

			VideoListDao vldao5 = new VideoListDao();
			String categoryId5 = "5";
			ArrayList<VideoListDto> videoList5 = vldao.list(categoryId5);
			for (VideoListDto vldto5 : videoList5) {
				%>
  <div class="url-card">
    <a href="education-page.jsp?title=<%=vldto5.getTitle()%>&content=<%=vldto5.getDescription()%>&url=<%=vldto5.getUrl()%>&lang=<%=vldto5.getCategory_id()%>">
      <!-- ######### java 코드 삽입 영역#######-->
      <!-- title -->
      <span class="url-title"><%= vldto5.getTitle() %></span>
      <!-- content -->
      <span class="url-content"><%= vldto5.getDescription() %></span>
      <!-- url -->
      <embed controls=0 src="https://img.youtube.com/vi/<%= vldto5.getUrl() %>/maxresdefault.jpg" allowfullscreen></embed>
    </a>
  </div>
		  <%}%>
        </div>
      </div>
    </article> <!-- spring  -->
  </section>
  
  <a href="#header"><img src="./img/swipe.png" id="swipe-btn"></a>
  
  <%@include file="./footer.jsp" %>
  
  <script src="./script/index.js?after"></script>
   <script src="./script/header.js"></script>
</body>

</html>