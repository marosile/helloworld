<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-북마크(채용공고)</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-bookmark2.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">

    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>

        <h1 class="Title">북마크</h1>

        <div class="change">
            <h4><span id="community"><a href="/mypage/bookmark">커뮤니티</a></span> | <span id="chae"><a href="/mypage/bookmark2">채용공고</a></span></h4>
        </div>

        <section class="bookmark">

            <div class="bookmarkList">
                
                <!-- 왼쪽 -->
                <div class="row1">
                    <div class="top">
                        <!-- 임시 썸네일 당근 -->
                        <img class="thumbnail" src="/resources/images/member/당근.png">
                        <div class="companyName"><a>당근 마켓</a></div>
                    </div>

                    <div class="mid">
                        <div class="fa-solid fa-briefcase"> 신입 ~ 100년차</div>
                        <div class="fa-solid fa-coins"> 연봉 정보 비공개</div>
                    </div>

                    <div class="bottom">
                        <div class="fa-solid fa-desktop"> 사무실 출근</div>
                        <div class="fa-solid fa-location-dot"> 서울 강남</div>
                    </div>

                    <!-- 버튼 영역 -->
                    <div class="Btn-area">
                        <button id="goBtn"><a>상세 보기</a></button>
                        <button id="deleteBtn">삭제 하기</button>
                    </div>
                </div>

    
                <!-- 오룬쪽 -->
                <div class="row1">

                    <div class="top">
                        <img class="thumbnail">
                        <div class="companyName"><a>회사이름</a></div>
                    </div>

                    <div class="mid">
                        <div class="fa-solid fa-briefcase"> 신입 ~ 100년차</div>
                        <div class="fa-solid fa-coins"> 연봉 정보 비공개</div>
                    </div>

                    <div class="bottom">
                        <div class="fa-solid fa-desktop"> 사무실 출근</div>
                        <div class="fa-solid fa-location-dot"> 서울 강남</div>
                    </div>

                    <!-- 버튼 영역 -->
                    <div class="Btn-area">
                        <button id="goBtn2"><a>상세 보기</a></button>
                        <button id="deleteBtn2">삭제 하기</button>
                    </div>

                </div>
            </div>
            
        
        </section>

	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-bookmark2.js"></script>
</body>
</html>
