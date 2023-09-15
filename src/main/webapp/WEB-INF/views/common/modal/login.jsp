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

            <form action="/member/login" class="loginFrm" id="loginFrm" method="post">

                <div class="login-inputAll">
                    <label for="login-inputEmail" class="login-inputName">아이디</label>
                    <input type="text" name="memberId" id="login-inputEmail" class="login-inputClass"
                           autocomplete="off" placeholder="아이디를 입력해주세요" value="${cookie.idSave.value}">
                </div>

                <div class="login-inputAll">
                    <label for="login-inputPw" class="login-inputName">비밀번호</label>
                    <input type="text" name="memberPw" id="login-inputPw" class="login-inputClass" autocomplete="off" placeholder="비밀번호를 입력해주세요">
                </div>

                <c:if test="${!empty cookie.idSave.value}">
                    <c:set var="chk" value="checked"/>
                </c:if>

                <div class="login-saveId">
                    <div>
                        <input type="checkbox" id="idSave" name="idSave" ${chk}>
                        <label for="idSave">아이디 저장</label>
                    </div>

                    <div>
                        <input type="checkbox" id="autoLogin" name="autoLogin">
                        <label for="autoLogin">자동 로그인</label>
                    </div>

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
                <div class="kakao-button">
                    <a href="https://kauth.kakao.com/oauth/authorize?client_id=aac73a50e342183e31a5478826ffeffd&redirect_uri=http://localhost/member/login/kakao&response_type=code">
                        <img src="/resources/images/kakao_login_medium_wide.png">
                    </a>
                </div>
                <div class="google-button">
                    <a href="${googleUrl}">
                        <img src="/resources/images/btn_google_light_normal_ios.png">
                        <span>구글 로그인</span>
                    </a>
                </div>


            </div>

        </div>



        <script src="/resources/js/common/modal/login.js"></script>
    </body>
</html>

