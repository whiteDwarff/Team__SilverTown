<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	 <title>CodeGrow-join</title>
    <link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
      <link rel="stylesheet" href="./style/login.css?after">
</head>
<body>

 <main class="center">
        <img src="./img/dev.jpg" alt="">
        <article class="login" id="login">
            <div class="content-wrap">
                <h2>Update</h2>
                 <form action="update_ok.jsp" method="post" id="join-form">
                    <input type="text" name="email" value="<%=session.getAttribute("email")%>" readonly>
                    <input type="text" name="name" value="<%=session.getAttribute("name")%>" readonly >
                    <input type="text" name="tel" placeholder="휴대폰 번호 (-포함)">
                    <input type="password" name="password" placeholder="비밀번호">
                    <input id="join-submit-btn" class="submit-button" type="submit" value="가입">
                </form>
            </div>
        </article>
    </main>
    
 <script src="./script/login1.js"></script>
</body>
</html>