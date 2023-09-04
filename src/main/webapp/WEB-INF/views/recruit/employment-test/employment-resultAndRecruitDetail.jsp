<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고 매칭 결과 (채용공고 상세)</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/recruit/employment-result.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
   

</head>

<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>

    <main id="main">
    
        <div id = "divContainer">

            <!-- 일단 스위퍼로 안함 -->
            <!-- 공고 번호 -->
            <div id="recruitNo">
                1/6
            </div>

            <!-- 이미지, 회사명 -->
            <div id="companyInfo">
                <div><img src="/resources/images/recruit/companyImageEx.jpg" id="companyImg"></div>
                <div id="companyName">아이페이지온</div>
            </div>

            <!-- 직무(웹 백엔드 개발자) -->
            <div id="jobTitle">
                웹 백엔드 개발자
            </div>

            <!-- 요구하는 기능들 -->
            <div id="jobRequirements">

                <!-- 기업의 요구 태그에 대해 내가 가입할때 넣은 태그와 같을때는 
                색 바꾸고 체크표시해주기 -->

                <!-- 일단 임시 -->
                <div class="mySkill">Java</div>
                <div class="mySkill">Javascript</div>
                <div class="notMySkill">Linux</div>
            </div>

            <!-- 기업 간단 설명 -->
            <div id="companyDescription">
                안녕하세요! ICT 솔루션으로 사람과 사람을 잇는 기업, 아이페이지온 입니다 :) 
                저희는 코어망, 기업형 커뮤니케이션, 산업용 loT 솔루션이 주된 사업 영역이며, 
                해당 분야에서 다년간 축적한 기술력을 바탕으로 국내외 120여개의 기업과 파트너쉽을 맺어
                최적의 솔루션을 제공하고 있습니다.
            </div>

            <!-- 주소 + 몇명 -->
            <div id="locationAndVacancy">
                <div>서울특별시 강남구 테헤란로14길 5</div>
                <div>120명</div>
            </div>

            <!-- 매칭퍼센트와 설명 몇가지 -->
            <div id="matchingInfo">
                <div>오형석 님과 매칭률</div>
                <div> 99.9 %</div>
                <div>
                    <div>1</div>
                    <div>2</div>
                    <div>3</div>
                    <div>4</div>
                </div>
            </div>

            <!-- 자격요건 -->
            <div id="qualification">
                <div>이런 분을 원해요.</div>
                <div>
                    <div></div>
                </div>
            </div>

            <!-- 주요업무 -->
            <div id="responsibilities">

            </div>


        </div>
    
    </main>

    <!-- 이 페이지만에서의 footer -->
    <!-- 이전 다음 페이지 넘기는거 커리어리에선 전체 스위퍼로함-->
    <footer id="recruitFooter">
        <div id="footerDiv">
            <div class="prevNext" id="prev">
               ← 이전
            </div>
            <div id="bookMark">
                <div><i class="fa-regular fa-bookmark fa-2xl"></i></div>
                <div id="bookMarkSpan">북마크</div>
            </div>
            <div id="apply">
                <button id="btn">지원하기</button>
            </div>
            <div class="prevNext" id="next">다음 →</div>
        </div>

    </footer>

    <script src="/resources/js/common/general.js"></script>

</body>
</html>