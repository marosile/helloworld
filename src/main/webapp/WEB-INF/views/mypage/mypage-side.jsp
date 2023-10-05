<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="side" class="window">
    <h6>일반</h6>
    <div>
        <a href="/mypage/profile">
            <img src="/resources/images/mypage/category/profile.png">
            프로필
        </a>
    </div>
    <div>
        <a href="/mypage/account">
            <img src="/resources/images/mypage/category/account.png">
            계정 관리
        </a>
    </div>
    <div>
        <a href="/mypage/resume">
            <img src="/resources/images/mypage/category/applications.png">
            이력서 관리
        </a>
    </div>

    <div>
        <a href="/mypage/post">
            <img src="/resources/images/mypage/category/post.png">
            나의 게시글
        </a>
    </div>
    <div>
        <a href="/mypage/bookmark">
            <img src="/resources/images/mypage/category/bookmark.png">
            북마크 목록
        </a>
    </div>
    <div>
        <a href="/mypage/like">
            <img src="/resources/images/mypage/category/like.png">
            좋아요 목록
        </a>
    </div>
    <c:if test="${loginMember.authority == 1}">
        <h6>강사</h6>
        <div>
            <a href="/mypage/lecture/dashboard">
                <img src="/resources/images/mypage/category/lecture-dashboard.png">
                대시보드
            </a>
        </div>
        <div>
            <a href="/mypage/lecture/manage">
                <img src="/resources/images/mypage/category/lecture-manage.png">
                관리
            </a>
        </div>
    </c:if>
</div>

<script>
    $('[href="' + location.pathname + '"]').parent().addClass('category-selected')
</script>