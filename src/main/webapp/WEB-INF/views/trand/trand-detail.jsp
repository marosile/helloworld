<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="detail" value="${map.trandDetail}" />
<c:set var="comment" value="${map.commentList}" />
<c:set var="topList" value="${map.List}" />
<c:set var="boardNo" value="${map.boardNo}" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트렌드 상세</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/trand/trand-detail.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>

<%
        int i = 1;
    %>

    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">

        <!-- 글 상세div + 인기 탑 10 div -->
        <div id = "divContainer">

            <div id="trandDetailContent">

                <!-- 이미지 + 제목 / 소개  -->
                <div id="postHeader">
                    
                    <div id="headerImage" >
                        <img src="${detail.profileImage}" id="detailWriterImage">
                    </div>
                    
                    <div id="headerNameIntro">
                        <div id="nickName">${detail.memberId}</div>
                        <div id="introduce">${detail.memberNickname}</div>
                    </div>

                    <div id="followButtonDiv">
                        <button id="followBtn">팔로우</button>
                    </div>

                </div>

                <!-- 제목 -->
                <div id="detailTitle">
                    🕊️ ${detail.boardTitle}
                </div>

                <!-- 내용 p태그 쓰는게 맞나 -->
                <div id="pDiv">
                    <p>
                    ${detail.boardContent}
                    </p>
                </div>

                <!-- 작성일 -->
                <div id="writeDate">
                    ${detail.createDate}
                </div>

                <!-- 좋아요 북마크 수정 삭제 목록으로 div-->
                <div id="likeBookMarkUpdateDeleteBack">
                    
                    <!-- 좋아요 북마크 -->
                    <div id="likeBookMark"> 
                    
                        <%-- 좋아요 --%>
                        <div id="like-area">
                            <div>
                                <c:if test="${empty likeCheck}">
                                    <i class="fa-regular fa-heart fa-2xl" id="like"></i>
                                </c:if>

                                <c:if test="${!empty likeCheck}">
                                    <i class="fa-solid fa-heart fa-2xl" id="like" style="color:red"></i>
                                </c:if>
                                <div id="likeCount">${detail.likeCount}</div>
                            </div>  
                        
                        </div>

                        <%-- 북마크 --%>
                        <div id="bookMark-area">
                            <div>
                                <c:if test="${empty bookMarkCheck}">
                                    <i class="fa-regular fa-bookmark fa-2xl" id="bookMark"></i>
                                </c:if>

                                <c:if test="${!empty bookMarkCheck}">
                                    <i class="fa-solid fa-bookmark fa-2xl" id="bookMark"></i>
                                </c:if>
                            </div>
                        </div>

                    </div>

                    <div id="updateDeleteBack">
                        <button class="boardBtns" id="goToBackButton">목록으로</button>
                    </div>


                </div>


                <!-- 댓글 -->
                <div id="replyContainer">

                    <div id="replyCount"><i class="fa-solid fa-eye"></i>  ${detail.readCount}</div>

                    <!-- 댓글 하나하나 나중에 for문 -->
                    <c:choose>
                        <c:when test="${empty comment}">
                            <div class="replys">
                                <div class="replyContents">
                                    댓글이 없습니다. 첫 댓글을 작성해보세요 🤍
                                </div>
                             </div>
                        </c:when>

                        <c:otherwise>
                            <c:forEach items="${comment}" var="comment">
                            <div class="replys">

                                <div class="inReplyfirstDiv">
                                    <div><img src="${comment.profileImage}" class="replyImages"></div>
                                    <div id="replyWriter">${comment.memberId}</div>
                                    <div id="replyCreateDate">(${comment.createDate})</div>
                                </div>

                                <div class="replyContents">
                                    ${comment.commentContent}
                                </div>

                                <div class="replyBtns">
                                    <c:if test="${loginMember.memberId == comment.memberId}" >
                                        <button onclick="showUpdateComment(${comment.commentNo}, this)" class="replyBtn">수정</button>
                                        <button onclick="deleteComment(${comment.commentNo})" class="replyBtn">삭제</button>
                                    </c:if>

                                    <c:if test="${loginMember != null}">
                                        <button onclick="showInsertComment(${comment.commentNo}, this)" class="replyBtn">답글</button>
                                    </c:if>
                                </div>
                            </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>    
                    

                    <!-- 댓글 작성 div -->
                    <div id="replyWrite">

                        <!-- 작성 부분 -->
                        <div id="replyWriteContent">
                            <input type="text" placeholder=" 💬 댓글을 작성해주세요.">
                        </div>

                        <!-- 버튼 부분 -->
                        <div id="replyWriteBtn">
                            <button>작성하기</button>
                        </div>

                    </div>


                </div>

            </div>
            

<!-- /////////////////////////////////////////////////////////////////////////////////////// -->

            <!-- 인기글 top 10 -->
            <div id="top10">
              
                <div id="top10HeaderText"> <img src="/resources/images/logo.svg" id="top10WritersImage">트렌드 인기 TOP 10</div>
                <div></div>

                <!-- 백엔드 할때 for문 돌리기 -->
                <c:forEach items="${topList}" var="list">

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers" style="color:orangered !important"> <%= i++ %> </div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="${list.profileImage}">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            ${list.boardTitle}
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">👩 ${list.memberId}</span> ✍️ ${list.memberNickname}
                        </div>
                    </div>

                </div>

                </c:forEach>

                 <script>
                 const boardCode = "${detail.boardCode}";  // js 사용
                 const boardNo = ${map.boardNo};
                 const loginMemberId = "${loginMember.memberId}"
            </script>

            </div>


        </div>
    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/trand/trand-detail.js"></script>

</body>
</html>