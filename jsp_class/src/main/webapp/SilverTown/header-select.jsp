<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%@page import="java.sql.*"%>
<%@page import="Myeong.Hun.VideoListDao"%>
<%@page import="Myeong.Hun.VideoListDto"%>
<%@page import="java.util.ArrayList"%>
<%
request.setCharacterEncoding("utf-8");

String lang = request.getParameter("lang");


VideoListDao dao = new VideoListDao();
ArrayList<VideoListDto> dtos = dao.list(lang);


%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <title>CodeGrow</title>
   <link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
   <link rel="stylesheet" href="./style/search.css">
   <link rel="stylesheet" href="./style/search-media.css">
</head>
<body>

	<%@include file="./header.jsp" %>

	<script>
		const li = document.querySelectorAll('nav a');
		for(let i=0; i<li.length; i++) {
			if( <%= lang %> != i+1) {
				li[i].style.filter = 'blur(1px)';
			}
		}
	</script>

  <section id="card-box">
    <article class="wrap">
 <%for(VideoListDto dto : dtos){%>
  	 <div class="url-card">
  	 <a href="education-page2.jsp?title=<%=dto.getTitle()%>&content=<%=dto.getDescription()%>&url=<%=dto.getUrl()%>&lang=<%=dto.getCategory_id()%>">
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
  
  <%@include file="./footer.jsp" %>

<script src="./script/header-select.js"></script>
<script src="./script/header.js?after"></script>
</body>
</html>