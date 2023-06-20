<%@page import="Myeong.Hun.VideoListDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Myeong.Hun.VideoListDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");
String title = request.getParameter("title");
String content = request.getParameter("content");
String urlLink = request.getParameter("url");
String lang = request.getParameter("lang");


VideoListDao dao = new VideoListDao();
ArrayList<VideoListDto> dtos = dao.list(lang);


/* session.invalidate(); */
%>

<html>
<head>
<meta charset="UTF-8">
<title>CodeGrowe</title>
<!-- 파비콘 등록 -->
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<!-- main style file -->
<link rel="stylesheet" href="./style/education-page2.css?after">
<!-- codeEditor에서 사용되는 style file -->
<link rel="stylesheet" href="./codemirror-5.65.13/lib/codemirror.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/3024-day.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/base16-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/duotone-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/duotone-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/eclipse.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/hopscotch.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/juejin.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/lucario.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/material.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/material-palenight.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/mdn-like.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/neat.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/neo.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/oceanic-next.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/paraiso-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/railscasts.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/shadowfox.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/solarized.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/xq-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/yeti.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/zenburn.css">
<!-- fontawessome icon import -->
<script src="https://kit.fontawesome.com/08a7424104.js" crossorigin="anonymous"></script>
</head>
<body>

	<%@include file="./header.jsp"%>

	<section id="url-box">
		<div class="wrap">
			<div class="flex-box">
				<embed id="main-url"
					src="https://www.youtube.com/embed/<%=urlLink%>?showinfo=0&modestbranding=1&rel=0"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
					allowfullscreen></embed>
				<div class="list-box">
					<h2 class="url-title"><%=title%></h2>
					<h4 class="url-content"><%=content%></h4>
					<!-- 관심목록 버튼 -->
					<button id="addToFavoritesBtn">관심목록 추가 <i class="fa-solid fa-plus add"></i></button>
					<!-- 조회수, 관심목록 버튼은 display: flex 해야함  -->
					<!--  <span>조회수 : </span>  -->
					<ul class="list">
						<div class="scroll-box">
							<%for(VideoListDto dto : dtos){%>
							<!-- list -->
							<li><a
								href="education-page2.jsp?title=<%=dto.getTitle()%>&content=<%=dto.getDescription()%>&url=<%=dto.getUrl()%>&lang=<%=dto.getCategory_id()%>">
									<embed controls=0
										src="https://img.youtube.com/vi/<%=dto.getUrl()%>/maxresdefault.jpg"
										allowfullscreen class="sub-url"></embed>
									<div>
										<span class="sub-url-title"><%=dto.getTitle()%></span>
										<span class="sub-url-content"><%=dto.getDescription()%></span>
									</div>
							</a></li> 
							<%} %>
							<!-- end  -->
							
						</div>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<!-- code editor -->
	<section id="code-editor">
		<article class="wrap">
			<div class="flex-box margin-bottom">
				<h2>Review Your Code</h2>
				<p>
					Select a theme: <select onchange="selectTheme()" id=select>
						<option value="1">default</option>
						<option>3024-day</option>
						<option>base16-light</option>
						<option>duotone-dark</option>
						<option>duotone-light</option>
						<option>eclipse</option>
						<option>hopscotch</option>
						<option>juejin</option>
						<option>lucario</option>
						<option>material</option>
						<option>material-palenight</option>
						<option>mdn-like</option>
						<option>neat</option>
						<option>neo</option>
						<option>oceanic-next</option>
						<option>paraiso-light</option>
						<option>railscasts</option>
						<option>shadowfox</option>
						<option>xq-light</option>
						<option>yeti</option>
						<option>zenburn</option>
					</select>
				</p>
			</div> <!-- flex-box -->
			<div style="display: flex;">
				<div class=CodeMirror style="flex: 1;" id="aa">
					<textarea id="code" name="code">
			<html style="color: green">
			  <!-- this is a comment -->
			<head>
			 <title>Mixed HTML Example</title>
			 <style scoped>
				h1 {
					font-family: comic sans;
					color: #f0f;
				}
				
				div {
					background: yellow !important;
				}
				
				body {
					max-width: 50em;
					margin: 1em 2em 1em 5em;
				}
				</style>
			  </head>
			  <body>
			    <h1>Mixed HTML Example</h1>
			    <script>
			      function jsFunc(arg1, arg2) {
			        if (arg1 && arg2) document.body.innerHTML = "achoo";
			      }
			    </script>
			  </body>
			</html>

			</textarea>

				</div>
				<div style="flex: 1;">
					<iframe class=CodeMirror id="output"></iframe>
				</div>
			</div>
			<button id="run-button" onclick="runCode()">Run</button>
		</article>
	</section>
	<!-- footer file -->
	<%@include file="./footer.jsp"%>
	
	<!-- jquery import -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- main script file -->
	<script src="./script/education-page.js"></script>
	<!-- codeEditor -->
	<script src="./codemirror-5.65.13/lib/codemirror.js"></script>
	<script src="./codemirror-5.65.13/mode/javascript/javascript.js"></script>
	<script src="./codemirror-5.65.13/mode/css/css.js"></script>
	<script src="./codemirror-5.65.13/mode/htmlmixed/htmlmixed.js"></script>
	<script src="./codemirror-5.65.13/mode/javascript/javascript.js"></script>
	<script src="./script/theme.js"></script>

	<script>
		// --------------------- ajax handler ------------------
	<%-- 	<% if(session.getAttribute("name") == null) {
		
		} else {
		%> --%>
	    $('#addToFavoritesBtn').click(function() {
	    	// --------------------- ajax handler ------------------
	   	<% if(session.getAttribute("name") == null) {
	    		response.sendRedirect("login.jsp");
	    		} else {
	    		%>
	    	let el =  $('#addToFavoritesBtn').text()
	    	// 이미 동영상을 등록한 경우 (중복 등록 방지)
	    	if(el.includes("찜한강의")) {
	    		// button의 a 태그 href 속성 변경 
    			$('#link').attr('href', 'deleteSessionUrl.jsp?title=<%=title%>');
	    		if(confirm('관심목록에서 삭제하시겠습니까?')) {
	    			// 해당 동영상을 삭제하는 로직을 작성된 페이지로 이동 **
	    			console.log(1)
	    		} else {
	    			// button의 a 태그 href 속성 변경 
	    			$('#link').attr('href', '#');
	    		}
	    	// 동영상이 저장되지 않았을 경우 
	    	} else {
	    	 	var title = '<%=title%>';
				$.ajax({
					url : 'wishList_ok.jsp', // 스크립틀릿이 포함된 JSP 파일 경로
					data : {
						title : title
					},
					type : 'POST',
					success : function() {
						alert('강의가 등록 되었습니다.');
						  $('#addToFavoritesBtn').html( "<a id='link' href='#'>"+"찜한강의 " + "<i class='fa-solid fa-minus minus add'></i></a>");
					},
					error : function(xhr, status, error) {
						alert('error');
					}
				})
	    	} 
    	})
    	 <% } %> 
		// ---------------------codeEditor handler -----------------------
		function runCode() {
			var code = editor.getValue();
			var output = document.getElementById("output").contentWindow.document;
			output.open();
			output.write(code);
			output.close();
		}
	 	// --------------------- cartList handler -----------------------
	    const addBtn = document.getElementById('addToFavoritesBtn');
	    const urlTitle = document.getElementsByClassName('url-title')[0];
	 	
	    <%
			if( session.getAttribute("videoList") != null ) {
				VideoListDao vldao = new VideoListDao();
				ArrayList<String> list = (ArrayList) session.getAttribute("videoList");
				for (String item : list) {
					VideoListDto dto = vldao.getVideoByTitle(item);
		%>
		// dto의 title과 html문서 내 title이 일치한 경우 버튼의 innerHTML 변경
		if("<%=dto.getTitle()%>" == urlTitle.innerText) {
			addBtn.innerHTML = "<a id='link' href='#'>"+"찜한강의 " + "<i class='fa-solid fa-minus minus add'></i></a>" 
		}
	    <% } } %>
	   
	</script>
	<script src="./script/header1.js"></script>
</body>
</html>