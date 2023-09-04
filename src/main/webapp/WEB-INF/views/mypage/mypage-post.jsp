<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-나의 게시글</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-post.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>
        
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
                        <tr>
                            <td><a>제목이다</a></td>
                            <td>작성일이고</td>
                            <td>조회수고</td>
                            <td>댓글임</td>
                            <td>좋아오</td>
                        </tr>

                        <tr>
                            <td><a>제목이다</a></td>
                            <td>작성일이고</td>
                            <td>조회수고</td>
                            <td>댓글임</td>
                            <td>좋아오</td>
                        </tr>

                        <tr>
                            <td><a>제목이다</a></td>
                            <td>작성일이고</td>
                            <td>조회수고</td>
                            <td>댓글임</td>
                            <td>좋아오</td>
                        </tr>


                    </tbody>


                </table>






            </div>

                







        
        
        
        
        </section>
        


	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
