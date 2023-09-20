<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <title>비밀번호 찾기</title>

    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/common/findPw.css">
</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
    <div class="findIdMain">
        <h2>비밀번호 재발급</h2>
        
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


        <!-- 비밀번호 찾기를 눌렀을 때 DB에 아이디가 있는지 확인, 없으면 재요청하고 있으면 재발급 진행 -->
        <form action='/member/findPw/newPw' id="newPwFrm" method="POST">

            <div class="TelCertification">

                <div class="findPwId">
                    <input type="text" class="inputId" id="inputId1" name="memberId1" placeholder="비밀번호 재발급할 ID를 입력 해주세요">
                </div>

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


                <button class="findPwBtn" id="findPwBtn1" type="button">비밀번호 찾기</button>

            </div>


            <div class="EmailCertification">

                <div class="findPwId">
                    <input type="text" class="inputId" id="inputId2" name="memberId2" placeholder="비밀번호 재발급할 ID를 입력 해주세요">
                </div>

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


                <button class="findPwBtn" id="findPwBtn2" type="button">비밀번호 찾기</button>


            </div>


            <div class="pwModal">
                <span id="pwModalClose">&times;</span>
                <div class="pwModalDiv">

                        <h2>새 비밀번호로 변경</h2>

                        <div class="newPwDiv">
                            <label for="newPw">새 비밀번호 : </label>
                            <input type="text" id="newPw" name="memberPw" autocomplete="off">
                            <div id="pwMessage">영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요</div>
                        </div>

                        <div class="newPwDiv">
                            <label for="newPw2">새 비밀번호 확인 : </label>
                            <input type="text" id="newPw2" autocomplete="off">
                            <div id="pwCheckMessage"></div>
                        </div>

                        <button class="newPwBtn">새 비밀번호로 변경</button>


                </div>



            </div>

        </form>



    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/common/findPw.js"></script>
</body>
</html>