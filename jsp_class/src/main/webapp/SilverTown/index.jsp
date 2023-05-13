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
        Class.forName("org.mariadb.jdbc.Driver");
		String url = "jdbc:mariadb://localhost:3307/project01_db";
		String user = "hunmyeong";
		String password = "8524";
		String sql = "select * from video where category_id = ?";
					
					try(Connection con = DriverManager.getConnection(url, user, password)) {
				
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "1");
						
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){
				%>
          <div class="url-card">
            <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
              <!-- ######### java 코드 삽입 영역#######-->
              <!-- title -->
              <span class="url-title"><%= rs.getString("title")%></span>
              <!-- content -->
              <span class="url-content"><%= rs.getString("description") %></span>
              <!-- url -->
              <embed controls=0 src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg" allowfullscreen></embed>
            </a>
          </div>
 <%
			}
		} catch(Exception e) {
			e.printStackTrace();
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
					try(Connection con = DriverManager.getConnection(url, user, password)) {
				
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "2");
						
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){
				%>
          <div class="url-card">
            <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
              <!-- ######### java 코드 삽입 영역#######-->
              <!-- title -->
              <span class="url-title"><%= rs.getString("title")%></span>
              <!-- content -->
              <span class="url-content"><%= rs.getString("description") %></span>
              <!-- url -->
              <embed controls=0 src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg" allowfullscreen></embed>
            </a>
          </div>
		  <%
					}
				} catch(Exception e) {
					e.printStackTrace();
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
					try(Connection con = DriverManager.getConnection(url, user, password)) {
				
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "3");
						
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){
				%>
          <div class="url-card">
           <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
              <!-- ######### java 코드 삽입 영역#######-->
              <!-- title -->
              <span class="url-title"><%= rs.getString("title")%></span>
              <!-- content -->
              <span class="url-content"><%= rs.getString("description") %></span>
              <!-- url -->
              <embed controls=0 src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg" allowfullscreen></embed>
            </a>
          </div>
		  <%
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
		  %>
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
					try(Connection con = DriverManager.getConnection(url, user, password)) {
				
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "4");
						
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){
				%>
          <div class="url-card">
            <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
              <!-- ######### java 코드 삽입 영역#######-->
              <!-- title -->
              <span class="url-title"><%= rs.getString("title")%></span>
              <!-- content -->
              <span class="url-content"><%= rs.getString("description") %></span>
              <!-- url -->
              <embed controls=0 src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg" allowfullscreen></embed>
            </a>
          </div>
		  <%
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
		  %>
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
					try(Connection con = DriverManager.getConnection(url, user, password)) {
				
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, "5");
						
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){
				%>
          <div class="url-card">
            <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
              <!-- ######### java 코드 삽입 영역#######-->
              <!-- title -->
              <span class="url-title"><%= rs.getString("title")%></span>
              <!-- content -->
              <span class="url-content"><%= rs.getString("description") %></span>
              <!-- url -->
              <embed controls=0 src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg" allowfullscreen></embed>
            </a>
          </div>
		  <%
					}
				} catch(Exception e) {
					e.printStackTrace();
				}
		  %>
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