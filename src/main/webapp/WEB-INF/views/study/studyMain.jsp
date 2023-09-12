<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

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

<jsp:include page="/WEB-INF/views/common/header.jsp" />
<jsp:include page="/WEB-INF/views/study/study-nav.jsp" />


<main>

    <div class="P-header">

        <div class="P-main">


            <div class="TOP">
                <div class="P-mainImage-area">
                    <div class="P-mainImage">
                        <img src="https://careerly.co.kr/_next/static/images/img_lounge-banner-1-cb2b8ed2be705e9e38e45f1730482651.svg"
                             id="P-studylogo">
                    </div>
                    <div>
                        <h2>스터디 같이 해요🤔</h2>
                        <h4>나에게 맞는 프로젝트나 스터디/ 모임을 찾아 참여하세요!</h4>
                    </div>

                </div>

                <div id="search-area">

                    <div id="search">
                        <div id="search-box">
                            <img id="search-icon" src="/resources/images/magnifier.png">
                            <input id="search-input" placeholder="원하는 유형의 스터디를 검색해보세요."></input>
                        </div>

                        <div class="P-study-btn-area">
                            <button id="P-study-btn">모집글 작성하기</button>
                        </div>
                    </div>
                </div>





            </div>


            <div class="P-body-category-top">
                <div class="P-body-category-area">

                    <div class="P-body-category-role">

                        <button type="button" class="P-body-category-btn">역할
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-role menuHidden" id=P-selectBox-role"">
                            <li><button type="button" class="P-option-btn">프론트앤드</button></li>
                            <li><button type="button" class="P-option-btn">백엔드</button></li>
                            <li><button type="button" class="P-option-btn">디자인</button></li>
                            <li><button type="button" class="P-option-btn">기획</button></li>
                            <li><button type="button" class="P-option-btn">기타</button></li>
                        </ul>

                    </div>

                    <div class="P-body-category-purpose">
                        <button type="button" class="P-body-purpose-btn">목적
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-purpose menuHidden">
                            <li><button type="button" class="P-option-btn">포트폴리오/직무역량 강화</button></li>
                            <li><button type="button" class="P-option-btn">창업/수익 창출</button></li>
                            <li><button type="button" class="P-option-btn">네트워킹</button></li>
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

                        <!-- 나중에 for문 -->
                        <div class="swiper-slide">

                            <div class="post">

                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number1.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <div class="post">

                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number2.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <div class="swiper-slide">
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number3.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number4.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="swiper-slide">
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number5.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number6.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number7.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number8.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="swiper-slide">
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number9.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="post">
                                <div class="P-study-popular-container-f">
                                    <div class="P-study-popular-category">
                                        <img src="/resources/images/board/number10.png" class="top10LevelImage">
                                    </div>

                                    <div>
                                        <div class="P-study-popular-title">
                                            Hello World 웹 개발 같이해요!

                                        </div>
                                        <div class="P-study-popular-content">
                                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>


                <div class="P-study">

                    <div class="P-study-area">

                        <div class="P-study-main">
                            <span class="P-study-category">스터디</span>
                            <span class="P-like-btn">
                                            <!--    <i class="fa-solid fa-heart"></i> 꽉찬하트 -->
                                            <i class="fa-regular fa-heart"></i>
                                        </span>
                        </div>

                        <div class="P-study-title">
                            <span class="PN"> 모집중</span>
                            <span class="PS"> | </span>
                            우리 같이 백엔드 공부하는거 어때요?
                        </div>

                        <div class="P-study-content">
                            안녕하세요.
                            3개월 안에 서비스를 릴리즈할 스터디 팀원을 모집합니다.
                            목적은 실무 역량 및 포트폴리오 만들기이며 수익 창출도 고려 중에 있습니다.
                            많은 관심 부탁드립니다.
                        </div>

                        <div class="P-study-common">
                            <p><span>👍 좋아요</span></p>
                            <p><span>💬 댓글 </span></p>
                        </div>

                    </div>

                    <div class="P-study">
                        <div class="P-study-area">

                            <div class="P-study-main">
                                <span class="P-study-category">스터디</span>
                                <span class="P-like-btn">
                                                <!--    <i class="fa-solid fa-heart"></i> 꽉찬하트 -->
                                                <i class="fa-regular fa-heart"></i>
                                            </span>
                            </div>

                            <div class="P-study-title">
                                <span class="PN"> 모집중</span>
                                <span class="PS"> | </span>
                                우리 같이 백엔드 공부하는거 어때요?
                            </div>

                            <div class="P-study-content">
                                안녕하세요.
                                3개월 안에 서비스를 릴리즈할 스터디 팀원을 모집합니다.
                                목적은 실무 역량 및 포트폴리오 만들기이며 수익 창출도 고려 중에 있습니다.
                                많은 관심 부탁드립니다.
                            </div>

                            <div class="P-study-common">
                                <p><span>👍 좋아요</span></p>
                                <p><span>💬 댓글 </span></p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>



</main>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script src="/resources/js/common/general.js"></script>
<script src="/resources/js/study/studyMain.js"></script>


</body>

</html>






