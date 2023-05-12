<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CodeGrow</title>
  <link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
  <link rel="stylesheet" href="./style/index.css">
</head>

<body>
  <header id="header">
    <div class="header-wrap">
      <h1><a href="./index.jsp">CodeGrow</a></h1>
      <nav>
        <a href="#html">HTML / CSS</a>
        <a href="#script">JavaScript</a>
        <a href="#database">DataBase</a>
        <a href="#jsp">JSP</a>
        <a href="#spring">Spring</a>
      </nav>
      <div class="sub-gnb">
        <img src="./img/search.png" alt="">
        <img src="./img/mypage.png" alt="">
      </div>
    </div>
    <div id="search-box">
      <div class="slide-wrap">
        <form action="search.jsp" method="get">
          <img src="./img/search.png" alt="">
          <input type="text" name=search placeholder="codegrow.com 검색하기">
          <button style="display:none" type="submit">검색</button>
        </form>
      </div>
    </div>
    <section>
    <article id="html" class="relative">
      <h2 class="h2-title">검색결과<span class="h2-title-gray"> for : <%=request.getParameter("search") %> </span></h2>
      <div class="scroll-box">
      	 <img src="./img/scroll-left.png" class="scroll-img left hidden">
         <img src="./img/scroll-rt.png" class="scroll-img right">
        <div class="card-wrap">
        <div class="url-card background-none"></div>
<%
  String search = request.getParameter("search"); // 입력 폼에서 전달된 검색어 받아오기

  // JDBC 드라이버 로드 및 DB 연결
Class.forName("org.mariadb.jdbc.Driver");
					String url = "jdbc:mariadb://localhost:3306/project01_db";
					String user = "seohyun";
					String password = "1111";

try(Connection con = DriverManager.getConnection(url,user,password)){

  // SQL 문 실행하여 결과값 가져오기
  String sql = "SELECT * FROM video WHERE title LIKE ?";
  PreparedStatement pstmt = con.prepareStatement(sql);
  pstmt.setString(1, "%" + search + "%"); // LIKE 연산자 사용하여 검색어와 일치하는 데이터 조회
  ResultSet rs = pstmt.executeQuery();

  // 조회된 데이터 출력하기
  while (rs.next()) {
  %>
   <div class="url-card">
   <a href="education-page.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>">
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
         </div>
      </div>
    </article>
  </section> 
    <a href="#header"><img src="./img/swipe.png" id="swipe-btn"></a>
  <script src="./script/index.js"></script>
</body>

</html>