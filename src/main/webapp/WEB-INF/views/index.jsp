<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/general.jsp"/>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
		<div id="slide-frame">
            <div id="slide-container">
                <div class="slide">4</div>
                <div class="slide">5</div>
                <div class="slide">1</div>
                <div class="slide">2</div>
                <div class="slide">3</div>
            </div>
        </div>
        <div id="slide-bullet-container">
            <div class="slide-bullet" style="background-color: rgb(0, 128, 255);"></div>
            <div class="slide-bullet"></div>
            <div class="slide-bullet"></div>
            <div class="slide-bullet"></div>
            <div class="slide-bullet"></div>
        </div>
        <div id="content" class="page">
        </div>
	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/index.js"></script>
</body>
</html>
