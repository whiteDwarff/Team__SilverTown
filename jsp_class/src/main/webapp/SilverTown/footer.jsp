<%--
	작성자 : munhokang
	작성일 : 2023. 5. 11.
	comment : 
		- footer file
		- include로 사용할 것
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeGrow</title>
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="">
<style>
footer {
	text-align: center;
	width: 100%;
	background: rgb(244, 244, 244, 0.5);
	margin-top: 100px;
	padding: 20px 0;
}

footer span {
	display: inline-block;
	color: #333;
	font-size: 14px;
}

#school-logo {
	width: 60px;
	margin-bottom: 20px;
}

.footer-wrap {
	width: 80%;
	margin: 0 auto;
}

footer .footer-wrap>div:first-child span:nth-child(2) {
	margin: 0 8px;
}

footer .footer-wrap>div:last-child {
	margin-bottom: 0;
}

.img-wrap img {
	width: 30px;
}

.img-wrap a:nth-child(2) {
	margin: 0 15px;
}

body>footer>div>div:nth-child(2) {
	margin: 15px 0;
}

@media screen and (max-width: 1000px) {
	footer {
		padding: 15px 0;
	}
	body>footer>div>div:nth-child(2) {
		margin: 13px 0;
	}
}
@media screen and (max-width: 750px) {
	footer {
		padding: 5px 0;
		margin-top: 60px;
	}
	#school-logo {
		width: 40px;
		margin-bottom: 13px;
	}
	.footer-wrap {
		width: 100%;
	}
	body>footer>div>div:nth-child(2) {
		margin: 6px 0;
	}
	footer span { font-size: 12px; }
	.img-wrap img {
		width: 25px;
	}
}
</style>
</head>
<body>
	<footer>
		<img src="./img/school-logo.png" alt="" id="school-logo">
		<div class="footer-wrap">
			<div>
				<span>강문호</span> <span>홍서현</span> <span>박훈명</span>
			</div>
			<div>
				<span>동의과학대학교 컴퓨터소프트웨어과</span> <span>(47230) 부산 부산진구 양지로 54,
					동의과학대학교 컴퓨터소프트웨어과(미래관 5층) 501호</span>
			</div>
			<div class="img-wrap">
				<a href="https://www.instagram.com/dit_sw_story/"><img
					src="./img/instagram.png" alt=""></a> <a
					href="https://m.facebook.com/people/%EB%8F%99%EC%9D%98%EA%B3%BC%ED%95%99%EB%8C%80%ED%95%99%EA%B5%90-%EC%BB%B4%ED%93%A8%ED%84%B0%EC%86%8C%ED%94%84%ED%8A%B8%EC%9B%A8%EC%96%B4%EA%B3%BC/100083557353101/"><img
					src="./img/facebook.png" alt=""></a> <a
					href="https://www.dit.ac.kr/kr/index.php?pCode=dept0606"><img
					src="./img/homepage.png" alt=""></a>
			</div>
		</div>
	</footer>
</body>
</html>