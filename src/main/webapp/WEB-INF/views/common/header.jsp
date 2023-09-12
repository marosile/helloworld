<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/common/header.css">

<jsp:include page="/WEB-INF/views/common/snack-bar.jsp"/>

<header>
    <div id="header-left">
        <img id="header-logo" src="/resources/images/logo.svg" onclick="location.href='/'">
        <p id="header-title" onclick="location.href='/'">Hello, World!</p>
        <div id="header-category">
            <a href="/trand/list" servlet-link="trand">트렌드</a>
            <a href="/board/1" servlet-link="board">커뮤니티</a>
            <a href="/recruit/list" servlet-link="recruit">채용</a>
            <a href="/lecture" servlet-link="lecture">강의</a>
            <a>스터디</a>
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
                <div id="header-login" class="button" onClick="location.href='/member/login'">로그인</div>

            </c:when>

            <c:otherwise>
                <div id="header-login" class="button" onClick="location.href='/member/logout'">로그아웃</div>

            </c:otherwise>

        </c:choose>

        <div id="header-signup" class="button">회원가입</div>

    </div>
</header>

<nav>
</nav>

<script src="/resources/js/common/header.js"></script>
