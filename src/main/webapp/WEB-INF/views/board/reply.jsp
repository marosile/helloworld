<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<div id="reply-area">

        <div class="reply-list-area">

            <ul id="reply-list">

                <c:forEach items="${board.commentList}" var="comment">

                    <li class="reply-row <c:if test='${comment.parentNo != 0}'>child-comment</c:if>">

                        <p class="reply-writer">

                        <c:if test="${empty comment.profileImage}">
                                <img src="/resources/images/user.png">
                        </c:if>

                        <c:if test="${!empty comment.profileImage}" >
                                    <img src="${comment.profileImage}">
                        </c:if>

                        <span class="name">${comment.memberNickname}</span>

                        <span class="reply-date">${comment.createDate}</span>
                        
                        </p>

                        <p class="reply-content">
                            ${comment.commentContent}
                        </p>

                        <div class="reply-btn-area">
                            <c:if test="${loginMember != null}">
                                <button onclick="showInsertComment(${comment.commentNo}, this)">답글</button>   
                            </c:if>
                        
                            <c:if test="${loginMember.memberId == comment.memberId}" >
                                <button onclick="showUpdateComment(${comment.commentNo}, this)">수정</button>     
                                <button onclick="deleteComment(${comment.commentNo})">삭제</button>
                            </c:if>
                        </div>
                    </li>

                </c:forEach>

            </ul>

            <div class="comment-write-area">
                <textarea id="commentContent"></textarea>

                <c:if test="${boardCode == 1 || boardCode == 2}">
                    <button id="addComment">
                        댓글<br>
                        등록
                    </button>
                </c:if>

                <c:if test="${boardCode == 3}">
                    <button id="addComment">
                        답변<br>
                        하기
                    </button>
                </c:if>

            </div>

    </div>

    </div>
    
	<script src="/resources/js/board/reply.js"></script>


