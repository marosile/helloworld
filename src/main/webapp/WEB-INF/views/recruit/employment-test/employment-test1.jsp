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
            <p id="number">1/5</p>
            <p id="question">찾고 있는 직무를 선택하세요. 💻</p>
            
            <div class="answer">✔️ 프론트엔드 개발자</div>
            <div class="answer">✔️ 백엔드 개발자</div>
            <p id="notice">ⓘ 현재는 프론트엔드/백엔드 채용 공고만 서비스하고 있습니다.</p>

            <div id="button2">NEXT</div>
        </div>
    </main> 

	<script src="/resources/js/common/general.js"></script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
