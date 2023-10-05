<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="postList" value="${postList}" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-나의 게시글</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-post.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <section class="ttt">
        <jsp:include page="/WEB-INF/views/mypage/mypage-side.jsp"/>
        


        <%-- 사이드 바 끝 메인 시작 =======================================--%>
        <main>
            <h1 class="Title">나의 게시글</h1>
            <section>
                <div class="postList">
                    <table class="tb">
                        <thead>
                            <tr>
                                <th>제목</th>
                                <th>작성일</th>
                                <th>조회수</th>
                                <th>댓글</th>
                                <th>좋아요</th>
                            </tr>
                        </thead>

                        <tbody>

                            <c:choose>
                                <c:when test="${empty postList}">
                                    <div>게시글 목록이 존재하지 않습니다.</div>
                                </c:when>

                                <c:otherwise>
                                    <c:forEach items="${postList}" var="postList">
                                            <tr>
                                                <td><a href="/board/${postList.boardCode}/${postList.boardNo}">${postList.boardTitle}</a></td>
                                                <td>${postList.createDate}</td>
                                                <td>${postList.readCount}</td>
                                                <td>${postList.commentCount}</td>
                                                <td>${postList.likeCount}</td>
                                            </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </tbody>

                    </table>
                </div>
            
            </section>

        </main>

    </section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
