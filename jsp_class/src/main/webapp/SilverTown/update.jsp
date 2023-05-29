<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CodeGrow</title>
<link href="./img/icon.png" rel="shortcut icon" type="image/x-icon">
<link rel="stylesheet" href="./style/update.css">
</head>
<body>
	<%@include file="./header.jsp"%>
<%
String pwdCheck = (String) session.getAttribute("password");
%>

	<main class="center">
		<article class="login" id="login">
			<div class="#">
				<div id="update-form">
					<h2>개인 정보 수정</h2>
					<div id="p-zone">
					<p><em>다른 아이디/사이트에서 사용한 적 없는 비밀번호</em></p>
					<p><em>이전에 사용한 적 없는 비밀번호가 안전합니다.</em></p>
					</div>
					<form action="update_ok.jsp" method="post" id="join-form" onsubmit="return validateForm()">
						<input type="text" name="email" value="<%=session.getAttribute("email")%>" readonly>
						<input type="text" name="name" value="<%=session.getAttribute("name")%>" readonly>
						<input type="text" name="tel" id="tel" placeholder="휴대폰 번호 (- 포함)" value="<%=session.getAttribute("phone")%>">
						<input type="password" name="password" id="password" placeholder="현재 비밀번호">
						<input type="password" name="newPwd" id="newPwd" placeholder="새 비밀번호">
						<input type="password" name="newPwd2" id="newPwd2" placeholder="새 비밀번호 확인">	
						<input id="join-submit-btn" class="submit-button" type="submit" value="수정">
					</form>
					<button onclick="location.href = 'index.jsp'" id="cancel-btn">취소</button>
				</div>
			</div>
		</article>
	</main>

	<%@include file="./footer.jsp"%>
	<script src="./script/header.js"></script>
	
	<script type="text/javascript">
	//true / false 값 반환 = 폼 제출 승인 / 불가
	function validateForm() {
	    var password = document.getElementById('password').value;
	    var newPwd = document.getElementById('newPwd').value;
	    var newPwd2 = document.getElementById('newPwd2').value;
	    var pwdCheck = '<%= pwdCheck %>';

	    if (password !== pwdCheck) {
	        alert('현재 비밀번호가 일치하지 않습니다.');
	        return false; 
	    }

	    if (newPwd !== newPwd2) {
	        alert('새 비밀번호가 일치하지 않습니다.');
	        return false; 
	    }

	    return true;
	}
	</script>
</body>
</html>
