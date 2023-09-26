<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="bookmarkList2" value="${bookmarkList2}" />

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
            <div>
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
            <div class="category-selected">
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
            <h1 class="Title">북마크</h1>

            <div class="change">
                <h4><span id="community"><a href="/mypage/bookmark">커뮤니티</a></span> | <span id="chae"><a href="/mypage/bookmark2">채용공고</a></span></h4>
            </div>

            <section class="bookmark">

                <c:choose>
                    <div class="bookmarkList">
                        <c:when test="${empty bookmarkList2}">
                            <div>북마크 목록이 존재하지 않습니다.</div>
                        </c:when>


                        <c:otherwise>
                            <c:forEach items="${bookmarkList2}" var="bookmarkList2">
                                <div class="row1">
                                    <div class="top">
                                        <img class="thumbnail" src="${bookmarkList2.companyLogo}">
                                        <div class="companyName"><a href="#">${bookmarkList2.companyName}</a></div>
                                    </div>

                                    <div class="mid">
                                        <div class="fa-solid fa-briefcase"> ${bookmarkList2.experiencePeriod}</div>
                                        <div class="fa-solid fa-coins"> 연봉 정보 비공개</div>
                                    </div>

                                    <div class="bottom">
                                        <div class="fa-solid fa-desktop"> ${bookmarkList2.employeeType}</div>
                                        <div class="fa-solid fa-location-dot"> ${bookmarkList2.companyAddress}</div>
                                    </div>

                                    <div class="Btn-area">
                                        <button id="goBtn">상세 보기</button>
                                        <button id="deleteBtn">삭제 하기</button>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </div>
                </c:choose>
                
            
            </section>

        </main>
    </section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-bookmark2.js"></script>
</body>
</html>
