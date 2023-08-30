<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <p>제목을 입력하세요.</p>
        <div id="heart">
            <p>8월 17일</p>
            <p>조회 90</p>
            <p>하트</p>
            <p>북마크</p>
        </div>

        <div id="text">글 내용</div>

        <div id="tag">
            <div>#해쉬태그</div>
            <div>#해쉬태그</div>
        </div>

        
         <jsp:include page="/WEB-INF/views/board/reply.jsp"/>

        </div>
	</main>
	
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
