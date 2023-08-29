<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>

    <link rel="stylesheet" href="/resources/css/common/signUp.css">

</head>
<body>
    
    <div>헤더</div>

    <div class="mainBody">

        <form action="" class="mainFrm">

            <h1>HELLO WORLD</h1>

            <div>
                SNS회원가입
            </div>

            <button class="startEmail">
                이메일로 시작하기 ∧
            </button>

            회원가입에 필요한 정보를 입력해주세요

            <div class="inputAll">
                <label for="inputEmail" class="inputName">이메일</label>
                <input type="text" name="inputEmail" id="inputEmail" class="inputClass">
            </div>

            <div class="inputAll">
                <label for="inputPw" class="inputName">비밀번호</label>
                <input type="text" name="inputPw" id="inputPw" class="inputClass">
            </div>

            <div class="inputAll">
                <label for="inputConfirmPw" class="inputName">비밀번호확인</label>
                <input type="text" name="inputConfirmPw" id="inputConfirmPw" class="inputClass">
            </div>

            <div class="inputAll">
                <label for="inputNickname" class="inputName">닉네임</label>
                <input type="text" name="inputNickname" id="inputNickname" class="inputClass">
            </div>

            <div class="inputAll">
                <label for="inputName" class="inputName">이름</label>
                <input type="text" name="inputName" id="inputName" class="inputClass">
            </div>

            <div class="inputAll">
                <label for="inputPno" class="inputName">주민등록번호</label>
                <input type="text" name="inputPno" id="inputPno" class="inputClass">
            </div>

            주소를 입력하시겠습니까?(선택)<input type="checkbox">

            <div class="inputAll">
                <label for="inputAddress" class="inputName">주소</label>
                <input type="text" name="inputAddress" id="inputAddress" class="inputClass">
            </div>

            <div>
                <input type="checkbox">모두 동의
                <input type="checkbox">(필수) 만 14세 이상입니다.
                <input type="checkbox">(필수) 헬로월드 이용약관 동의
                <input type="checkbox">(필수) 개인정보 수집 및 이용 동의
                <input type="checkbox">(선택) 마케팅 정보 수신 동의
            </div>

            <button>회원가입</button>

        </form>
        
    </div>
    
    <div>풋터</div>
    

</body>
</html>


