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
        <div id="main-area2">
            <p id="number">6/6</p>
            <p id="question2">사용 가능한 기술을 선택해주세요 (복수 선택 가능)</p>
            
            <div class="answer">✔️ JAVA</div>
            <div class="answer">✔️ JavaScript</div>
            <div class="answer">✔️ Spring</div>
            <div class="answer">✔️ Oracle</div>
            <div class="answer">✔️ Visual studio Code</div>
            <div class="answer">✔️ JQuery</div>
            <div class="answer">✔️ Ajax</div>
            <div class="answer">✔️ React</div>
            <div class="answer">✔️ GitHub</div>

            <div class="btn-container">
            <a href="#" class="btn-3d blue" id="button7">DONE 🎉</a>
            </div>

        </div>
    </main> 

	<script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/recruit/recruit-main.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
