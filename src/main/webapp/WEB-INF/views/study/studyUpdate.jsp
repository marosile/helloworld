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
    <link rel="stylesheet" href="/resources/css/study/studyWrite.css">

     
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955d027ad541e959373216700e779cf3&libraries=services"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/study/study-nav.jsp"/>

      
    <main id="P-body-area">

        <div id="P-main-area">
            <p id="P-main-title">
                <i class="fa-regular fa-file-lines"></i> 스터디 모집 수정하기
            </p>

            <form action="" class="P-body-category-top">

                


                <h5><span class="required">*</span> 카테고리</h5>
                <div class="P-body-category-area">

                    <div class="P-body-category-role">

                        <button type="button" class="P-body-category-btn">역할
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-role menuHidden" id=P-selectBox-role"">
                            <li><button type="button" class="P-option-btn">프론트앤드</button></li>
                            <li><button type="button" class="P-option-btn">백엔드</button></li>
                            <li><button type="button" class="P-option-btn">디자인</button></li>
                            <li><button type="button" class="P-option-btn">기획</button></li>
                            <li><button type="button" class="P-option-btn">기타</button></li>
                        </ul>

                    </div>

                    <div class="P-body-category-purpose">
                        <button type="button" class="P-body-purpose-btn">목적
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-purpose menuHidden">
                            <li><button type="button" class="P-option-btn">포트폴리오/직무역량 강화</button></li>
                            <li><button type="button" class="P-option-btn">창업/수익 창출</button></li>
                            <li><button type="button" class="P-option-btn">네트워킹</button></li>
                        </ul>

                    </div>

                    <div class="P-body-category-count">
                        <button type="button" class="P-body-count-btn">인원
                            <i class="fa-solid fa-caret-down"></i>
                        </button>

                        <ul class="P-selectBox-count menuHidden">

                            <div class="P-CountPerson ">
                                <div class="P-person">
                                    <span class="P-person-span">전체인원</span>
                                    <button type="button" id="P-minusBtn">-</button>
                                    <span id="count">1</span>
                                    <button type="button" id="P-plusBtn">+</button>
                                </div>
                                <button type="button" id="P-personBtn">완료</button>
                            </div>
                        </ul>
                    </div>

                </div>

                <div id="P-body-container">

                    <h5><span class="required">*</span> 제목</h5>

                    <div id="P-body-title">
                        <input id="P-body-title-textarea" placeholder="제목을 입력해주세요."></input>
                        <br>
                    </div>

                    <h5><span class="required">*</span> 내용</h5>
                    <div id="P-body-content">
                        <textarea name="" id="P-body-content-textarea" rows="1"
                            placeholder="프로젝트 요약을 입력하세요.

                    예시 - 온/오프라인으로 달리기 모임을 만들고 찾을 수 있는 앱을 기획 중입니다. 현재 기획자 1명, 백엔드 개발자 1명이 있고, 함께 하실 디자이너와 프론트 개발자를 찾고 있어요!"></textarea>
                    </div>

                </div>


                <div id="P-body-container-location">
                    <h5><span class="required">*</span> 위치</h5>
                    <div id="P-body-location">

                        
                        <input id="P-body-location-input" placeholder="위치를 작성해주세요.">
                        <input type="button" id="P-locationBtn" onclick="sample5_execDaumPostcode()" value="주소 검색">
                        <div id="map"></div>
                    </div>
                </div>

                <div class="P-body-controller">
                    <div class="P-body-controller-Btn">
                        <button id="BtnModify">수정하기</button>
                        <button id="BtnDelete">삭제하기</button>
                        <button id="referer">목록으로</button>
                    </div>

                </div>


            </form>
        </div>



    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/study/studyWrite.js"></script>
</body>
</html>
