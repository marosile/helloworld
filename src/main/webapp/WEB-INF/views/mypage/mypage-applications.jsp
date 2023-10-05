<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지-나의 게시글</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-applications.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <section class="ttt">
        <jsp:include page="/WEB-INF/views/mypage/mypage-side.jsp"/>
        <main>
            <h1 class="Title">지원이력</h1>
            <section class="applications">

                <div class="applicationsList">
                    
                    <!-- 왼쪽 -->
                    <div class="row1">

                        <div class="top">
                            <img class="thumbnail" src="/resources/images/member/OKKY.png">
                            <div class="companyName"><a>OKKY</a></div>
                        </div>

                        <div class="mid">
                            <div class="fa-solid fa-briefcase"> 신입 ~ 3년차</div>
                            <div class="fa-solid fa-coins"> 연봉 정보 비공개</div>
                        </div>

                        <div class="bottom">
                            <div class="fa-solid fa-desktop"> 사무실 출근</div>
                            <div class="fa-solid fa-location-dot"> 서울 강남</div>
                        </div>

                        <div class="applyDate">
                            <div class="fa-solid fa-calendar-days">&nbsp;지원일시 : 2023-10-05</div>
                        </div>

                    </div>

        
                    <!-- 오룬쪽 -->
                    <%-- <div class="row1">

                        <div class="top">
                            <img class="thumbnail">
                            <div class="companyName"><a>회사이름</a></div>
                        </div>

                        <div class="mid">
                            <div class="fa-solid fa-briefcase"> 신입 ~ 100년차</div>
                            <div class="fa-solid fa-coins"> 연봉 정보 비공개</div>
                        </div>

                        <div class="bottom">
                            <div class="fa-solid fa-desktop"> 사무실 출근</div>
                            <div class="fa-solid fa-location-dot"> 서울 강남</div>
                        </div>

                        <div class="applyDate">
                            <div class="fa-solid fa-calendar-days">&nbsp;지원일시 : </div>
                        </div>

                    </div> --%>
                </div>
                
            
            </section>


        </main>
    </section>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
</body>
</html>
