<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="bookmarkList" value="${bookmarkList}" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-북마크(커뮤니티)</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-bookmark.css">
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

        <%-- ================ 헤더 끝 메인 시작 --%>
        <main>
            <h1 class="Title">북마크</h1>

            <%-- 채용으로 가는 전환 버튼 --%>
            <div class="change">
                <h4><span id="community">커뮤니티</span> | <span id="chae"><a href="/mypage/bookmark2">채용공고</a></span></h4>
            </div>

            <section class="bookmark">

                <c:choose>
                    <%-- 북마크가 비어있다면 --%>
                    <c:when test="${empty bookmarkList}">
                        <div>북마크 목록이 존재하지 않습니다.</div>
                    </c:when>

                    <%-- 비어있지 않다면 --%>
                    <c:otherwise>
                        <div class="bookmarkList">
                            <c:forEach items="${bookmarkList}" var="bookmarkList">
                            
                                <div class="row1">

                                    <div class="top">
                                        <%-- 유저 프사 --%>
                                        <img class="profileImage" src="${bookmarkList.profileImage}">
                                        <%-- 유저 닉네임 --%>
                                        <div class="memberNick">${bookmarkList.memberNickname}</div>
                                        <%-- 게시글 작성일 --%>
                                        <div class="createDate">${bookmarkList.createDate}</div>
                                    </div>

                                    <div class="bottom">
                                        <div class="title">${bookmarkList.boardTitle}</div>

                                        <div class="Count-area">
                                            <div class="viewCount">
                                                <i class="fa-regular fa-eye" id="vcon"></i>
                                                <div id="viewCount">${bookmarkList.readCount}</div>
                                            </div>
                                            <div class="replyCount">
                                                <i class="fa-regular fa-comment-dots" id="rcon"></i>
                                                <div id="replyCount">${bookmarkList.commentCount}</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            
                            </c:forEach>
                        </div>
                    </c:otherwise>

                </c:choose>


            </section>

        </main>

    </section>




    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-bookmark.js"></script>
    
</body>
</html>
