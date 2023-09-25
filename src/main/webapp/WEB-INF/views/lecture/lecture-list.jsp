<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>헬로월드 - 강의</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/lecture/lecture-list.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <section id="lecture" class="page">
            <div id="head">
                <h2>강의</h2>
                <p>새로운 기술을 배우고 싶으신가요? 수많은 유용한 강의들이 당신을 기다리고 있습니다!</p>
            </div>
            <div id="search">
                <div id="search-box">
                    <img id="search-icon" src="/resources/images/magnifier.png">
                    <input id="search-input" type="text">
                </div>
                <section id="search-tag">
                    <a>#Spring Boot</a>
                    <a>#JPA</a>
                    <a>#React</a>
                </section>
            </div>
        </section>
        <div class="advertise-banner">
        </div>
        <section id="content" class="page">
            <div id="default">
                <div id="popular">
                    <h2>인기 강의</h2>
                    <ul id="popular-lecture-container">
                        <c:forEach var="i" begin="0" end="3">
                            <li class="card" key="${i}">
                                <div class="card-front">
                                    <div class="card-thumbnail"></div>
                                    <div class="card-info">
                                        <h3 class="card-title"></h3>
                                        <div class="card-tags"></div>
                                        <div class="card-info-2">
                                            <img class="card-lecturer-icon" src="/resources/images/lecture/lecturer.png">
                                            <p class="card-lecturer"></p>
                                            <p class="card-price"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="card-detail"></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <div id="latest">
                    <h2>최신 강의</h2>
                    <ul id="recent-lecture-container">
                        <c:forEach begin="0" end="3" step="1">
                            <li class="card">
                                <div class="card-front">
                                    <div class="card-thumbnail"></div>
                                    <div class="card-info">
                                        <h3 class="card-title"></h3>
                                        <div class="card-tags">
                                            <a></a>
                                            <a></a>
                                            <a></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-back">
                                    <div class="card-detail"></div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </section>
	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/lecture/lecture-list.js"></script>
</body>
</html>
