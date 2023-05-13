<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="Myeong.Hun.BoardDao"%>
<%
/*
=============================================
작성자 : 박훈명
작성일 : 2023. 5. 12.
프로그램 기능 : 게시글 상세 내용
=============================================
*/
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String getTitle = request.getParameter("title");

	//게시글 내용 가져오기
	BoardDao dao = new BoardDao();
	BoardDto dto = new BoardDto();
	dto = dao.boardView(getTitle);

	String boardId = dto.getId();
	String title = dto.getTitle();
	String content = dto.getContent();
	String author_id = dto.getAuthor_id();
	String created_at = dto.getCreated_at();
	
	//작성자의 ID값을 가져와서 name찾기
	BoardDto dtoName = new BoardDto();
	dto = dao.Writer(author_id);
	String name = dto.getName();
	
	int count = 0;


	
	
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><%=title %></title>
	<link rel="stylesheet" href="./style/board-comment.css">
</head>
<body>
<script>
function confirmDelete() {
    if (confirm("삭제하시겠습니까?")) {
        location.href = "boardDelete.jsp?boardId=<%=boardId%>";
    }
}

function confirmCommentDelete() {
	if (confirm("댓글을 삭제 하시겠습니까?")) {
		location.href = "";
	}
}
</script>
    <div class="logo_picture">
        <h1>LOGO</h1>
    </div>
    <header>
        <a href="board.jsp">Q&A게시판</a>
    </header>
    <hr>
    <article>
        <header>
            <div>
                <h3><%=title %></h3>
            </div>
            <div>
                <span><%=name %></span> <span><%=created_at %></span>
                <a href="boardUpdate.jsp?title=<%=title%>"><button>수정</button></a>
                <button onclick="confirmDelete()">삭제</button>
            </div>
        </header>
        <div class="content_box">
            <p><%=content %></p>
        </div>
    </article>
    <hr>
    <%
  //댓글 가져오기
  InitialContext initCtx = new InitialContext();

  Context ctx = (Context)initCtx.lookup("java:comp/env");

  DataSource ds= (DataSource)ctx.lookup("jdbc/project");
  
  String sql = "SELECT C.CONTENT, C.CREATED_AT, M.NAME "
			+ "FROM COMMENT C "
			+ "JOIN MEMBER M ON C.AUTHOR_ID = M.ID "
			+ "WHERE C.POST_ID = ?"
					+ " ORDER BY 2";

  //2. 연결 객체 생성
  try (Connection con = ds.getConnection();
          PreparedStatement pstmt = con.prepareStatement(sql)) {
         pstmt.setString(1, boardId);
         ResultSet rs = pstmt.executeQuery();
    
         while (rs.next()) {
        	 String commentName = rs.getString("NAME");
        	 String commentCONTENT = rs.getString("CONTENT");
        	 String commentCREATED_AT = rs.getString("CREATED_AT");
        	 count ++;
         %>
         <p><%=commentName %> <%=commentCREATED_AT %>
         <p><%=commentCONTENT %> <button>수정</button> <button onclick="confirmCommentDelete">삭제</button>
         
         <%
         
         }      
  } catch (Exception e) {
     		e.printStackTrace();
     	}
         
         %>
         <hr>
         <form method="get" action="board_comment_insert.jsp">
         <input type="text" placeholder="이름" name="comment_name">
         <input type="text" placeholder="댓글 내용 입력" name="comment_content">
         <input type="text" value="<%=boardId %>" name="board_Id" class="comment_insert_id">
         <input type="submit" value="등록">
         </form>
</body> 
</html>