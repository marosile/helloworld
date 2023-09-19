<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-북마크(커뮤니티)</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-bookmark.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">

    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>

        <h1 class="Title">북마크</h1>

        <div class="change">
            <h4><span id="community">커뮤니티</span> | <span id="chae"><a href="/mypage/bookmark2">채용공고</a></span></h4>
        </div>

        <section class="bookmark">

            <div class="bookmarkList">
                <div class="row1">
                    <div class="top">
                        <!-- 유저 프사 -->
                        <img class="profileImage" src="/resources/images/user.png">
                        <!-- 유저 닉네임 -->
                        <div class="memberNick">유저일이다</div>
                        <!-- 게시글 작성일 -->
                        <div class="createDate">2023-05-05</div>
                    </div>

                    <div class="bottom">
                        <div class="title">제목이다 리액트 재 시험 대신 봐줄사람 구합니다....</div>

                        <div class="Count-area">
                            <div class="viewCount">
                                <i class="fa-regular fa-eye" id="vcon"></i>
                                <div id="viewCount">30</div>
                            </div>
                            <div class="replyCount">
                                <i class="fa-regular fa-comment-dots" id="rcon"></i>
                                <div id="replyCount">3</div>
                            </div>
                        </div>
                    </div>
                </div>




                <div class="row1">
                    <div class="top">
                        <img class="thumbnail" src="/resources/images/member/당근.png">
                        <div class="companyName"><a>당근 마켓</a></div>
                    </div>

                    

                    
                </div>
    
                
            </div>
            
        
        </section>

	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-bookmark.js"></script>
    
</body>
</html>
