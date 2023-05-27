<%@page import="Myeong.Hun.VideoListDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Myeong.Hun.VideoListDao"%>
<%
/*====================================
작성자 : 2023. 5. 25.
작성일 : seohyun
프로그램 기능 :
=====================================*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CodeGrow</title>
  <link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
  <link rel="stylesheet" href="./style/search.css?after">
  <link rel="stylesheet" href="./style/search-media.css">
</head>

<body>

  
  <%@include file="./header.jsp" %>
  
  <section id="white-bg">
    <span class="h2-title"><%=session.getAttribute("name") %> 님의 관심 목록 </span>
  </section>
  
  <section id="card-box">
    <article class="wrap">
		<%
			request.setCharacterEncoding("utf-8");

		
			VideoListDao vldao = new VideoListDao();
			ArrayList<String> list = (ArrayList) session.getAttribute("videoList");
			
			
			if(list != null) {
				for (String title : list) {
					VideoListDto dto = vldao.getVideoByTitle(title);
		%>
   <div class="url-card">
   	 <a href="education-page.jsp?title=<%=dto.getTitle()%>&content=<%=dto.getDescription()%>&url=<%=dto.getUrl()%>&lang=<%=dto.getCategory_id()%>">
     <!-- ######### java 코드 삽입 영역#######-->
     <!-- title -->
     <span class="url-title"><%=dto.getTitle()%></span>
     <!-- content -->
     <span class="url-content"><%= dto.getDescription() %></span>
     <!-- url -->
     <embed controls=0 src="https://img.youtube.com/vi/<%= dto.getUrl() %>/maxresdefault.jpg" allowfullscreen></embed>
   </a>
 </div>
	 <% } }	%>
    </article>
  </section> 
  
   <a href="#header"><img src="./img/swipe.png" id="swipe-btn"></a>
    
   <%@include file="./footer.jsp" %>
   
  <script src="./script/search.js?after"></script>
  <script src="./script/header.js?after"></script>
</body>

</html>