<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 목록</title>
    <%-- <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css"> --%>
    
    <link rel="stylesheet" href="/resources/css/board/board-list.css">

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

</head>
<body>
    
    <!-- 
        C800FF (0, 128, 255)
        0080FF (200, 100, 255) 
    -->

    <!-- 
        background-color: #0080FF;
        background-color: rgb(200, 100, 255); 
    -->

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">
        
        <!-- 게시판 이름 (네비게이션) -->
        <div id = "boardNameList">
                <div class="listNames">공지사항 게시판</div>

                <div class="listNames">자유 게시판</div>

                <div class="listNames">Q&A 게시판</div>
        </div>

        <!-- 게시글 목록 -->
        <div id="postList">
            <div id="boardName"> Q&A 게시판 </div>
            <div id="question"><button id="BoardInsert">질문하기</button></div>
            
        </div>

        <!-- 검색 바 -->
        <div id="searchArea">
            <input type="search" placeholder="키워드로 검색하기" id="searchInput">
            <img src="../images/logo.svg" class="imgs">
        </div>

        <div id="top10">
            <div id="top10TitleButton">
                <div id="top10Title">조회수 TOP 10</div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        
            <div class="swiper-container" id="swiper">
                <div class="swiper-wrapper">
                    <!-- Place posts inside swiper slides -->
                    <div class="swiper-slide">
                        <div class="post">게시글 1</div>
                        <div class="post">게시글 2</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="post">게시글 3</div>
                        <div class="post">게시글 4</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="post">게시글 5</div>
                        <div class="post">게시글 6</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="post">게시글 7</div>
                        <div class="post">게시글 8</div>
                    </div>
                    <div class="swiper-slide">
                        <div class="post">게시글 9</div>
                        <div class="post">게시글 10</div>
                    </div>
                </div>
            </div>
        </div>

            <div id="sortOptions">
                 <a href="#">- 최신순</a>
                 <a href="#">- 조회순</a>
            </div>


            <!-- 임시 게시글 10개 -->
            <div id="post">
                
                <!-- 10개중 하나 -->
                <div class="posts"> <!-- height:250px; -->
                
                    <!-- 하나 중 이미지 + 작성자 + 직군 + 몇분전 -->
                    <div id="postFirstpart">

                        <img src="../images/logo.svg" class="imgs">
                        
                        <div id="firstPartRight">
                            
                            <div>작성자</div>
                            
                            <div>Naver Cloud 백엔드 개발자 - 
                                <span id="minute">4분전</span>
                            </div>

                        </div> 

                    </div>
                        
                        <div id="postSecondPart">
                            Recoil의 상태관리를 활용한 초기값 지켜내기
                        </div>

                        <div id="postThirdPart">
                            안녕하세요! 오랜만이네요.
                            요점부터 말씀드리자면, Recoil에서 default 값을 
                            api로 받아온 데이터를 연산하여 나온 값을 default로 깔고 싶습니다. 현재 프로젝트에서는...
                        </div>
                   
                        <div id="postFourthPart">
                            <div></div>#react #recoil #next.js
                        </div>

                        <div id="postFifthPart">
                            <div id="replyCount">댓글 5</div>
                            <div id="inquiryCount">조회 7</div>
                        </div>


                </div>

                <!-- for문 돌릴거 -->
                <div class="posts"></div>
                <div class="posts"></div>
                <div class="posts"></div>
                <div class="posts"></div>
                <div class="posts"></div>
                <div class="posts"></div>
                <div class="posts"></div>
                <div class="posts"></div>
                <div class="posts"></div>
            </div>
        

        <!-- 임시 페이지네이션 -->
        <div id="pagination">
                << < 1 2 3 4 5 6 7 8 9 10 > >>
        </div>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        // Swiper 초기화
        var mySwiper = new Swiper('.swiper-container', {
            slidesPerView: 3, // 한 화면에 보여질 슬라이드 개수
            slidesPerGroup: 2,    // 한 번에 그룹으로 넘어갈 슬라이드 개수
        spaceBetween: 10,     // 슬라이드 사이의 간격
            navigation: {
                nextEl: '.swiper-button-next', // 다음 버튼 클래스
                prevEl: '.swiper-button-prev', // 이전 버튼 클래스
            },

            
        });
    </script>

</body>
</html>