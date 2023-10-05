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
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section class="ttt">
        <jsp:include page="/WEB-INF/views/mypage/mypage-side.jsp"/>

        <%-- ======= 헤더 끝 메인 시작 --%>
        <main>
            <h1 class="Title">북마크</h1>

            <div class="change">
                <h4><span id="communityy"><a href="/mypage/bookmark">커뮤니티</a></span> | <span id="chae"><a href="/mypage/bookmark2">채용공고</a></span></h4>
            </div>

            <section class="bookmark">

                <div class="bookmarkList">
                    <c:choose>
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
                    </c:choose>

                </div>
                
            </section>

        </main>
    </section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-bookmark2.js"></script>
</body>
</html>
