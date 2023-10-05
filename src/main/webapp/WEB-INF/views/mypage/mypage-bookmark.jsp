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
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section class="ttt">
        <jsp:include page="/WEB-INF/views/mypage/mypage-side.jsp"/>

        <%-- ================ 헤더 끝 메인 시작 --%>
        <main>
            <h1 class="Title">북마크</h1>

            <%-- 채용으로 가는 전환 버튼 --%>
            <div class="change">
                <h4><span id="communityy">커뮤니티</span> | <span id="chae"><a href="/mypage/bookmark2">채용공고</a></span></h4>
            </div>

            <section class="bookmark">

                <c:choose>
                    <c:when test="${empty bookmarkList}">
                        <div>북마크 목록이 존재하지 않습니다.</div>
                    </c:when>

                    <c:otherwise>
                        <div class="bookmarkList">
                            <c:forEach items="${bookmarkList}" var="bookmarkList">

                                <div class="row1">

                                    <div class="top">
                                        <img class="profileImage" src="${bookmarkList.profileImage}">
                                        <div class="memberNick">${bookmarkList.memberNickname}</div>
                                        <div class="createDate">· ${bookmarkList.createDate}</div>
                                    </div>

                                    <div class="bottom">
                                        <div class="title"><a href="/board/${bookmarkList.boardCode}/${bookmarkList.boardNo}">${bookmarkList.boardTitle}</a></div>

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
