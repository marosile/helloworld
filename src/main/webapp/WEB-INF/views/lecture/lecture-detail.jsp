<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일주일만에 끝내는 리액트 완벽 가이드</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/lecture/lecture-detail.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/color-thief/2.4.0/color-thief.min.js" integrity="sha512-r2yd2GP87iHAsf2K+ARvu01VtR7Bs04la0geDLbFlB/38AruUbA5qfmtXwXx6FZBQGJRogiPtEqtfk/fnQfaYA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <div id="banner-background"></div>
        <div id="main">
            <div id="banner">
                <h1 id="title">${lecture.lectureTitle}</h1>
                <div id="left">
                    <section id="lecture-info">
                        <p>7차시 구성</p>
                        <p>난이도 ·
                            <c:choose>
                                <c:when test="${lecture.lectureDifficulty == 0}">쉬움</c:when>
                                <c:when test="${lecture.lectureDifficulty == 1}">보통</c:when>
                                <c:otherwise>어려움</c:otherwise>
                            </c:choose>
                        </p>
                        <p>수강 기한 · ${lecture.lectureTimeLimit} 일</p>
                    </section>
                    <section id="lecture-rating">
                        <div id="lecture-rating-star">
                            <div id="star-filled">
                                <img src="/resources/images/star-filled.png">
                            </div>
                            <div id="star-unfilled">
                                <img src="/resources/images/star-unfilled.png">
                            </div>
                        </div>
                        <span id="lecture-rating-score"></span>
                    </section>
                    <section id="lecture-tag">
                        <c:forEach var="item" items="${lecture.lectureTags}">
                            <a>${item}</a>
                        </c:forEach>
                    </section>
                </div>
                <%-- <div id="lecturer">
                    <img id="lecturer-profile" src="/resources/images/profile.png">
                    <h3 id="lecturer-name">강사 누구누구</h3>
                </div> --%>
            </div>
            <div id="content" class="window">
                <section id="lecture-nav">
                    <a>강의 소개</a>
                    <a>수강평</a>
                    <a>커뮤니티</a>
                </section>
            </div>
        </div>
        <div id="promotion">
            <img id="thumbnail" src="${lecture.lectureThumbnail}">
            <div id="pay">
                <div id="price">
                    <p id="real-price"><strike>144000 원</strike></p>
                    <p id="sale-price">116000 원</p>
                </div>
                <button id="store-button">장바구니에 담기</button>
                <div id="payment-method"></div>
                <button id="pay-button">지금 구매하기</button>
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/lecture/lecture-detail.js"></script>
</body>