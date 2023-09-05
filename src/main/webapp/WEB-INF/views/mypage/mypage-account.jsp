<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-계정 관리</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-account.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>

        <h1 class="Title">계정 관리</h1>
        <section>

            <form action="account" method="POST" name="myPageFrm" id="accountFrm">

                <!-- 이메일 -->
                <div class="email-area">
                    <div class="rowE">
                        <label><h3>이메일 정보</h3></label>
                        <input type="text" name="memberEmail" id="memberEmail" maxlength="30" autocomplete="off">
                        <button id="sendAuthKeyBtn">이메일 인증</button>
                    </div>
                </div>

                <!-- 비번 -->
                <h3>비밀번호 변경</h3>
                <div class="pw-area">
                    <div class="row">
                        <label>현재 비밀번호</label><br>
                        <input type="password" maxlength="30">
                    </div>
                    <div class="row">
                        <label>새 비밀번호</label><br>
                        <input type="password" maxlength="30">
                    </div>
                    <div class="row">
                        <label>비밀번호 확인</label><br>
                        <input type="password" maxlength="30">
                        <button id="pwBtn">변경하기</button>
                    </div>

                </div>
            </form>

            <div class="line"><hr></div>

            <!-- 회원 탈퇴 -->
            <div class="secession-area">
                    
                <h4>회원 탈퇴</h4>

                <pre id="agreeText">
회원 탈퇴일로부터 계정과 닉네임을 포함한 계정 정보
(아이디/이메일/닉네임) 모든 개인 정보는 30일 보관 후 
완전히 삭제되며 더 이상 복구할 수 없게 됩니다.
제1조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4


제2조
이 약관은 샘플 약관입니다.

① 약관 내용 1

② 약관 내용 2

③ 약관 내용 3

④ 약관 내용 4
                </pre>

                <div>
                    <input type="checkbox" name="agree" id="agree">
                    <label for="agree">계정 탈퇴에 관한 정책을 읽고 이에 동의합니다.</label>
                    <button id="secessionBtn">회원 탈퇴</button>
                </div>

            </div>
            
        
        </section>
        
        


	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>