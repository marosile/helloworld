<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <%-- <link rel="stylesheet" href="/resources/css/common/general.css"> --%>
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-main.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>

        <form >
        <section class="myPage-main">

            <!-- 마이페이지 nav -->
            <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>

            <h1 class="Title">회원 정보</h1>


            <form action="main" method="GET" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">

                <!-- 프로필 입력란 -->
                <div class="profile-area">

                    <div class="left">
                        <!-- 아이디 영역 -->
                        <div class="id-area">
                            <div class="texts">아이디(이메일)</div>
                            <input type="text" placeholder="나의 아이디">
                        </div>

                        <!-- 닉네임 영역 -->
                        <div class="nick-area">
                            <div class="texts">닉네임</div>
                            <input type="text" placeholder="나의 닉네임">
                        </div>

                        <!-- 관심있는 기술 -->
                        <div class="skill-area">
                            <div class="texts">관심있는 기술</div>
                            <input type="text" placeholder="이건 어케하지">

                            <button id="skillBtn">등록</button>
                        </div>

                    </div>

                    <div class="right">
                        <!-- 사진 -->
                        <div class="profile-image-area">
                            <img src="/resources/images/user.png" id="profileImage">
                        </div>
                        
                        <div class="imageBtn-area">
                            <label for="imageInput">이미지 선택</label>
                            <input type="file" name="profileImage" id="imageInput" accept="image/*">
                            <button>변경하기</button>
                        </div>

                        <!-- 팔로잉 팔로워 영역 -->
                        <div class="follow">
                            <div id="follower">팔로워 0</div>
                            <div id="following">팔로잉 0</div>
                        </div>

                        <button is="saveBtn">회원 정보 저장</button>
                    </div>

                </div>

            </form>
    
    
        </section>



	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
