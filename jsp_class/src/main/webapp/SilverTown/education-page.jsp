<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.*"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.naming.InitialContext"%>
<%
   request.setCharacterEncoding("utf-8");
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   String urlLink = request.getParameter("url");
   String lang = request.getParameter("lang");
   
   Class.forName("org.mariadb.jdbc.Driver");
   InitialContext initCtx = new InitialContext();

   Context ctx = (Context)initCtx.lookup("java:comp/env");

   DataSource ds= (DataSource)ctx.lookup("jdbc/project01_db");
      String sql = "select * from video where category_id = ?";
   
   try(Connection con = ds.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);) {
      
      pstmt.setString(1, lang);
      
      ResultSet rs = pstmt.executeQuery();
%>

<html>
<head>
<meta charset="UTF-8">
<title>CodeGrowe</title>
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="./style/education.css?after">
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
</head>
<body>

   <%@include file="./header.jsp"%>

   <section id="url-box">
      <div class="wrap">
         <div class="flex-box">
            <embed id="main-url"
               src="https://www.youtube.com/embed/<%= urlLink %>?showinfo=0&modestbranding=1&rel=0"
               title="YouTube video player" frameborder="0"
               allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
               allowfullscreen></embed>
            <div class="list-box">
               <h2 class="url-title"><%= title %></h2>
               <h4 class="url-content"><%= content %></h4>
               <ul class="list">
                  <div class="scroll-box">
                     <%
                    while(rs.next()){
                  %>
                     <!-- list -->
                    <li>
                     <a href="education-page2.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
                       <embed controls=0 src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg"
                        allowfullscreen class="sub-url"></embed>
                     <div>
                       <span class="sub-url-title"><%= rs.getString("title")%></span>
                       <span class="sub-url-content"><%= rs.getString("description")%></span>
                     </div>
                     </a>
                    </li>
                     <!-- end  -->
                     <% 
                      	} 
                      } catch(Exception e) {
                        e.printStackTrace();
                    }
                  	%>
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
					<option >mdn-like</option>
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
		</div>
		  <div style="display: flex;">
		    <div class=CodeMirror style="flex: 1;" id="aa">
			<textarea id="code" name="code">
			<html style="color: green">
			  <!-- this is a comment -->
			<head>
			 <title>Mixed HTML Example</title>
			 <style>
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
    
	<script>
		const option = document.getElementsByTagName('option');
		
	    setTimeout(() => {
			for(let item of option) {
				if(item.value == 1) item.selected = true;
			}
		}, 0); 
	
	
       	function runCode() {
          var code = editor.getValue();
          var output = document.getElementById("output").contentWindow.document;
          output.open();
          output.write(code);
          output.close();
          }
    </script>
    <script src="./codemirror-5.65.13/lib/codemirror.js"></script>
	<script src="./codemirror-5.65.13/mode/javascript/javascript.js"></script>
	<script src="./codemirror-5.65.13/mode/css/css.js"></script>
	<script src="./codemirror-5.65.13/mode/htmlmixed/htmlmixed.js"></script>	
	<script src="./codemirror-5.65.13/mode/javascript/javascript.js"></script>
    
    
    
   <%@include file="./footer.jsp"%>
   <script src="./script/theme.js"></script>
   <script src="./script/education-page.js"></script>
   <script src="./script/header1.js?after"></script>
</body>
</html>