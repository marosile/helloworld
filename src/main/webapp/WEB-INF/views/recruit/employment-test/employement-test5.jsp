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
            <p id="number">5/5</p>
            <p id="question2">선호 하는 근무 지역을 모두 선택해주세요. 🗾</p>
            
            <div class="answer">✔️ 서울 전체</div>
            <div class="answer">✔️ 서울 종로</div>
            <div class="answer">✔️ 서울 구로</div>
            <div class="answer">✔️ 서울 강남</div>
            <div class="answer">✔️ 서울 성동</div>
            <div class="answer">✔️ 판교</div>

            <div id="button3">DONE 🔎</div>

        </div>
    </main> 

	<script src="/resources/js/common/general.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
