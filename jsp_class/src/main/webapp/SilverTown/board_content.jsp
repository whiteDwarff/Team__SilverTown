<%@page import="Myeong.Hun.BoardDto"%>
<%@page import="Myeong.Hun.BoardDao"%>
<%@page import="java.util.List"%>
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
			<h3>
				Q.
				<%= title %></h3>
			<span id="count"></span> <span class="date"><%=created_at %></span>
			<div class="flex-box">
				<span class="name"><%= name %></span>
				<div class="hidden-form-wrap">
					<p class="content"><%=content %></p>
				</div>
			</div>
			<div class="button-wrap"></div>
		</div>
		<!-- qna-wrap -->
	</section>
	<!-- main-content -->


	<section id="sub-content">
		<%
  //댓글 가져오기
List<BoardDto> dtos = dao.comment(boardId);
 for(BoardDto dto2 : dtos){
         %>
		<div class="qna-wrap">
			<div class="info-wrap">
				<span class="date"><%= dto2.getComment_created_at() %></span>
			</div>
			<!-- info-wrap -->
			<div class="flex-box">
				<span class="name"><%= dto2.getComment_post_id() %></span>
				<div class="hidden-form-wrap">
					<span class="content"><%= dto2.getComment_content() %></span>
				</div>
			</div>
			<!-- flex-box -->
			<div class="button-wrap"></div>
		</div>
		<!-- qna-wrap -->
		<!-- 댓글 -->
		<%} %>
	</section>
	<section id="form">
		<div class="form-wrap">
			<span>댓글작성</span>
			<form method="get" action="board_comment_insert.jsp" id="contentForm">
				<!-- name, boardId는 display: none -->
				<input type="text" placeholder="이름" name="comment_name"
					class="hidden"> <input type="text" name="comment_content"
					id="comment"> <input type="text" value="<%= boardId %>"
					name="board_Id" class="hidden"> <input type="text"
					value="<%= title %>" name="title" class="hidden">
				<button id="submit-button">등록</button>
			</form>
		</div>
	</section>

	<%@include file="./footer.jsp"%>

	<script src="./script/header.js"></script>
	<script>
	   const count = document.getElementById('count'),
	         authorName = document.getElementsByClassName('name'),
	         hiddenForm = document.getElementsByClassName('hidden-form-wrap'),
	       	 updateButton = document.getElementsByClassName('update-input'),
	       	 title = document.getElementsByTagName('h3')[0].innerText,
	       	 sliceTitle = title.replace('Q. ', ''),
	         content = document.querySelectorAll('.content'),
	         buttonWrap = document.getElementsByClassName('button-wrap'),
		 	 updateBtn = document.getElementsByClassName('update-button'),
	   		 contentForm = document.getElementById('contentForm');
	  count.innerText = "<%= count %> 개의 댓글 (총 <%= count %>개)"; 
	  
	  // 게시글 작성자가 session에 저장된 'name'과 같으면 수정 및 삭제, form을 생성 
	  for(let i=0; i<authorName.length; i++) {
		  if(authorName[i].innerText == "<%= session.getAttribute("name") %>") {
			  // 기존 댓글의 내용 
			  let orgContent = document.getElementsByClassName('content');
			  // session이 유효할 경우 수정, 삭제 버튼 생성
			  let template = 
		    		"<span class='update-button'>수정</span>" +
		    		<%-- "<a href='commentsDelete.jsp?content=" + content[i].innerText + "&boardId=<%= boardId %>&title=" + sliceTitle + "'>삭제</a>" --%>
		    		"<a href='#'>삭제</a>"
		      document.getElementsByClassName('button-wrap')[i].insertAdjacentHTML('beforeend', template);
		      
		      // session이 유효할 경우 수정 form 생성
		      template = 
		    		  "<form class='hidden hidden-form' action='commentsUpdate.jsp' method='post'>"
		    		// 변경될 댓글내용 
			 		+ "<input class='update-input' name='content'>"
			 		
			 		////////////////////////////////////////////////////////////////////////////
			 		+ "<input style='display:none' name = 'boardTitle' value = <%=boardId%> >"
	                + "<input style='display:none' name = 'boardTitleName' value ='"+sliceTitle+"'>"
					////////////////////////////////////////////////////////////////////////////			 		
			 		
			 		// 기존 댓글의 내용을 value로 전송
			 	    + "<input style='display:none' name='title' value='" + orgContent[i].innerText + "'>"
			 	    + "<button>제출</button></form>"
			 document.getElementsByClassName('hidden-form-wrap')[i].insertAdjacentHTML('beforeend', template);
		  }
	  }			
	  
	  // form의 display 속성을 변경시키는 event handler
	  for(let i=0; i<updateBtn.length; i++) {
	  	updateBtn[i].addEventListener('click', e => {
	  		let contentsForm = document.getElementsByClassName('hidden-form');
	  		contentsForm[i].classList.toggle('block');
	  		// form의 class에 block이 있다면 eventTarget의 innerText 변경 
	  		if(contentsForm[i].classList.contains('block')) {
	  			e.target.innerText = '닫기';
	  		} else {
	  			e.target.innerText = '수정';
	  		}
	  	})
	  }
	  // 게시글 a태그의 href와 form의 action 속성 변경 
	  for(let i=0; i<buttonWrap.length; i++) {
		  for(let j=0; j<buttonWrap[i].children.length; j++) {
			  if(i == 0 && buttonWrap[i].children[j].classList.contains('update-button')) {
				document.querySelector('#main-content > div > div.flex-box > div > form').action = 'boardUpdate.jsp';
				<%-- buttonWrap[i].children[1].href='boardDelete.jsp?boardId=<%= boardId %>'; --%> 
			}
		  }
	  }
	  
	  const  deleteBtn = document.querySelectorAll('.button-wrap a');
	  // 삭제하기 버튼을 클릭하면 게시판과 댓글을 구분하여 href 속성 변경
	  for(let i=0; i<deleteBtn.length; i++) {
		  let contentText = deleteBtn[i].parentNode.previousElementSibling.children[1].children[0].innerText
		  deleteBtn[i].addEventListener('click', e => {
			  if(deleteBtn[i].parentNode == buttonWrap[0]) {
				  if(confirm('게시글을 삭제하시겠습니까?')) e.target.href = 'boardDelete.jsp?boardId=<%= boardId %>'; 
			  } else {
				  if(confirm('댓글을 삭제하시겠습니까?')) e.target.href = 'commentsDelete.jsp?content=' + contentText + '&boardId=<%= boardId %>&title=' + sliceTitle
			  }
		  })
	  }
	  contentForm.addEventListener('submit', e => {
		  let comment = document.getElementById('comment');
		  if(comment.value == '') {
			  e.preventDefault();
			  alert('댓글을 입력해주세요.');
		  } else if(comment.value < 2) {
			  e.preventDefault();
			  alert('댓글은 두글자 이상 입력해주세요.');
		  }
	  })
   	</script>

</body>
</html>