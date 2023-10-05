<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-나의 게시글</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-applications.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">

    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section class="ttt">
        <div id="side" class="window">
            <h6>일반</h6>
            <div>
                <a href="/mypage/profile">
                    <img src="/resources/images/mypage/category/profile.png">
                    프로필
                </a>
            </div>
            <div>
                <a href="/mypage/account">
                    <img src="/resources/images/mypage/category/account.png">
                    계정 관리
                </a>
            </div>
            <div>
                <a href="/mypage/resume">
                    <img src="/resources/images/mypage/category/applications.png">
                    이력서 관리
                </a>
            </div>
            <div class="category-selected">
                <a href="/mypage/applications">
                    <img src="/resources/images/mypage/category/resume.png">
                    지원 이력
                </a>
            </div>
            <div>
                <a href="/mypage/post">
                    <img src="/resources/images/mypage/category/post.png">
                    나의 게시글
                </a>
            </div>
            <div>
                <a href="/mypage/bookmark">
                    <img src="/resources/images/mypage/category/bookmark.png">
                    북마크 목록
                </a>
            </div>
            <div>
                <a href="/mypage/like">
                    <img src="/resources/images/mypage/category/like.png">
                    좋아요 목록
                </a>
            </div>
            <h6>강사</h6>
            <div>
                <a href="/mypage/lecture/dashboard">
                    <img src="/resources/images/mypage/category/lecture-dashboard.png">
                    대시보드
                </a>
            </div>
            <div>
                <a href="/mypage/lecture/management">
                    <img src="/resources/images/mypage/category/lecture-management.png">
                    관리
                </a>
            </div>
        </div>
        <main>
            
            <h1 class="Title">지원이력</h1>
            <section class="applications">

                <div class="applicationsList">
                    
                    <!-- 왼쪽 -->
                    <div class="row1">

                        <div class="top">
                            <img class="thumbnail" src="/resources/images/member/OKKY.png">
                            <div class="companyName"><a>OKKY</a></div>
                        </div>

                        <div class="mid">
                            <div class="fa-solid fa-briefcase"> 신입 ~ 3년차</div>
                            <div class="fa-solid fa-coins"> 연봉 정보 비공개</div>
                        </div>

                        <div class="bottom">
                            <div class="fa-solid fa-desktop"> 사무실 출근</div>
                            <div class="fa-solid fa-location-dot"> 서울 강남</div>
                        </div>

                        <div class="applyDate">
                            <div class="fa-solid fa-calendar-days">&nbsp;지원일시 : 2023-10-05</div>
                        </div>

                    </div>

        
                    <!-- 오룬쪽 -->
                    <%-- <div class="row1">

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

                        <div class="applyDate">
                            <div class="fa-solid fa-calendar-days">&nbsp;지원일시 : </div>
                        </div>

                    </div> --%>
                </div>
                
            
            </section>


        </main>
    </section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
