<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<div id="replyContainer">

    <div id="replyCount">
        댓글 : 5
    </div>

    <ul class="reply-list">

    <!-- 댓글 하나하나 나중에 for문 -->
    <c:forEach items="${studyDetail.studyCommentList}" var="comment">

        <li class="replys" id="reply-list <c:if test='${comment.parentNo != 0}'>child-comment</c:if>">

            <div class="inReplyfirstDiv">

                <c:if test="${empty comment.profileImage}">
                    <div><img src="/resources/images/user.png" class="replyImages"></div>
                </c:if>


                <c:if test="${!empty comment.profileImage}">
                    <div><img src="${comment.profileImage}" class="replyImages"></div>
                </c:if>

                <div id="replyWriter">${comment.memberNickname}
                    <div id="replyCreateDate">${comment.createDate}</div>
                </div>

            </div>

            <div class="replyContents">
                    ${comment.commentContent}
            </div>

            <div class="replyBtns">

                <c:if test="${loginMember!=null}">
                    <button class="replyBtn" id="replyBtn" onclick="showInsertComment(${comment.commentNo}, this)">대댓글</button>
                </c:if>

                <c:if test="${loginMember.memberId==comment.memberId}">
                    <button class="replyBtn" id="replyUpdateBtn" onclick="showUpdateComment(${comment.commentNo}, this)">수정</button>
                    <button class="replyBtn" id="replyDeleteBtn" onclick="deleteComment(${comment.commentNo})">삭제</button>
                </c:if>

            </div>
        </li>
    </c:forEach>
    </ul>

    <!-- 댓글 작성 div -->
    <div id="replyWrite">

        <!-- 작성 부분 -->
        <div id="replyWriteContent">
            <input type="text" placeholder="댓글을 작성해주세요." id="commentContent">
        </div>

        <!-- 버튼 부분 -->
        <div id="replyWriteBtn">
            <button id="commentBtn">작성하기</button>
        </div>

    </div>


</div>

<script src="/resources/js/study/studyReply.js"></script>





