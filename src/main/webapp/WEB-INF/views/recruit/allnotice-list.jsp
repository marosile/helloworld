<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">

<c:set var="recruit" value="${recruitList}" />



<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>전체 채용 공고 목록</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/recruit/allnotice-list.css">
   
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>
    <main id="body-area">
        <div id="main-area">


            <c:forEach items="${recruit}" var = "r">
                <div class="row-area">
                    <div class="box">
                        <div id="row1">
                            <div id="photo"><img src="${r.companyLogo}"></div>
                            <div id="title-area">
                                <div id="title">${r.companyName}</div>
                                <div id="subTitle">${r.jobField}</div>
                            </div>
                            <a href="/recruit/moreDetail?boardNo=${r.boardNo}"><div id="click">상세보기</div></a>
                        </div>
                    </div>
                </div>
            </c:forEach>


        </div>
    </main>

	<script src="/resources/js/common/general.js"></script>
    
    <script src="/resources/js/recruit/allnotice-list.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
