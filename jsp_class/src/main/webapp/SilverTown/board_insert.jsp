<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>   
<%@page import="javax.naming.InitialContext"%>

<%
 request.setCharacterEncoding("utf-8");
 String search = request.getParameter("search"); // 입력 폼에서 전달된 검색어 받아오기

  // JDBC 드라이버 로드 및 DB 연결
 Class.forName("org.mariadb.jdbc.Driver");
 InitialContext initCtx = new InitialContext();

 Context ctx = (Context)initCtx.lookup("java:comp/env");

 DataSource ds= (DataSource)ctx.lookup("jdbc/project01_db");
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   String author_name =request.getParameter("author_name");

out.println(title);
out.println(content);
out.println(author_name);

   String sql = "INSERT INTO board (title, content, author_id) SELECT ?, ?, id FROM member WHERE name = ?";
   
   try(Connection con = ds.getConnection(); 
         PreparedStatement pstmt = con.prepareStatement(sql);){
   
      pstmt.setString(1, title);
      pstmt.setString(2, content);
      pstmt.setString(3,author_name);
      int i = pstmt.executeUpdate();
       response.sendRedirect("board.jsp");  

   
}catch(Exception e){
   e.printStackTrace();
}
   
%>
