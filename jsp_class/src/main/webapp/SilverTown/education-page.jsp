<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*"%>
<%
   request.setCharacterEncoding("utf-8");
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   String urlLink = request.getParameter("url");
   String lang = request.getParameter("lang");
   
   Class.forName("org.mariadb.jdbc.Driver");
   
    String url = "jdbc:mariadb://localhost:3307/project01_db";
   String user = "hunmyeong";
   String password = "8524";
   
   try(Connection con = DriverManager.getConnection(url, user, password)) {
      String sql = "select * from video where category_id = ?";
      
      PreparedStatement pstmt = con.prepareStatement(sql);
      pstmt.setString(1, lang);
      
      ResultSet rs = pstmt.executeQuery();
%>

<html>
<head>
<meta charset="UTF-8">
<title>CodeGrowe</title>
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="./style/education-page.css">
<link rel="stylesheet" href="./codemirror-5.65.13/lib/codemirror.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/3024-day.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/3024-night.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/abbott.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/abcdef.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/ambiance.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/ayu-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/ayu-mirage.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/base16-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/bespin.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/base16-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/blackboard.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/cobalt.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/colorforth.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/dracula.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/duotone-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/duotone-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/eclipse.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/elegant.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/erlang-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/gruvbox-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/hopscotch.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/icecoder.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/isotope.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/juejin.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/lesser-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/liquibyte.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/lucario.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/material.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/material-darker.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/material-palenight.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/material-ocean.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/mbo.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/mdn-like.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/midnight.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/monokai.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/moxer.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/neat.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/neo.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/night.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/nord.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/oceanic-next.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/panda-syntax.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/paraiso-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/paraiso-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/pastel-on-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/railscasts.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/rubyblue.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/seti.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/shadowfox.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/solarized.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/the-matrix.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/tomorrow-night-bright.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/tomorrow-night-eighties.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/ttcn.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/twilight.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/vibrant-ink.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/xq-dark.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/xq-light.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/yeti.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/idea.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/darcula.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/yonce.css">
<link rel="stylesheet" href="./codemirror-5.65.13/theme/zenburn.css">
<script src="./codemirror-5.65.13/lib/codemirror.js"></script>
<script src="./codemirror-5.65.13/mode/javascript/javascript.js"></script>
<script src="./codemirror-5.65.13/mode/css/css.js"></script>
<script src="./codemirror-5.65.13/mode/htmlmixed/htmlmixed.js"></script>
<script src="./codemirror-5.65.13/mode/javascript/javascript.js"></script>
<style>
.CodeMirror {
   border: 1px solid black;
   font-size: 13px
}
</style>
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
                     <li><a
                        href="education-page2.jsp?title=<%=rs.getString("title")%>&content=<%=rs.getString("description")%>&url=<%=rs.getString("url")%>&lang=<%= rs.getString("category_id") %>">
                           <embed controls=0
                              src="https://img.youtube.com/vi/<%= rs.getString("url") %>/maxresdefault.jpg"
                              allowfullscreen class="sub-url"></embed>
                           <div>
                              <span class="sub-url-title"><%= rs.getString("title")%></span>
                              <span class="sub-url-content"><%= rs.getString("description")%></span>
                           </div>
                     </a></li>
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
      <article>
   <h2>코드를 직접 연습해보세요</h2>
   <div style="display: flex;">
      <div class=CodeMirror style="flex: 1;">
         <textarea id="code" name="code"><html style="color: green">
  <!-- this is a comment -->
  <head>
    <title>Mixed HTML Example</title>
    <style>
      h1 {font-family: comic sans; color: #f0f;}
      div {background: yellow !important;}
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
   <button onclick="runCode()">Run</button>
      <script>
        
        function runCode() {
            var code = editor.getValue();
            var output = document.getElementById("output").contentWindow.document;
            output.open();
            output.write(code);
            output.close();
        }
    </script>

   <p>
      Select a theme: 
      <select onchange="selectTheme()" id=select>
         <option selected>default</option>
         <option>3024-day</option>
         <option>3024-night</option>
         <option>abbott</option>
         <option>abcdef</option>
         <option>ambiance</option>
         <option>ayu-dark</option>
         <option>ayu-mirage</option>
         <option>base16-dark</option>
         <option>base16-light</option>
         <option>bespin</option>
         <option>blackboard</option>
         <option>cobalt</option>
         <option>colorforth</option>
         <option>darcula</option>
         <option>dracula</option>
         <option>duotone-dark</option>
         <option>duotone-light</option>
         <option>eclipse</option>
         <option>elegant</option>
         <option>erlang-dark</option>
         <option>gruvbox-dark</option>
         <option>hopscotch</option>
         <option>icecoder</option>
         <option>idea</option>
         <option>isotope</option>
         <option>juejin</option>
         <option>lesser-dark</option>
         <option>liquibyte</option>
         <option>lucario</option>
         <option>material</option>
         <option>material-darker</option>
         <option>material-palenight</option>
         <option>material-ocean</option>
         <option>mbo</option>
         <option>mdn-like</option>
         <option>midnight</option>
         <option>monokai</option>
         <option>moxer</option>
         <option>neat</option>
         <option>neo</option>
         <option>night</option>
         <option>nord</option>
         <option>oceanic-next</option>
         <option>panda-syntax</option>
         <option>paraiso-dark</option>
         <option>paraiso-light</option>
         <option>pastel-on-dark</option>
         <option>railscasts</option>
         <option>rubyblue</option>
         <option>seti</option>
         <option>shadowfox</option>
         <option>solarized dark</option>
         <option>solarized light</option>
         <option>the-matrix</option>
         <option>tomorrow-night-bright</option>
         <option>tomorrow-night-eighties</option>
         <option>ttcn</option>
         <option>twilight</option>
         <option>vibrant-ink</option>
         <option>xq-dark</option>
         <option>xq-light</option>
         <option>yeti</option>
         <option>yonce</option>
         <option>zenburn</option>
      </select>
   </p>


</article>
   </section>
   
   <%@include file="./footer.jsp"%>
   <script src="./script/theme.js"></script>
   <script src="./script/education-page.js"></script>
   <script src="./script/header1.js?after"></script>
</body>
</html>