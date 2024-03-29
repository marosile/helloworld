<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="/resources/css/recruit/recruit-nav.css">

<recruitNav>
    <div id="navContainer">
        <a href="allNoticeList">전체 채용 공고</a>
        <a href="/recruit/noticeList">내 매칭 공고</a>
        <c:if test="${loginMember.authority == 2}">
            <a href="post">채용 공고 등록</a>
        </c:if>
        <c:if test="${loginMember.authority != 2}">
        <a href="application">기업 담당자 신청</a>
        </c:if>
    </div>
</recruitNav>
