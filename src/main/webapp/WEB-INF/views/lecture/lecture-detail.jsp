<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬로월드 - ${lecture.lectureTitle}</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/lecture/lecture-detail.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/color-thief/2.4.0/color-thief.min.js" integrity="sha512-r2yd2GP87iHAsf2K+ARvu01VtR7Bs04la0geDLbFlB/38AruUbA5qfmtXwXx6FZBQGJRogiPtEqtfk/fnQfaYA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>
</head>
<body>
    <script>
        let lecture = {'lectureNo' : ${lecture.lectureNo},
                        'lectureTitle' : '${lecture.lectureTitle}',
                        'lecturePrice' : ${lecture.lecturePrice * (1 - lecture.lectureSale)}};
    </script>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <div id="banner-background"></div>
        <div id="main">
            <div id="banner">
                <h1 id="title">${lecture.lectureTitle}</h1>
                <div id="left">
                    <section id="lecture-info">
                        <p>7차시 구성</p>
                        <p>수강기한 · 무제한</p>
                        <p>난이도 ·
                            <c:choose>
                                <c:when test="${lecture.lectureDifficulty == 0}">쉬움</c:when>
                                <c:when test="${lecture.lectureDifficulty == 1}">보통</c:when>
                                <c:otherwise>어려움</c:otherwise>
                            </c:choose>
                        </p>
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
                            <a>#${item}</a>
                        </c:forEach>
                    </section>
                </div>
                <div id="lecturer">
                    <img id="lecturer-profile" src="${lecture.lecturer.profileImg}">
                    <h3 id="lecturer-name">${lecture.lecturer.memberNick}</h3>
                </div>
            </div>
            <div id="content" class="window">
                <section id="lecture-nav">
                    <a class="selected" category="intro">강의 소개</a>
                    <a style="display: none" category="lessons">수업</a>
                    <a category="reviews">수강평</a>
                </section>
                <section id="lecture-intro">
                    ${lecture.lectureIntro}
                </section>
                <section id="lecture-reviews">
                    <div id="write-review">
                        <div id="write-review-head">
                            <p>수강평 작성</p>
                            <div id="write-review-star">
                                <div id="write-review-star-filled">
                                    <img src="/resources/images/star-filled.png">
                                </div>
                                <div id="write-review-star-unfilled">
                                    <img src="/resources/images/star-unfilled.png">
                                </div>
                            </div>
                        </div>
                        <textarea id="write-review-content"></textarea>
                        <div id="write-review-bottom">
                            <button id="write-review-button" type="button" onclick="writeReview()">작성하기</button>
                        </div>
                    </div>
                    <div id="reviews-container">
                        <div class="review">
                            <div class="member">
                                <div class="profile">
                                    <img>
                                </div>
                                <div class="info">
                                    <div class="nickname">닉네임</div>
                                </div>
                            </div>
                            <div class="star">별점</div>
                            <div class="content">내용</div>
                        </div>
                    </div>
                </section>
                <section id="lecture-lessons">
                    <c:forEach var="item" items="${lecture.lessons}">
                        <div class="lesson">
                            <div class="lesson-thumbnail"></div>
                            <div class="lesson-title"></div>
                        </div>
                    </c:forEach>
                </section>
            </div>
        </div>
        <div id="promotion">
            <img id="thumbnail" src="${lecture.lectureThumbnail}">
            <c:choose>
                <c:when test="${empty loginMember}">
                    <div id="needToLogin">
                        <p>로그인 후 이용해 주세요.</p>
                        <a onclick="modalArea.style.display = 'block';">로그인</a>
                    </div>
                </c:when>
                <c:when test="${loginMember.memberId != lecture.memberId}">
                    <c:choose>
                        <c:when test="${lecture.lecturePrice == 0}">
                            <div id="price">
                                <p id="sale-price">무료</p>
                            </div>
                            <div id="buttons">
                                <button class="primary-button">지금 수강하기</button>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div id="price">
                                <c:choose>
                                    <c:when test="${lecture.lectureSale == 0}">
                                        <p id="sale-price"><fmt:formatNumber value="${lecture.lecturePrice}"/> 원</p>
                                    </c:when>
                                    <c:otherwise>
                                        <p id="real-price">
                                            <strike><fmt:formatNumber value="${lecture.lecturePrice}"/> 원</strike> (-<fmt:formatNumber value="${lecture.lectureSale}" type="percent"/>)
                                        </p>
                                        <p id="sale-price"><fmt:formatNumber value="${lecture.lecturePrice * (1 - lecture.lectureSale)}"/> 원</p>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div id="buttons">
                                <button class="primary-button" onclick="purchase()">지금 구매하기</button>
                                <button class="secondary-button" onclick="addToCart()">장바구니에 담기</button>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:when>
                <c:otherwise>
                    <div id="buttons">
                        <button class="primary-button" onclick="location.href = '/lecture/write?no=${lecture.lectureNo}'">수정하기</button>
                        <button class="secondary-button">삭제하기</button>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </main>
    <div id="payment">
        <div id="payment-method"></div>
        <div id="agreement"></div>
        <div id="payment-button">
            <button onclick="purchase()">취소하기</button>
            <button onclick="requestPurchase()">결제하기</button>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/lecture/lecture-detail.js"></script>
</body>