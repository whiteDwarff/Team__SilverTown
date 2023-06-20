<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>문의하기</title>
	<link rel="stylesheet" href="./style/write.css">
	<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
  </head>
  <body>
  	<!-- header file -->
  	<%@include file="./header.jsp"%>
  	
  	<section>
  	  <div id="title">
  		<h4>문의하기</h4>
  	  </div>
    <form id="submitForm" action="board_insert.jsp" method="post">
      <article>
      	<label for="tit">제목</label>
       	<input id="tit" name=title type="text">
      </article>
      <article>
      	<label for="author">작성자</label>
      	<input id="author" name=author_name type="text" value=<%=session.getAttribute("name") %> readonly></input>
      </article>
      <article>
      	<label for="content">내용</label>
        <textarea id="content" name="content" rows="30" cols="30"></textarea>
      </article>
     
      <button id="submit-button">제출</button>
    </form>
    
  	</section>
    
    <%@include file="./footer.jsp"%>
    
    <script src="./script/write.js"></script> 
    <script src="./script/header.js"></script>
    <script>
	
    </script>
  </body>
</html>

   