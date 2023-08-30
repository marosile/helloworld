<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <link rel="stylesheet" href="/resources/css/common/signUp.css">
    <link rel="stylesheet" href="/resources/css/common/general.css">

</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="mainBody">

        <form action="" class="mainFrm">

            <h1>회원가입</h1>

            <div>
                SNS회원가입
            </div>
            <div>
                <button>카카오로 로그인</button>
                <button>Google 계정으로 로그인</button>
                <button>네이버 계정으로 로그인</button>
            </div>

            <hr>

            <button class="signUpEmailBtn" type="button">
                이메일로 시작하기 ∧
            </button>

            <!-- 이메일로 시작하기 버튼 눌렀을 때 나와야 하는 div -->
            <div>
                <div class="signUpInfo">
                    <hr class="signUpInfoHr">
                    <p>회원가입에 필요한 정보를 입력해주세요</p>
                    <hr class="signUpInfoHr">
                </div>

                <div class="inputAll">
                    <label for="inputEmail" class="inputName">이메일</label>
                    <div>
                        <input type="text" name="inputEmail" id="inputEmail" class="inputClass" autocomplete="off">
                        <button id="emailCheck" type="button">인증하기</button>
                    </div>
                    <span>04:59</span>
                </div>

                <div class="inputAll">
                    <label for="inputPw" class="inputName">인증번호 입력</label>
                    <input type="text" name="inputEmailChk" id="inputEmailChk" class="inputClass" autocomplete="off">
                    <span>정규표현식 확인</span>
                </div>


                <div class="inputAll">
                    <label for="inputPw" class="inputName">비밀번호</label>
                    <input type="text" name="inputPw" id="inputPw" class="inputClass" autocomplete="off">
                    <span>정규표현식 확인</span>
                </div>

                <div class="inputAll">
                    <label for="inputConfirmPw" class="inputName">비밀번호확인</label>
                    <input type="text" name="inputConfirmPw" id="inputConfirmPw" class="inputClass" autocomplete="off">
                    <span>정규표현식 확인</span>
                </div>

                <div class="inputAll">
                    <label for="inputNickname" class="inputName">닉네임</label>
                    <input type="text" name="inputNickname" id="inputNickname" class="inputClass" autocomplete="off">
                    <span>정규표현식 확인</span>
                </div>

                <div class="inputAll">
                    <label for="inputName" class="inputName">이름</label>
                    <input type="text" name="inputName" id="inputName" class="inputClass" autocomplete="off">
                    <span>정규표현식 확인</span>
                </div>

                <div class="inputAll">
                    <label for="inputPno" class="inputName">주민등록번호</label>
                    <input type="text" name="inputPno" id="inputPno" class="inputClass" autocomplete="off">
                    <span>정규표현식 확인</span>
                </div>

               

                <div class="checkCollect">
                    <div>
                        <input type="checkbox" name="checkAll" id="checkAll" class="chkbox">
                        <label for="checkAll" class="chkLabel"></label>
                        <label for="checkAll">모두 동의</label>
                    </div>

                    <div>
                        <input type="checkbox" name="chkEssential" id="check1" class="chkbox">
                        <label for="check1" class="chkLabel"></label>
                        <label for="check1">(필수) 만 14세 이상입니다.</label>
                    </div>

                    <div>
                        <input type="checkbox" name="chkEssential" id="check2" class="chkbox">
                        <label for="check2" class="chkLabel"></label>
                        <label for="check2">(필수) 헬로월드 이용약관 동의</label>
                        <a href="#">보기</a>
                    </div>

                    <div>
                        <input type="checkbox" name="chkEssential" id="check3" class="chkbox">
                        <label for="check3" class="chkLabel"></label>
                        <label for="check3">(필수) 개인정보 수집 및 이용 동의</label>
                        <a href="#">보기</a>
                    </div>

                    <div>
                        <input type="checkbox" name="chkSelect" id="check4" class="chkbox">
                        <label for="check4" class="chkLabel"></label>
                        <label for="check4">(선택) 마케팅 정보 수신 동의</label>
                        <a href="#">보기</a>
                    </div>
                </div>

                <button id="signUpBtn">회원가입</button>

            </div>

        </form>
        
    </div>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    

    <script src="/resources/js/common/general.js"></script>
</body>
</html>


