<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 목록</title>
   <link rel="stylesheet" href="/resources/css/common/general.css">

    
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
        <div id="divContainer">
        <!-- 게시판 이름 (네비게이션) -->
        <div id = "boardNameList">
                <div class="listNames">공지사항 게시판</div>

                <div class="listNames">자유 게시판</div>

                <div class="listNames">Q&A 게시판</div>
        </div>

        <!-- 게시글 목록 -->
        <div id="postList">
            <div id="boardName"> Q&A 게시판 </div>
            <div id="question"><button id="BoardInsert">작성하기</button></div>
        </div>

        <!-- 검색 바 -->
        <div id="searchArea">
            <input type="search" placeholder="키워드로 검색하기" id="searchInput">
            <img src="/resources/images/board/search1.png" class="searchInputImage">
        </div>

        <div id="top10">
            <div id="top10TitleButton">
                <div id="top10Title">조회수 TOP 10</div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        
            <div class="swiper-container" id="swiper">
                <div class="swiper-wrapper">

                    <!-- 나중에 for문 -->
                    <div class="swiper-slide">
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number1.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                        
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number2.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number3.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number4.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="swiper-slide">
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number5.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number6.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number7.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number8.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="swiper-slide">
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number9.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
                        <div class="post">
                            <div id="directionRow">
                                <div>
                                    <img src="/resources/images/board/number10.png" class="top10LevelImage">
                                </div>  
                                <div id="top10BoardTitle">  
                                    <div class="top10Titles">제목입니다.제목입니다.</div>
                                    <div class="top10Inquirys">조회 1500 댓글 35</div>
                                </div>
                            </div>

                        </div>
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
                <div class="posts"> <!-- height:250 px; -->
                
                    <!-- 하나 중 이미지 + 작성자 + 직군 + 몇분전 -->
                    <div id="postFirstpart">

                        <img src="/resources/images/logo.svg" class="writerImages">
                        
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
        

        <!-- 임시 페이지네이션 (무한스크롤로 변경) -->
        <div id="pagination">
                << < 1 2 3 4 5 6 7 8 9 10 > >>
        </div>
        </div>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
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