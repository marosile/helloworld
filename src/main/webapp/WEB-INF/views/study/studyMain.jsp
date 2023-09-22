<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">


<c:if test="${!empty studyList}">
    <c:set var="study" value="${studyList}"/>
</c:if>


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/study/studyMain.css">
    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>

<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/study/study-nav.jsp"/>


<main>

    <div class="P-header">

        <div class="P-main">


            <div class="TOP">
                <div class="P-mainImage-area">
                    <div class="P-mainImage">
                        <img src="https://careerly.co.kr/_next/static/images/img_lounge-banner-1-cb2b8ed2be705e9e38e45f1730482651.svg"
                             n id="P-studylogo">
                    </div>
                    <div class="Ptitle">
                        <h2>스터디 같이 해요🤔</h2>
                        <h4>나에게 맞는 프로젝트나 스터디/ 모임을 찾아 참여하세요!</h4>
                    </div>

                    <div class="P-study-btn-area">
                        <button id="P-study-btn">모집글 작성하기</button>
                    </div>
                </div>
            </div>


            <div class="P-body-category-top">
                <div class="P-body-category-area">

                    <div class="P-body-category-purpose">
                        <button type="button" class="P-body-purpose-btn">위치
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-purpose menuHidden">

                            <li>
                                <button type="button" class="P-option-btn">서울전체</button>
                            </li>

                            <li>
                                <button type="button" class="P-option-btn" id="gangnam-gu" value="강남구">강남구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="gangdong-gu" value="강동구">강동구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="gangbuk-gu" value="강북구">강북구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="gangseo-gu" value="강서구">강서구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="gwanak-gu" value="관악구">관악구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="gwangjin-gu" value="광진구">광진구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="guro-gu" value="구로구">구로구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="geumcheon-gu" value="금천구">금천구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="nowon-gu" value="노원구">노원구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="dobong-gu" value="도봉구">도봉구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="dongdaemun-gu" value="동대문구">동대문구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="dongjak-gu" value="동작구">동작구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="mapo-gu" value="마포구">마포구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="seodaemun-gu" value="서대문구">서대문구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="seochogu" value="서초구">서초구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="seongdong-gu" value="성동구">성동구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="seongbuk-gu" value="성북구">성북구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="songpa-gu" value="송파구">송파구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="yangcheon-gu" value="양천구">양천구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="yeongdeungpo-gu" value="영등포구">영등포구
                                </button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="yongsan-gu" value="용산구">용산구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="eunpyeong-gu" value="은평구">은평구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="jongno-gu" value="종로구">종로구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="jung-gu" value="중구">중구</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="jungrang-gu" value="중랑구">중랑구</button>
                            </li>

                        </ul>

                    </div>


                    <div class="P-body-category-role">

                        <button type="button" class="P-body-category-btn">포지션
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-role menuHidden" id=P-selectBox-role"">
                            <li>
                                <button type="button" class="P-option-btn" id="front">프론트앤드</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="back">백엔드</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="design">디자인</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="Planning">기획</button>
                            </li>
                            <li>
                                <button type="button" class="P-option-btn" id="etc">기타</button>
                            </li>
                        </ul>

                    </div>


                    <div class="P-body-category-count">
                        <button type="button" class="P-body-count-btn">인원
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-count menuHidden">

                            <div class="P-CountPerson">
                                <div class="P-person">
                                    <span class="P-person-span">전체인원</span>
                                    <button type="button" id="P-minusBtn">-</button>
                                    <span id="count">1</span>
                                    <button type="button" id="P-plusBtn">+</button>
                                </div>
                                <button type="button" id="P-personBtn">완료</button>
                            </div>
                        </ul>
                    </div>

                    <div>
                        <button id="searchBtn">검색</button>
                    </div>

                </div>
            </div>


            <div class="TOP">

                <div id="top10TitleButton">
                    <div id="top10Title">
                        <h3>
                            인기 있는 스터디 TOP 10 🔥
                        </h3>
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>


                <div class="swiper-container" id="swiper">
                    <div class="swiper-wrapper">

                        <c:forEach items="${studyTopList}" var="TopList" begin="0" end="4" varStatus="loop">

                            <div class="swiper-slide">

                                    <%--위칸--%>
                                <a href="detail/${studyTopList[loop.index*2].boardNo}">
                                    <div class="post">
                                        <div class="P-study-popular-container-f">
                                            <div class="P-study-popular-category">
                                                <img src="/resources/images/board/number${loop.index * 2 + 1}.png"
                                                     class="top10LevelImage">
                                            </div>

                                            <div>
                                                <div class="P-study-popular-title">
                                                        ${studyTopList[loop.index*2].boardTitle}
                                                </div>
                                                <div class="P-study-popular-content">
                                                        ${studyTopList[loop.index*2].boardContent}
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </a>

                                    <%--아래칸--%>
                                <a href="detail/${studyTopList[loop.index*2+1].boardNo}">
                                    <div class="post">
                                        <div class="P-study-popular-container-f">
                                            <div class="P-study-popular-category">
                                                <img src="/resources/images/board/number${loop.index * 2 + 2}.png"
                                                     class="top10LevelImage">
                                            </div>

                                            <div>
                                                <div class="P-study-popular-title">
                                                        ${studyTopList[loop.index*2+1].boardTitle}
                                                </div>
                                                <div class="P-study-popular-content">
                                                        ${studyTopList[loop.index*2+1].boardContent}
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>


                <div class="P-study">

                    <c:choose>

                        <c:when test="${empty study}">
                            <div>
                                게시글이 존재하지 않습니다.
                            </div>
                        </c:when>

                        <c:otherwise>


                            <c:forEach var="study" items="${study}">

                                <a href="/study/detail/${study.boardNo}">


                                    <div class="P-study-area" id="P-study-area">
                                        <div class="P-study-main">
                                            <span class="P-study-category">스터디</span>

                                        <c:if test="${!empty loginMember}">
                                            <!-- 로그인한 사용자인 경우 -->
                                            <c:if test="${study.likeCount == 0}">
                                               <button id="like"><i class="fa-regular fa-heart" ></i></button>
                                            </c:if>
                                            <c:if test="${study.likeCount == 1}">
                                                <button id="like"><i class="fa-solid fa-heart" ></i></button>
                                            </c:if>
                                        </c:if>

                                        <c:if test="${empty loginMember}">
                                            <!-- 로그인하지 않은 사용자인 경우 -->
                                            <button id="like"><i class="fa-regular fa-heart"></i></button>

                                        </c:if>



                                        </div>

                                        <div class="P-study-title">
                                            <span class="PN">
                                             <c:if test="${study.studyStatus == 'N'}">모집중</c:if>
                                             <c:if test="${study.studyStatus == 'Y'}">모집완료</c:if>
                                            </span>
                                            <span class="PS"> | </span>
                                                ${study.boardTitle}
                                        </div>

                                        <div class="P-study-content">
                                                ${study.boardContent}
                                        </div>

                                        <div class="P-study-common">
                                            <p><span>👍 좋아요 ${study.likeCount} </span></p>
                                            <p><span>👀 조회수 ${study.readCount} </span></p>
                                        </div>

                                    </div>

                                </a>
                            </c:forEach>

                        </c:otherwise>
                    </c:choose>


                    <script>
                        const boardNo = ${study.boardNo}
                        const loginMemberId= "${loginMember.memberId}"
                    </script>

                </div>
            </div>
        </div>
    </div>


</main>
<script src="/resources/js/study/studyMain.js"></script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="/resources/js/common/general.js"></script>


</body>

</html>