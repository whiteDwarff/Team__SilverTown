<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <title>CodeGrow-join</title>
    <link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
      <link rel="stylesheet" href="./style/login2.css">
</head>
<body>

 <main class="center">
        <a href="index.jsp"><img src="./img/dev.jpg" alt=""></a>
        <article class="login" id="login">
            <div class="content-wrap">
                <h2>Sign In</h2>
                <form action="login_ok.jsp" method="post" id="login-form">
                    <input type="email" name="email" placeholder="이메일">
                    <input type="password" name="password" placeholder="비밀번호">
                    <input id="login-submit-btn" class="submit-button" type="submit" value="로그인">
                </form>
            </div>
            <article class="join">
                <div class="content-wrap">
                    <span>계정이 없으신가요?</span>
                    <button id="join-btn" class="text-button">가입하기</button>
                </div>
            </article>
        </article>
        <article id="join" class="center">
            <div class="content-wrap">
                <h2>Create Account</h2>
                <form action="insert.jsp" method="post" id="join-form">
                    <input type="text" name="email" placeholder="이메일">
                    <input type="text" name="name" placeholder="이름">
                    <input type="text" name="tel" placeholder="휴대폰 번호 (-포함)">
                    <input type="password" name="password" placeholder="비밀번호">
                    <input id="join-submit-btn" class="submit-button" type="submit" value="가입">
                </form>
            </div>
            <article class="join">
                <div class="content-wrap">
                    <span>계정이 있으신가요?</span>
                    <button id="login-btn" class="text-button">로그인</button>
                </div>
            </article>
        </article>
    </main>
    
 <script src="./script/login1.js"></script>
</body>
</html>