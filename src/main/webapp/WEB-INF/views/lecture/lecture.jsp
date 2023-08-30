<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>강의</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/lecture/lecture.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <section id="lecture" class="page">
            <div id="first">
                <h2>강의</h2>
                <p>새로운 기술을 배우고 싶으신가요? 수많은 유용한 강의들이 당신을 기다리고 있습니다!</p>
                <input id="search-box" type="text">
                <section id="search-tag">
                    <a>#Spring Boot</a>
                    <a>#JPA</a>
                    <a>#React</a>
                </section>
            </div>
            <div id="second">
                <h2>인기 강의</h2>
                <ul id="populars">
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
            </div>
        </section>
	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
