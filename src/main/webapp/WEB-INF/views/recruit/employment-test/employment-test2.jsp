<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 테스트1</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/recruit/employment-test.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
     <main id="body-area">
        <div id="main-area">
            <p id="number">2/6</p>

            <p id="question">몇 년차 채용 공고를 보여드릴까요? 🔎</p>

            <p id="term">신입-1년</p>
            <input type="range" id="slider" min="0" max="70" list="marks">
            <datalist id="marks">
                <option value="0">전체</option>
                <option value="05">신입</option>
                <option value="10">1년</option>
                <option value="20">2년</option>
                <option value="30">3년</option>
                <option value="40">4년</option>
                <option value="50">5년</option>
                <option value="60">6년</option>
                <option value="70">7년+</option>
            </datalist>



            <div class="btn-container">
            <a href="#" class="btn-3d blue" id="button4">NEXT</a>
            </div>

        </div>
    </main> 

	<script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/recruit/recruit-main.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
