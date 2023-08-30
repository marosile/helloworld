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
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
		
        <div class="P-header">
       
        <div class="P-category">
            <a href="">지역</a>
            <a href="">포지션</a>
            <a href="">프로젝트</a>
            <a href="">대면/비대면</a>
        </div>

        <div class="P-main">

            <div class="P-mainImage"></div>

            <h1>스터디 같이 해요🤔</h1>

            <h3>나에게 맞는 프로젝트나 스터티/ 모임을 찾아 참여하세요!</h3>

        </div>

        <br>
    </div>
        
	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
