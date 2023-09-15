<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

<title>구글로그인 테스트</title>
</head>
<body>

<button class="btn btn-primary" id="googleLoginBtn" onCLick="location.href='https://accounts.google.com/o/oauth2/v2/auth?client_id=829784621579-9i247enb310blhhajovb5u9ggnfiglja.apps.googleusercontent.com&redirect_uri=http://localhost/member/login/google&response_type=code&scope=email%20profile%20openid&access_type=offline'">구글 로그인</button>



</body>


</html>