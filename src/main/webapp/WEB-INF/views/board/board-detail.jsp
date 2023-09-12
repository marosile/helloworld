<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세페이지</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/board/board-detail.css">
    <link rel="stylesheet" href="/resources/css/board/reply.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main id="body-area">
		<div id="main-area">
            <p>${board.boardName}</p>
            <p>🕊️ ${board.boardTitle}</p>

        <div id="heart">
            <div id="heart-left">
                <div id="profile-image">
                    <img src="/resources/images/trand/sample.jpg" id="pic">
                    <div>${board.memberNickname}</div>
                </div>
                <p>${board.createDate}</p>
                <p>조회 90</p>
            </div>

            <div id="heart-right">
                <i class="fa-solid fa-heart fa-2xl"></i>
                <i class="fa-regular fa-bookmark fa-2xl"></i>
            </div>
        </div>

        <div id="text">

            <div id="boardContent">
                <pre>${board.boardContent}
                </pre>
            </div>

         
        </div>

        <div id="tag-area">
            <div id="tag">
                <div>#개발</div>
                <div>#디자인</div>
            </div>

            <div id="button-area">
                <button id="report"><i class="fa-regular fa-face-angry" style="color: rgb(177, 175, 175)"></i> 신고</button>
                <button id="update">수정</button>
                <button id="deleteBtn">삭제</button>
                <button id="list">목록</button>
            </div>
            
            <div class="report-area" id="report-area">
            <span id="close">&times</span>

                <p id="report-title">게시글 신고</p>

                <div id="report-area2">
                    <p>게시글을 신고하는 이유를 작성해주세요 <i class="fa-solid fa-face-sad-tear"></i></p>
                    <textarea></textarea>
                </div>

                <div id="report-button-area">
                    <button id="reportBtn">신고</button>
                    <button id="cancelBtn">취소</button>
                </div>
            </div>



        </div>
        
    </div>
    
    
</main>

    <jsp:include page="/WEB-INF/views/board/reply.jsp"/>            
        
	
	<script src="/resources/js/common/general.js"></script>
	<script src="/resources/js/board/board-detail.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
