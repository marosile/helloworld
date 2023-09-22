
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

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main id="body-area">
		<div id="main-area">

            <p>${board.boardName}</p>
            <p>${board.boardTitle}</p>

        <div id="heart">
            <div id="heart-left">
                <div id="profile-image">

                <c:choose>
                    <c:when test="${empty board.profileImage}">
                        <img src="/resources/images/user.png" id="pic">
                    </c:when>

                    <c:otherwise>
                        <img src="${board.profileImage}" id="pic">
                    </c:otherwise>
                </c:choose>

                    <div>${board.memberNickname}</div>
                </div>
                <p>${board.createDate}</p>
                <p><span>조회수</span> ${board.readCount}</p>
            </div>

            <div id="heart-right">

            <%-- 북마크 --%> 
            <%-- 북마크 누른적이 없거나 로그인 x --%>
            <c:if test="${empty bookMarkCheck}">
                <i class="fa-regular fa-bookmark fa-2xl" id="bookMark"></i>
            </c:if>

            <c:if test="${!empty bookMarkCheck}">
                <i class="fa-solid fa-bookmark fa-2xl" id="bookMark"></i>
            </c:if>

            <%-- 좋아요 --%>
            <%-- 좋아요 누른적이 없거나 로그인 안됨 --%>
            <c:if test="${empty likeCheck}">
                <i class="fa-regular fa-heart fa-2xl" id="like"></i>
            </c:if>

            <c:if test="${!empty likeCheck}">
                <i class="fa-solid fa-heart fa-2xl" id="like" style="color:red"></i>
            </c:if>
            <span id="likeCount">${board.likeCount}</span>

            </div>
        </div>

        <div id="text">

            <div id="boardContent">
                ${board.boardContent}
            </div>

         
        </div>

        <div id="tag-area">
            <div id="tag">
                <c:forEach items="${tagList}" var="tag">
                    <div>#${tag.tagName}</div>
                </c:forEach>
            </div>

            <div id="button-area">
                <c:if test="${loginMember != null && loginMember.memberId != board.memberId}">
                    <button id="report"><i class="fa-regular fa-face-angry" style="color: rgb(177, 175, 175)"></i> 신고</button>
                </c:if>

                <c:if test="${loginMember.memberId == board.memberId}">
                    <button id="update">수정</button>
                    <button id="deleteBtn">삭제</button>
                </c:if>
                <button id="list">목록</button>
            </div>
            
            <%-- 신고 모달창 --%>
            <div class="report-area" id="report-area">
            <span id="close">&times</span>

                <p id="report-title">게시글 신고</p>

                <div id="report-area2">
                    <p>게시글을 신고하는 이유를 작성해주세요 <i class="fa-solid fa-face-sad-tear"></i></p>
                    <textarea id="report-content"></textarea>
                </div>

                <div id="report-button-area">
                    <button id="reportBtn">신고</button>
                    <button id="cancelBtn">취소</button>
                </div>
            </div>

            <script>
                 const boardCode = "${boardCode}";  // js 사용
                 const boardNo = "${boardNo}";
                 const loginMemberId = "${loginMember.memberId}"
            </script>

        </div>
        
    </div>
    
    
</main>

    <jsp:include page="/WEB-INF/views/board/reply.jsp"/>            
        
	
	<script src="/resources/js/common/general.js"></script>
	<script src="/resources/js/board/board-detail.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>