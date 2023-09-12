<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>

    <link rel="stylesheet" href="/resources/css/common/login.css">
</head>
    <body>

        <div class="loginMain">
            
            <h2>로그인</h2>

            <form action="" class="loginFrm">

                <div class="login-inputAll">
                    <label for="login-inputEmail" class="login-inputName">아이디(이메일)</label>
                    <input type="text" name="login-inputEmail" id="login-inputEmail" class="login-inputClass" autocomplete="off" placeholder="아이디(이메일)을 입력해주세요">
                </div>

                <div class="login-inputAll">
                    <label for="login-inputPw" class="login-inputName">비밀번호</label>
                    <input type="text" name="login-inputPw" id="login-inputPw" class="login-inputClass" autocomplete="off" placeholder="비밀번호를 입력해주세요">
                </div>

                <div class="login-saveId">
                    <input type="checkbox" id="saveId">
                    <label for="saveId">아이디 저장</label>
                </div>

                <button id="loginBtn">로그인</button>

            </form>


            <div class="signUpLink">
                <p>아직 회원이 아니신가요?</p>
                <a href="#">회원가입</a>
            </div>
            
            <div class="signUpLink">
                <a href="#">아이디를 잊으셨나요?</a>
                <span>|</span>
                <a href="#">비밀번호를 잊으셨나요?</a>
            </div>
                
            <div class="snsLogin">
                <h3>SNS로그인</h3>
                <div>
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=aac73a50e342183e31a5478826ffeffd&redirect_uri=http://localhost/member/login/kakao&response_type=code"><img src="/resources/images/kakao_login_medium_wide.png"></a>
                </div>
                <button>구글 계정으로 로그인 하기</button>
                <button>네이버 계정으로 로그인 하기</button>
            </div>

        </div>


        
    </body>
</html>

