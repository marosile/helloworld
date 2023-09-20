<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>일주일만에 끝내는 리액트 완벽 가이드</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/lecture/lecture-create.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <main>
        <div id="banner-background"></div>
        <div id="main">
            <div id="banner">
                <h1 id="title"></h1>
            </div>
            <form action="/lecture/write" method="post">
            </form>
            <div id="content" class="window">
            </div>
        </div>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/lecture/lecture-create.js"></script>
</body>