<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%
	request.setCharacterEncoding("utf-8");
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
			if( <%= lang %> == i+1) {
				li[i].style.borderBottom = "2px solid orange";
				li[i].style.paddingBottom = "5px";
			}
		}
	</script>

  <section id="card-box">
    <article class="wrap">
  	<%
		while(rs.next()) {
		%>
  	 <div class="url-card">
   	 <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= lang %>">
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
    </article>
  </section> 
  
  <%@include file="./footer.jsp" %>

<script src="./script/header-select.js"></script>
<script src="./script/header.js?after"></script>
</body>
</html>