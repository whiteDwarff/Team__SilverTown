<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="Myeong.Hun.VideoListDao"%>
<%@page import="Myeong.Hun.VideoListDto"%>
<%@page import="java.util.ArrayList"%>

<%
 request.setCharacterEncoding("utf-8");
 String title = request.getParameter("search"); // 입력 폼에서 전달된 검색어 받아오기

 VideoListDao dao = new VideoListDao();
 ArrayList<VideoListDto> dtos = dao.search(title);
%>
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
    <span class="h2-title">검색결과 for : <b><%=request.getParameter("search") %> </b></span>
  </section>
  
  <section id="card-box">
    <article class="wrap">
 <%for(VideoListDto dto : dtos){%>
  	 <div class="url-card">
  	 <a href="education-page.jsp?title=<%=dto.getTitle()%>&content=<%=dto.getDescription()%>&url=<%=dto.getUrl()%>&lang=<%=dto.getCategory_id()%>">
     <!-- ######### java 코드 삽입 영역#######-->
     <!-- title -->
     <span class="url-title"><%=dto.getTitle()%></span>
     <!-- content -->
     <span class="url-content"><%=dto.getDescription()%></span>
     <!-- url -->
     <embed controls=0 src="https://img.youtube.com/vi/<%=dto.getUrl()%>/maxresdefault.jpg" allowfullscreen></embed>
   </a>
 </div>
<%} %>
    </article>
  </section> 
  
   <a href="#header"><img src="./img/swipe.png" id="swipe-btn"></a>
    
   <%@include file="./footer.jsp" %>
   
  <script src="./script/search.js?after"></script>
  <script src="./script/header.js?after"></script>
</body>

</html>