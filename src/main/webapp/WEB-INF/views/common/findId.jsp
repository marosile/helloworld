<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>

<title>아이디 찾기</title>
<link rel="stylesheet" href="/resources/css/common/general.css">
<link rel="stylesheet" href="/resources/css/common/findId.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

        
    <div class="findIdMain">
        <h2>아이디 찾기</h2>
    
        <div class="radioList">
            <label for="findTel" class="findTelLabel">
                <input type="radio" name="findIdRadio" id="findTel" checked>휴대폰 인증
                <label for="findTel" class="findTelShape"></label>
            </label>
                

            <label for="findEmail" class="findTelLabel">
                <input type="radio" name="findIdRadio" id="findEmail">이메일 인증
                <label for="findEmail" class="findTelShape"></label>
            </label>
        </div>


        <div class="TelCertification">


            <div class="phoneAuth1">
                <input type="text" id="inputTel1" class="phoneInput" placeholder="본인인증을 위한 휴대폰 번호 입력">

                <button id="btn1" class="inputBtn" type="button">인증번호 발송</button>
            </div>

            <div class="phoneAuth1">
                <input type="text" id="inputTel2" class="phoneInput" placeholder="인증번호 입력">

                <button id="btn2" class="inputBtn" type="button">인증하기</button>
            </div>

            <div class="telMessage">
                <span id="authKeyMessage"></span>
                <span id="telAuthMessage"></span>
            </div>


            <button id="findIdBtn1" class="findIdBtn" type="button">아이디 찾기</button>

        </div>




        <div class="EmailCertification">

            <form action="#" class="findIdFrm" id="emailFrm">
                <div class="phoneAuth1">
                    <input type="text" id="inputEmail1" class="phoneInput" placeholder="본인인증을 위한 이메일 입력">
        
                    <button id="btn3" class="inputBtn" type="button">인증번호 발송</button>
                </div>
                    
                <div class="phoneAuth1">
                    <input type="text" id="inputEmail2" class="phoneInput" placeholder="인증번호 입력">
        
                    <button id="btn4" class="inputBtn" type="button">인증하기</button>
                </div>

                <div class="telMessage">
                    <span id="authKeyMessage2"></span>
                    <span id="emailAuthMessage"></span>
                </div>

                <button id="findIdBtn2" class="findIdBtn">아이디 찾기</button>

            </form>
        </div>


        <div class="idModal">
            <span id="idModalClose">&times;</span>
            <div class="idModalDiv">
                <h2>해당 전화번호와 일치하는 아이디</h2>
                <span class="findIdSpan">아이디 : </span>
                <span id="findTelId" class="findIdSpan"></span>
            </div>
        </div>
            

        
    </div>
    
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/common/findId.js"></script>
</body>
</html>