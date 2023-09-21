<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<section class="container">

    <ul class="nav">
        <li> <a href="/mypage/profile">프로필</a> </li>

        <li> <a href="/mypage/account">계정 관리</a> </li>

        <li> <a href="/mypage/resume">이력서 관리</a> </li>

        <li> <a href="/mypage/applications">지원이력</a> </li>

        <li> <a href="/mypage/bookmark">북마크 목록</a> </li>

        <li> <a href="/mypage/post">나의 게시글</a> </li>

        <li> <a href="/mypage/like">좋</a> </li>

        
    </ul>

</section>

<c:if test="${!empty message}">

    <script>
        // EL/JSTL 구문이 먼저 해석되는데
        // 문자열의 경우 따옴표가 없는 상태이니 붙여줘야한다!!!
        alert("${message}");
    </script>

</c:if>