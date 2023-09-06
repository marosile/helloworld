<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>스터디</title>
    <link rel="stylesheet" href="/resources/css/common/general.css"> 
    <link rel="stylesheet" href="/resources/css/index.css">

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="P-body-area">

        <div id="P-main-area">
            <p id="P-main-title">
                <i class="fa-regular fa-file-lines"></i> 스터디 모집하기
            </p>
            </p>
        </div>

        <div id="P-body-area">

            <div id="P-body-title">
                <textarea id="P-body-title-textarea" rows="1" placeholder="제목을 입력해주세요"></textarea>
                <br>
            </div>

            <h5>요약</h5>
            <div id="P-body-content">
                <textarea name="" id="P-body-content-textarea" rows="1"
                    placeholder="프로젝트 요약을 입력하세요.

                예시 - 온/오프라인으로 달리기 모임을 만들고 찾을 수 있는 앱을 기획 중입니다. 현재 기획자 1명, 백엔드 개발자 1명이 있고, 함께 하실 디자이너와 프론트 개발자를 찾고 있어요!"></textarea>
            </div>

            <h5>위치</h5>
            <div id="P-body-location">

                <label for="face" class="P-body-location">
                    <input type="radio" name="P-location" id="findTel" checked> 대면
                    <label for="face" class="P-location-face-Shape"></label>
                </label>

                <label for="non-face" class="P-body-location">
                    <input type="radio" name="P-location" id="findEmail"> 비대면
                    <label for="non-face" class="P-location-nonFace-Shape"></label>
                </label>

            </div>

            <div class="TelCertification">
                <div class="phoneAuth1">
                    <input type="text" id="inputTel1" class="phoneInput" placeholder="위치 검색">



                    <div id="map" style="width:750px;height:350px;"></div>
                
                    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955d027ad541e959373216700e779cf3"></script>
                    <script>
                        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
                        var mapOption = {
                                center: new kakao.maps.LatLng(37.402056,127.108212), // 지도의 중심좌표
                                level: 4, // 지도의 확대 레벨
                                mapTypeId: kakao.maps.MapTypeId.ROADMAP // 지도종류
                            };

                        // 지도를 생성한다 
                        var map = new kakao.maps.Map(mapContainer, mapOption);

                    </script>


                    <button type="button" id="btn1" class="inputBtn" onclick="getCurrentPosBtn()">위치 찾기</button>

                </div>

            </div>


        </div>

    </main>

        
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/common/map.js"></script>
</body>
</html>
