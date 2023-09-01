<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-main.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>
        
        <section class="myPage-main">
            <h1 class="Title">프로필</h1>

            <form action="main" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">

                <!-- 프로필 입력란 -->
                <div class="profile-area">

                    <div class="left">
                        <!-- 이름 영역 -->
                        <div class="name-area">
                            <div class="texts">이름</div>
                            <input type="text" name="name" class="boxs" placeholder="나의 이름">
                        </div>

                        <!-- 닉네임 영역 -->
                        <div class="nick-area">
                            <div class="texts">닉네임</div>
                            <input type="text" name="memberNickname" class="boxs" placeholder="나의 닉네임">
                        </div>

                    </div>

                    <%-- ======================================================== --%>

                    <div class="right">
                        <!-- 사진 -->
                        <div class="profile-image-area">
                            <img src="/resources/images/user.png" id="profileImage">
                        </div>
                        
                        <div class="imageBtn-area">
                            <label for="imageInput">이미지 선택</label>
                            <input type="file" name="profileImage" id="imageInput" accept="image/*">
                            <button id="changeBtn">변경하기</button>
                        </div>

                        <!-- 팔로잉 팔로워 영역 -->
                        <div class="follow">
                            <div id="follower">팔로워 0</div>
                            <div id="following">팔로잉 0</div>
                        </div>

                        <button id="saveBtn">회원 정보 저장</button>
                    </div>

                </div>
            </form>
    
    
        </section>



	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
