<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%
 request.setCharacterEncoding("utf-8");
 String search = request.getParameter("search"); // 입력 폼에서 전달된 검색어 받아오기

  // JDBC 드라이버 로드 및 DB 연결
 Class.forName("org.mariadb.jdbc.Driver");
 String url = "jdbc:mariadb://localhost:3306/project01_db";
 String user = "munho";
 String password = "1111";

 try(Connection con = DriverManager.getConnection(url,user,password)){

  // SQL 문 실행하여 결과값 가져오기
  String sql = "SELECT * FROM video WHERE title LIKE ?";
  PreparedStatement pstmt = con.prepareStatement(sql);
  pstmt.setString(1, "%" + search + "%"); // LIKE 연산자 사용하여 검색어와 일치하는 데이터 조회
  ResultSet rs = pstmt.executeQuery();
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
		<%
	  // 조회된 데이터 출력하기
	  while (rs.next()) {
    %>
   <div class="url-card">
   	 <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%=rs.getString("category_id")%>">
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
		}catch(Exception e){
			e.printStackTrace();
		}
	%>
    </article>
  </section> 
  
   <a href="#header"><img src="./img/swipe.png" id="swipe-btn"></a>
    
   <%@include file="./footer.jsp" %>
   
  <script src="./script/search.js?after"></script>
  <script src="./script/header.js?after"></script>
</body>

</html>