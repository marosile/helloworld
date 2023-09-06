<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고 매칭 메인</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/recruit/employment-main.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>

<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">
    
        <!-- 전체 담은 div -->
        <div id = "divContainer">

            <!-- text 담은 div -->
            <div id="textButtonContainer">
                <span id="firstText">채용 공고 매칭</span>
                <span id="secondText">나에게 딱 맞는 채용 공고를 골라 볼 수 있어요.</span>
                <span id="thirdText">질문 6개에 답하고 맞는 회사를 추천받으세요!</span>
                <span id="fourthText">현재는 프론트엔드, 백엔드 채용 공고를 서비스하고 있어요!</span>
            </div>

            <!-- image 담은 div -->
            <div id="recruitMainImageDiv">
               <img src="/resources/images/recruit/recruitMainImage.png"
                id="recruitMainImage"> 
            </div>

            <!-- button 담은 div -->
            <div id="buttonDiv">
            <form action=>
                <button id="btn">시작하기</button>

            </div>

        </div>
    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

</body>
</html>