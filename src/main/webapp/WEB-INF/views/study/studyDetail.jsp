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
    <link rel="stylesheet" href="/resources/css/study/studyDetail.css">
    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>


    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955d027ad541e959373216700e779cf3&libraries=services"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<main id="main">

    <!-- 글 상세div + 인기 탑 10 div -->
    <div id="divContainer">

        <div id="trandDetailContent">

            <!-- 이미지 + 제목 / 소개  -->
            <div id="postHeader">


                <div class="P-study-detail-category">
                    <div>
                        스터디
                    </div>


                </div>

                <div class="P-study-detail-title">
                        <span class="PN" style="color: ${studyDetail.studyStatus == 'Y' ? 'gray' : 'royalblue'}">
                        <c:if test="${studyDetail.studyStatus == 'N'}">모집중</c:if>
                        <c:if test="${studyDetail.studyStatus == 'Y'}">모집완료</c:if>
                        </span>
                    <span class="PS"> | </span>
                    ${studyDetail.boardTitle}
                </div>


                <div class="P-study-detail-location-area">
                        <span class="P-study-datail-location">
                            ${studyDetail.createDate}
                        </span>

                </div>
            </div>

            <div id="studyInfoArea">

                <div class="studyContainer">
                    <div class="studyInfoRole">📍 같이 공부하고 싶은 위치</div>
                    <div class="studyTag">${studyDetail.location}</div>
                </div>

                <div class="studyContainer">
                    <div class="studyInfoRole">
                        📝 같이 공부할 분야
                    </div>
                    <div class="studyTag">${studyDetail.tagNm}</div>

                </div>

                <div class="studyContainer">
                    <div class="studyInfoRole">
                        💻 같이 공부 할 인원 수
                    </div>
                    <div class="studyTag">${studyDetail.headCount}명</div>

                </div>
            </div>


            <!-- 제목 -->
            <div id="detailTitle">
                상세설명
            </div>


            <div id="pDiv">
                ${studyDetail.boardContent}
            </div>

            <!-- 작성일 -->
            <div id="writeDate">

            </div>

            <%--            <div class="P-study-detail-container">
                            <div class="P-study-detail-tag">
                                <span># ${studyDetail.tagNm}</span>
                            </div>
                        </div>--%>


            <!-- 좋아요 북마크 수정 삭제 목록으로 div-->
            <div id="likeBookMarkUpdateDeleteBack">

                <!-- 좋아요 북마크 -->
                <div class="P-study-datail-footer-area">
                    <p>
                        <c:if test="${empty likeCheck}">
                            <i class="fa-regular fa-heart" id="like"> 좋아요</i>
                        </c:if>

                        <c:if test="${!empty likeCheck}">
                            <i class="fa-solid fa-heart" id="like"> 좋아요</i>
                        </c:if>

                        <span id=count>${studyDetail.likeCount}</span>
                    </p>
                    <p>&nbsp • &nbsp</p>

                    <p>
                        <i class="fa-regular fa-face-smile"> 조회</i>
                        <b>${studyDetail.readCount}</b>
                    </p>
                </div>


                <div id="updateDeleteBack">

                    <button class="boardBtns" id="goToBackBtn">목록</button>

                </div>


            </div>


            <!-- 댓글 -->
            <jsp:include page="/WEB-INF/views/study/studyReply.jsp"/>

        </div>

        <div class="P-profile-area">

            <%--내가 작성한 게시글이라면--%>
            <c:if test="${loginMember.memberId == studyDetail.memberId}">

                <div class="P-profile-container">
                    <!-- 프로필 이미지 -->
                    <a href="" class="P-profile-pro">
                        <img src="${loginMember.profileImg}"
                             class="P-profile-image">
                    </a>

                    <!-- 이름 및 회사 정보 -->
                    <p>${loginMember.memberNick}</p>
                    <p>KH정보교육원</p>

                    <!-- 수정하기/모집하기버튼 -->
                    <div class="P-profile-buttons">
                        <button id="updateBtn">수정하기</button>
                        <button id="deleteBtn">삭제하기</button>
                        <button id="completeBtn">모집완료</button>
                    </div>
                </div>


            </c:if>

            <%--내가 작성하지 않은 게시글이라면--%>
            <c:if test="${loginMember.memberId != studyDetail.memberId}">

                <div class="P-profile-container">
                    <!-- 프로필 이미지 -->
                    <a href="" class="P-profile-pro">
                        <img src="/resources/images/logo.png"
                             class="P-profile-image">
                    </a>

                    <!-- 이름 및 회사 정보 -->
                    <p>${studyDetail.memberNickname}</p>
                    <p>KH정보교육원</p>

                    <!-- 공유하기 및 문의하기 버튼 -->
                    <div class="P-profile-buttons">
                        <button id="contact-button">채팅하기</button>

                        <c:if test="${empty followCheck}">
                            <button id="share-button"><i class="fa-solid fa-user-plus"></i>
                                <span id="followSpan">팔로우</span></button>
                        </c:if>

                        <c:if test="${!empty followCheck}">
                            <button id="share-button" class="fa-check"><i class="fa-solid fa-check"></i>
                                <span id="followingSpan">팔로잉</span></button>
                            </button>
                        </c:if>


                    </div>
                </div>


            </c:if>

            <input type="hidden" id="loginMemberId" value="${loginMember.memberId}"/>
            <input type="hidden" id="boardNo" value="${studyDetail.boardNo}"/>
            <input type="hidden" id="userId" value="${studyDetail.memberId}"/>


        </div>


</main>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script src="/resources/js/common/general.js"></script>
<script src="/resources/js/study/studyDetail.js"></script>
</body>
</html>
