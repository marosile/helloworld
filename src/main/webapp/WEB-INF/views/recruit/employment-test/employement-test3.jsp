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
            <p id="number">3/5</p>
            <p id="question">희망하는 연봉을 알려주세요. 💵</p>
            
            <div class="answer">✔️ 최소 2700만</div>
            <div class="answer">✔️ 최소 3000만</div>
            <div class="answer">✔️ 최소 3500만</div>
            <div class="answer">✔️ 최소 4000만</div>
            <div class="answer">✔️ 최소 5000만</div>
            <div class="answer">✔️ 최소 7000만+</div>

            <div id="button3">NEXT</div>

            
        </div>
    </main> 

	<script src="/resources/js/common/general.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
