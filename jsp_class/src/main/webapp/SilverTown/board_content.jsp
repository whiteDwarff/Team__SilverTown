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
<link rel="stylesheet" href="./style/test.css">
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
			   <p><%=content %></p>
			</div>
		    <div class="button-wrap"></div>
		  <% if((String) session.getAttribute("name")!= null && session.getAttribute("name").equals(name)) { %>
		    	<script>
			    	const btnWrap = document.getElementsByClassName('button-wrap')[0];
			    	let template = 
			    		"<a href='boardUpdate.jsp?title=<%=title%>'>수정</a>" +
			    		"<a onclick='confirmDelete()'>삭제</a>"
			    		;
			    	btnWrap.insertAdjacentHTML('beforeend', template);
		    	</script>
		    <% } %>
	   </div>   <!-- qna-wrap -->
	</section>
	<section>
	  <div class="qna-content-wrap">
	  	<div class="info-wrap">
	<hr>
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
	  <span><%=commentName %></span>
	  <span><%=commentCREATED_AT %></span>
	</div>
	<div class="content-wrap">
		<span><%=commentCONTENT %></span>
	</div>
	<div class="button-wrap"></div>
	
	<% if(session.getAttribute("name").equals(commentName)) { %>
	<script>
	/* onclick="confirmCommentDelete"  */
		const btnWrap2nd = document.getElementsByClassName('button-wrap')[1];
	    let template = 
			"<button>수정</button>" +
			"<button>삭제</button>"
			btnWrap2nd.insertAdjacentHTML('beforeend', template);
	</script>
	<% 
		}
      }      
  	} catch (Exception e) {
     	e.printStackTrace();
    }
    %>

	<hr>
	<form method="get" action="board_comment_insert.jsp">
		<input type="text" placeholder="이름" name="comment_name"> 
		<input type="text" placeholder="댓글 내용 입력" name="comment_content"> 
		<input type="text" value="<%=boardId %>" name="board_Id"
			class="comment_insert_id"> <input type="submit" value="등록">
	</form>
	  </div>
	</section>
	<%@include file="./footer.jsp"%>
	<script src="./script/header.js"></script>
	<script>
	  function confirmDelete() {
        if (confirm("삭제하시겠습니까?")) 
          location.href = "boardDelete.jsp?boardId=<%=boardId%>";
		}

	   function confirmCommentDelete() {
		if (confirm("댓글을 삭제 하시겠습니까?")) 
		  location.href = "";
		}
	   const count = document.getElementById('count');
	   count.innerText = "<%= count %> 개의 댓글 (총 <%= count%>개)";
	</script>
</body>
</html>