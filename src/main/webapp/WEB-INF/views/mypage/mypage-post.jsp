<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="postList" value="${postList}" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-나의 게시글</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-post.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">
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
            <div class="category-selected">
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
        


        <%-- 사이드 바 끝 메인 시작 =======================================--%>
        <main>
            <h1 class="Title">나의 게시글</h1>
            <section>
                <div class="postList">
                    <table class="tb">
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>댓글</th>
                                <th>좋아요</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:choose>
                                <c:when test="${empty postList}">
                                    <div>게시글 목록이 존재하지 않습니다.</div>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach items="${postList}" var="postList">
                                            <tr>
                                                <td><a href="/board/${postList.boardCode}/${postList.boardNo}">${postList.boardTitle}</a></td>
                                                <td>${postList.createDate}</td>
                                                <td>${postList.readCount}</td>
                                                <td>${postList.commentCount}</td>
                                                <td>${postList.likeCount}</td>
                                            </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>

                    </table>
                </div>
            
            </section>

        </main>

    </section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
