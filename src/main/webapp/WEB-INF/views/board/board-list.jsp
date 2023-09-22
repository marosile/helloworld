<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="board" value="${map.boardList}" />
<c:set var="getTopList" value="${map.getTopList}" />


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 목록</title>
   <link rel="stylesheet" href="/resources/css/common/general.css">

    
    <link rel="stylesheet" href="/resources/css/board/board-list.css">

    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">
        <div id="divContainer">
        <!-- 게시판 이름 (네비게이션) -->
        <div id = "boardNameList">

            <a href="/board/1" class="${boardCode == 1 ? 'active' : ''}">
                <div class="listNames">공지사항 게시판</div>
            </a>

            <a href="/board/2" class="${boardCode == 2 ? 'active' : ''}">
                <div class="listNames">자유 게시판</div>
            </a>

            <a href="/board/3" class="${boardCode == 3 ? 'active' : ''}">
                <div class="listNames">Q&A 게시판</div>
            </a>

        </div>

        <!-- 게시글 목록 -->
        <div id="postList">
            <form action="/board2/${boardCode}/write" method="get">
            <img src="https://careerly.co.kr/_next/static/images/img_lounge-banner-3-47e86ec10e6adf3bb01dd471d47295bc.svg" id="list-logo">
            <div id="boardName">
                <c:if test="${boardCode == 1}">공지사항 🔊</c:if>

                <c:if test="${boardCode == 2}">자유 게시판 💬</c:if>

                <c:if test="${boardCode == 3}">Q&A 게시판 💁‍♀️</c:if>
            </div>

            <button id="boardInsert">작성하기</button>

            
            </form>
        </div>

        <form action="${boardCode}" method="get" id="boardSearch">
            <div id="searchArea">
                <input type="search" name="searchKeyword" placeholder="키워드로 검색하기" id="searchInput">
                <input type="image" src="/resources/images/board/search1.png" alt="검색" id="searchInputImage">  
            <%-- input image는 클릭하면 form을 제출함. alt 속성의 값은 이미지에 대한 간결한 설명 또는 목적--%>
            </div>
        </form>

        <div id="top10">
            <div id="top10TitleButton">
                <div id="top10Title">조회수 TOP 10</div>
                <div class="swiper-button-prev"></div>
                <div class="swiper-button-next"></div>
            </div>
        
            <div class="swiper-container" id="swiper">
                <div class="swiper-wrapper">

                    <c:forEach items="${getTopList}" var="TopList" begin="0" end="4" varStatus="loop">

                        <div class="swiper-slide">

                            <a href="/board/${getTopList[loop.index * 2].boardCode}/${getTopList[loop.index * 2].boardNo}">
                                <div class="post">
                                    <div id="directionRow">
                                        <div>
                                            <img src="/resources/images/board/number${loop.index * 2 + 1}.png" class="top10LevelImage">
                                        </div>  
                                        <div id="top10BoardTitle">  
                                            <div class="top10Titles">${getTopList[loop.index * 2].boardTitle}</div>
                                            <div class="top10Inquirys">조회 ${getTopList[loop.index * 2].readCount} 댓글 ${getTopList[loop.index * 2].commentCount}</div>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            
                            <a href="/board/${getTopList[loop.index * 2 + 1].boardCode}/${getTopList[loop.index * 2 + 1].boardNo}">
                                <div class="post">
                                    <div id="directionRow">
                                        <div>
                                            <img src="/resources/images/board/number${loop.index * 2 + 2}.png" class="top10LevelImage">
                                        </div>  
                                        <div id="top10BoardTitle">  
                                            <div class="top10Titles">${getTopList[loop.index * 2 + 1].boardTitle}</div>
                                            <div class="top10Inquirys">조회 ${getTopList[loop.index * 2 + 1].readCount} 댓글 ${getTopList[loop.index * 2 + 1].commentCount}</div>
                                        </div>
                                    </div>
                                </div>
                            </a>

                        </div>
                    </c:forEach>
                   
                </div>
                
            </div>
        </div>

            <div id="sortOptions">
                 <div id ="recentSortButton" class="selected">- 최신순</div>
                 <div id="readCountSortButton">- 조회순</div>
            </div>

            <!-- 임시 게시글 10개 -->
            <div id="post">
                
                <!-- 첫화면 -> 10개 -->
                   <c:choose>
                        <c:when test="${empty board}">
                            <style>
                                #post { display:flex; font-weight:bold; font-size:20px; margin-top:0;}
                                #sortOptions {display:none;}
                                #top10 {margin: 20px 0;}
                            </style>
                            <div id="post">
                                '${searchKeyword}' 에 대한 게시글이 존재하지 않습니다.
                            </div>
                        </c:when>

                    <c:otherwise>

                        <c:forEach items="${board}" var="board" begin="0" end="9">


                            <a href="/board/${boardCode}/${board.boardNo}">

                            <div class="posts"> <!-- height:250 px; -->
                                <!-- 하나 중 이미지 + 작성자 + 직군 + 몇분전 양식-->
                                <div class="postFirstpart">
                                    <img src="/resources/images/logo.svg" class="writerImages">
                                    <div class="firstPartRight">
                                        <div>${board.memberNickname} </div>
                                        
                                        <div>
                                            <span id="minute">${board.createDate}</span>
                                        </div>

                                    </div> 

                                </div>
                                    
                                <div class="postSecondPart">
                                    ${board.boardTitle}
                                </div>

                                <div class="postThirdPart">
                                    ${board.boardContent} 
                                </div>
                        
                                <div class="postFourthPart">

                                        <c:forEach items="${board.tagList}" var="tag">
                                           #${tag.tagName}
                                        </c:forEach>

                                </div>

                                <div class="postFifthPart">
                                    <div class="replyCount">댓글 ${board.commentCount}</div>
                                    <div class="inquiryCount">조회수 ${board.readCount}</div>
                                </div>
                            </div>
                            </a>


                        </c:forEach>
                    
                    </c:otherwise>
                </c:choose>
              
            </div>

            <div id="loadingModal" class="modal">
                <div class="modal-content">
                    <div class="loader"></div>
                    <div class="loading">로딩중</div>
                </div>
            </div> <!-- 로딩이 0.1초만에 되면 모달창이 0.1초만 보여서 일단 1초로 세팅함 -->
                   <!-- 로딩이 5초걸리면 모달창 로딩중은 1초만 보이고 사라지는데 -->
                   <!-- 모달창이 사라져도 화면이 안바뀌는 이슈가 이씀 -->

            <script>
                 const boardCode = "${boardCode}"; 
                 const boardList = "${board}"
            </script>


    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    
    <script src="/resources/js/board/board-list.js"></script>

</body>
</html>