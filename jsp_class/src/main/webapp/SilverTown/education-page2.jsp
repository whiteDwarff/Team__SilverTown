<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
	  import="java.sql.*"
%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String urlLink = request.getParameter("url");
	String lang = request.getParameter("lang");
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	String url = "jdbc:mariadb://localhost:3306/project01_db";
	String user = "munho";
	String password = "1111";
	
	try(Connection con = DriverManager.getConnection(url, user, password)) {
		String sql = "select * from video where category_id = ?";
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, lang);
		
		ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>CodeGrowe</title>
	<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
  <link rel="stylesheet" href="./style/education-page.css?after">
</head>
<body>
 
  <%@include file="./header.jsp" %>
 
	<section id="url-box">
   	<div class="wrap">
        <div class="flex-box">
          <embed id="main-url" src="https://www.youtube.com/embed/<%= urlLink %>?showinfo=0&modestbranding=1&rel=0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></embed>
           <div class="list-box">
              <h2 class="url-title"><%= title %></h2>
              <h4 class="url-content"><%= content %></h4>
              <ul class="list">
   							<div class="scroll-box">
	               <%
	                 while(rs.next()){
	               %>
	               <!-- list -->
	               <li>
	               		<a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
	               		<embed controls=0 src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg" allowfullscreen class="sub-url"></embed>
	               		<div>
	               		  <span class="sub-url-title"><%= rs.getString("title")%></span>
	               		  <span class="sub-url-content"><%= rs.getString("description")%></span>
	               		</div>
	             
	               		</a>
	               </li>
	               <!-- end  -->
	               <% 
	               		} 
									} catch(Exception e) {
										e.printStackTrace();
									}
	               %>
               </div>
               </ul>
                </div>
            </div>
        </div>
    </section>
    
    <%@include file="./footer.jsp" %>
    
<script src="./script/education-page.js"></script>
<script src="./script/header.js?after"></script>
</body>
</html>