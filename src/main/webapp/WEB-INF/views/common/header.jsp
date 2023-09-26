<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/common/header.css">

<script>
    let loginMember;
    <c:if test="${!empty loginMember}">
    loginMember = {'memberId' : '${loginMember.memberId}',
        'memberNick' : '${loginMember.memberNick}',
        'memberEmail' : '${loginMember.memberEmail}'};
    </c:if>
</script>

<jsp:include page="/WEB-INF/views/common/snack-bar.jsp"/>

<c:if test="${!empty loginMember}">
    <div id="community" toggle="off">
        <div id="community-nav">
            <div id="community-nav-1">
                <img onclick="communityToggle()" src="/resources/images/up-arrow.png">
                <div id="community-social">
                    <img src="/resources/images/community/social.png">
                </div>
                <div id="community-chat">
                    <img src="/resources/images/community/chat.png">
                </div>
            </div>
            <div id="community-nav-2">

            </div>
        </div>
        <div id="community-content">
            <div id="social">
                <h2>소셜</h2>
                <h3>팔로워</h3>
                <div id="social-followers"></div>
                <div id="social-following"></div>
            </div>
            <div id="chat">
                <h2>채팅</h2>
                <div id="chat-rooms">
                    <div class="chat-room">
                        <div class="chat-room-thumbnail">
                        </div>
                    </div>
                    <div class="chat-room">
                        <div class="chat-room-thumbnail">
                        </div>
                        <div class="chat-room-content">
                            <h3 class="chat-room-title">asdf</h3>
                            <p class="chat-room-message">123</p>
                        </div>
                    </div>
                </div>
                <div id="chat-message">
                    <div id="chat-message-container"></div>
                    <input id="chat-message-input">
                </div>
            </div>
        </div>
    </div>
</c:if>

<c:if test="${!empty head}">
    <div id="alert">
        <h2>${head}</h2>
        <p>${message}</p>
        <button onclick="confirmAlert()">확인</button>
    </div>
    <script>
        $(document).ready(() => {
            preventScroll(true);
            switchOverlay(true);
        });
    </script>
</c:if>

<div id="modal-overlay"></div>

<header>
    <div id="header-left">
        <img id="header-logo" src="/resources/images/logo.svg" onclick="location.href='/'">
        <p id="header-title" onclick="location.href='/'">Hello, World!</p>
        <div id="header-category">
            <a href="/trand/list" servlet-link="trand">트렌드</a>
            <a href="/board/1" servlet-link="board">커뮤니티</a>
            <a href="/recruit/list" servlet-link="recruit">채용</a>
            <a href="/lecture" servlet-link="lecture">강의</a>
            <a href="/study/main" servlet-link="study">스터디</a>
            <a href="/admin/adminMember" servlet-link="admin">관리자(임시)</a>
        </div>
    </div>
    <div id="header-right">
        <input id="theme-checkbox" type="checkbox" hidden>
        <label for="theme-checkbox">
            <div id="theme-switch">
                <div id="theme-button">
                    <img id="theme-image">
                </div>
            </div>
        </label>
        <c:choose>
            <c:when test="${empty loginMember}">
                <div id="header-login" class="button">로그인</div>
                <div class="loginChange">
                    <div id="header-signup" class="button" onClick="location.href='/member/signUp'">회원가입</div>
                </div>
            </c:when>
            <c:otherwise>
                <div id="header-logout" class="button" onClick="location.href='/member/logout'">로그아웃</div>
                <div class="loginChange">
                    <img src="${loginMember.profileImg}" id="header-mypage" onClick="location.href='/mypage/profile'">
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</header>

<body>
    <div class="modalArea">
        <div>
            <jsp:include page="/WEB-INF/views/common/modal/login.jsp"/>
        </div>
    </div>
</body>


<script src="/resources/js/common/header.js"></script>
<script src="/resources/js/common/modal/login.js"></script>