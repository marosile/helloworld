<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 상세페이지</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/board/board-detail.css">
    <link rel="stylesheet" href="/resources/css/board/reply.css">
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main id="body-area">
		<div id="main-area">
            <p>트렌드</p>
            <p>안녕하세요</p>

        <div id="heart">
            <div id="heart-left">
                <p>8월 17일</p>
                <p>조회 90</p>
            </div>

            <div id="heart-right">
                <i class="fa-solid fa-heart fa-2xl"></i>
                <i class="fa-regular fa-bookmark fa-2xl"></i>
            </div>
        </div>

        <div id="text">
            <div id="images">썸네일/이미지</div>

            <pre>
안녕하세요? 반갑습니다
helloworld~!
            </pre>

            <div id="images-area">
                <div>이미지</div>
                <div>이미지</div>
                <div>이미지</div>
                <div>이미지</div>
            </div>    
        </div>

        <div id="tag-area">
            <div>#해쉬태그</div>
            <div>#해쉬태그</div>
        </div>
        
    </div>
    
    
</main>

    <jsp:include page="/WEB-INF/views/board/reply.jsp"/>            
        
	
	<script src="/resources/js/common/general.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
