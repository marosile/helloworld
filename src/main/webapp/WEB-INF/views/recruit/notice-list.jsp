<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">

<c:set var="list" value="${map.matching}" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 목록</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/recruit/notice-list.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>
        <main id="body-area">
            <div id="main-area">

                <c:forEach items="${list}" var = "list">
                <div class="row-area">
                    <div class="box">
                        <div id="row1">
                            <div id="photo"><img src="${list.companyLogo}"></div>
                            <div id="title-area">
                                <div id="title">${list.companyName}</div>
                                <div id="subTitle">${list.jobField}</div>
                            </div>
                            <div id="machting">70%</div>
                        </div>
                        <div id="row2">
                            <div id="left">
                                <div class="up"><i class="fa-solid fa-briefcase"></i> ${list.experiencePeriod}</div>
                                <div class="down"><i class="fa-solid fa-desktop"></i> ${list.workConditions}</div>
                            </div>
                            <div id="right">
                                <div class="up"><i class="fa-solid fa-coins"></i> 연봉 정보 비공개</div>
                                <div class="down"><i class="fa-solid fa-location-dot"></i> ${list.companyAddress}</div>
                            </div>
                        </div>
                        <div id="row3">
                            <a href="/recruit/moreDetail?boardNo=${list.boardNo}"><div id="click">상세보기</div></a>
                        </div>
                    </div>
                </div>
                </c:forEach>

                
            </div>
    </main>

	<script src="/resources/js/common/general.js"></script>
        <script src="/resources/js/recruit/notice-list.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
