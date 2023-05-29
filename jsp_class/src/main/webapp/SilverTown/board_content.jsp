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
<<<<<<< HEAD
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
	// DB name
	String name = dto.getName();
	
	int count = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeGrow</title>
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<!-- <link rel="stylesheet" href="./style/test.css?after"> -->
<link rel="stylesheet" href="./style/board_content.css?after">
</head>
<body>
	<%@include file="./header.jsp"%>
	
	<section id="main-content">
	  <div class="qna-wrap">
		 <h3>Q. <%= title %></h3>
		 <span id="count"></span>
		 <span class="date"><%=created_at %></span>
			<div class="flex-box">
			   <span class="name"><%= name %></span>
			   <div class="hidden-form-wrap">
			   	   <p class="content"><%=content %></p>
			   	   <form class="hidden" id="main-hidden-form" action="boardUpdate.jsp" method="post">
				 	<input class="update-input" name="content">
				 	<input style="display:none" name="title" value="<%= title %>">
				 	<button >제출</button>
	        	   </form>
			   </div>
			</div>
		    <div class="button-wrap"></div>
	   </div>   <!-- qna-wrap -->
	</section><!-- main-content -->
	
	
	<section id="sub-content">
	<%
  //댓글 가져오기
  InitialContext initCtx = new InitialContext();

  Context ctx = (Context)initCtx.lookup("java:comp/env");

  DataSource ds= (DataSource)ctx.lookup("jdbc/project01_db");
  
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
   <div class="qna-wrap">
	 <div class="info-wrap">
      <span class="date"><%=commentCREATED_AT %></span>
	</div> <!-- info -wrap -->
	<div class="flex-box">
		<span class="name"><%=commentName %></span>
		<span class="content"><%=commentCONTENT %></span>
	</div> <!-- flex-box -->
	<div class="button-wrap"></div>
   </div> <!-- qna-wrap -->
	
	<% if(session.getAttribute("name").equals(commentName)) { %>
	<script>
	/* onclick="confirmCommentDelete"  */
		const btnWrap2nd = document.getElementsByClassName('button-wrap')[1];
	    let template = 
			"<a id='update-button'>수정</a>" +
			"<a href='boardDelete.jsp?boardId=<%=boardId%>'>삭제</a>"
			btnWrap2nd.insertAdjacentHTML('beforeend', template);
	</script>
	<% 
		}
      }      
  	} catch (Exception e) {
     	e.printStackTrace();       
    }
    %>
	</section>
	<section id="form">
	  <div class="form-wrap">
	  <span>댓글작성</span>
	  	<form method="get" action="board_comment_insert.jsp">
		<!-- name, boardId는 display: none -->
		<input type="text" placeholder="이름" name="comment_name" class="hidden"> 
		<input type="text" name="comment_content" id="comment"> 
		<input type="text" value="<%= boardId %>" name="board_Id" class="hidden">
		<input type="text" value="<%= title %>" name="title" class="hidden">
		<button id="submit-button">등록</button>
	</form>
	  </div>
	</section>
	<%@include file="./footer.jsp"%>
	<script src="./script/header.js"></script>
	<script>
	   const count = document.getElementById('count');
	   count.innerText = "<%= count %> 개의 댓글 (총 <%= count %>개)";
	   
	   <% if((String) session.getAttribute("name")!= null && session.getAttribute("name").equals(name)) { %>
	    	const btnWrap = document.getElementsByClassName('button-wrap')[0];
	    	let template = 
	    		"<span id='main-update-button'>수정</span>" +
	    		"<a onclick='confirmDelete()'>삭제</a>";
	    	btnWrap.insertAdjacentHTML('beforeend', template);
	    	
	    	 function confirmDelete() {
	    	        if (confirm("삭제하시겠습니까?")) 
	    	          location.href = "boardDelete.jsp?boardId=<%=boardId%>";
	    			}
   	</script>
   <% } %>
   
   <script src="./script/border_test.js"></script>
	   
</body>
=======
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
>>>>>>> branch 'hun' of https://github.com/whiteDwarff/Team__SilverTown.git
</html>