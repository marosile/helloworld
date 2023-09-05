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

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>

     <div class="P-header">

        <div class="P-main">

            <div class="P-mainImage-area">
                <div class="P-mainImage">
                    <img src="https://careerly.co.kr/_next/static/images/img_lounge-banner-1-cb2b8ed2be705e9e38e45f1730482651.svg"
                        id="P-studylogo">
                </div>
                <div>
                    <h1>스터디 같이 해요🤔</h1>

                    <h3>나에게 맞는 프로젝트나 스터디/ 모임을 찾아 참여하세요!</h3>
                </div>
                <button id="P-study-btn">모집글 작성하기</button>
              
            </div>

      
            <!--  검색창
            <div class="search-container">
                <input type="text" class="search-input" placeholder="검색어를 입력하세요">
                <button class="search-button">검색</button>
            </div> 
            -->

            <hr>

            <div class="P-study-btn-area">
                <button><span class="P-study-btn-l">◾ 최신순</span></button>
                <button><span class="P-study-btn-p">◾ 인기순</span></button>
            </div>

            <div class="P-study-popular">
                <div>
                    <h1>
                        인기 있는 스터티 TOP 10 🔥
                    </h1>

                    <h4>
                        가장 인기 있는 스터디를 확인해보세요!
                    </h4>
                </div>

                <div class="P-study-popular-icon">
                    <i class="fa-solid fa-arrow-left"></i>
                    <i class="fa-solid fa-arrow-right"></i>
                </div>
            </div>



            <div class="P-study-popular-area">
                <div class="P-study-popular-container">
                    <div class="P-study-popular-container-f">
                        <div class="P-study-popular-category">
                            사이드 프로젝트
                        </div>
                        <div class="P-study-popular-title">
                            Hello World 웹 개발 같이해요!
                        </div>
                        <div class="P-study-popular-content">
                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                        </div>
                    </div>
                </div>

                <div class="P-study-popular-container">
                    <div class="P-study-popular-container-f">
                        <div class="P-study-popular-category">
                            사이드 프로젝트
                        </div>
                        <div class="P-study-popular-title">
                            Hello World 웹 개발 같이해요!
                        </div>
                        <div class="P-study-popular-content">
                            개발자를 위한 커뮤니티를 만들고 싶은데 같이 만들어봐요!
                        </div>
                    </div>
                </div>
            </div>

            <div class="P-study">

                <div class="P-study-area">

                    <div class="P-study-main">
                        <span class="P-study-category">사이드프로젝트</span>
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
                        3개월 안에 서비스를 릴리즈할 사이드 프로젝트 팀원을 모집합니다.
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
                            <span class="P-study-category">사이드프로젝트</span>
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
                            3개월 안에 서비스를 릴리즈할 사이드 프로젝트 팀원을 모집합니다.
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

        
	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
