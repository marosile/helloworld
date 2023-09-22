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
   <link rel="stylesheet" href="/resources/css/recruit/employment-test.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>

<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">
    
        <!-- 전체 담은 div -->

        <div id = "divContainer" class="flex job-postings-container ">


        <div class="job-posting active" id="job-posting-1">
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
                <button type="button" class="custom-btn btn-4 btn-primary btn-jittery btns" id="button1">
                    시작하기
                </button>
            </div>

        </div>

        <div class="job-posting" id="job-posting-2">
            <div id="main-area">

                    <p id="number">1/6</p>
                    <p id="question">찾고 있는 직무를 선택하세요. 💻</p>
                    
                    <div class="answer" id="jobChoice1">✔️ 프론트엔드 개발자</div>
                    <div class="answer" id="jobChoice2">✔️ 백엔드 개발자</div>
                    <p id="notice">ⓘ 현재는 프론트엔드/백엔드 채용 공고만 서비스하고 있습니다.</p>


                    <div class="btn-container">
                        <button type="button" class="btn-3d blue btns" id="button2">NEXT</button>
                    </div>

            </div>
        </div>

        <div class="job-posting" id="job-posting-3">
            <div id="main-area">
                <p id="number">2/6</p>

                <p id="question">몇 년차 채용 공고를 보여드릴까요? 🔎</p>

                <p id="term">신입-1년</p>
                <input type="range" id="slider" min="0" max="70" list="marks">
                <datalist id="marks">
                    <option value="0">전체</option>
                    <option value="05">신입</option>
                    <option value="10">1년</option>
                    <option value="20">2년</option>
                    <option value="30">3년</option>
                    <option value="40">4년</option>
                    <option value="50">5년</option>
                    <option value="60">6년</option>
                    <option value="70">7년+</option>
                </datalist>

                <div class="btn-container">
                    <button type="button" class="btn-3d blue btns" id="button4">NEXT</button>
                </div>

            </div>
        </div>

        <div class="job-posting" id="job-posting-4">
            <div id="main-area">

                    <p id="number">3/6</p>
                    <p id="question">희망하는 연봉을 알려주세요. 💵</p>
                    
                    <div class="answer" id="salaryChoice1">✔️ 최소 2700만</div>
                    <div class="answer" id="salaryChoice2">✔️ 최소 3000만</div>
                    <div class="answer" id="salaryChoice3">✔️ 최소 3500만</div>
                    <div class="answer" id="salaryChoice4">✔️ 최소 4000만</div>
                    <div class="answer" id="salaryChoice5">✔️ 최소 5000만</div>
                    <div class="answer" id="salaryChoice6">✔️ 최소 7000만+</div>

                    <div class="btn-container">
                        <button type="button" class="btn-3d blue btns" id="button3">NEXT</button>
                    </div>

            </div>
        </div>

        <div class="job-posting" id="job-posting-5">
            <div id="main-area">

                    <p id="number">4/6</p>
                    <p id="question">선호 하는 근무 형태를 알려주세요. 👩‍💻</p>
                    
                    <div class="answer" id="workConditionsChoice1">✔️ 풀재택</div>
                    <div class="answer" id="workConditionsChoice2">✔️ 사무실 출근</div>
                    <div class="answer" id="workConditionsChoice3">✔️ 하이브리드(주 1회 이상 재택)</div>

                    <div class="btn-container">
                        <button type="button" class="btn-3d blue btns" id="button5">NEXT</button>
                    </div>

            </div>

        </div>

        <div class="job-posting" id="job-posting-6">

            <div id="main-area">
                <p id="number">5/6</p>
                <p id="question2">선호 하는 근무 지역을 모두 선택해주세요. 🗾</p>
                
                <div class="answer" id="regionChoice1">✔️ 서울 전체</div>
                <div class="answer" id="regionChoice2">✔️ 서울 종로</div>
                <div class="answer" id="regionChoice3">✔️ 서울 구로</div>
                <div class="answer" id="regionChoice4">✔️ 서울 강남</div>
                <div class="answer" id="regionChoice5">✔️ 서울 성동</div>
                <div class="answer" id="regionChoice6">✔️ 판교</div>

                <div class="btn-container">
                    <button type="button" class="btn-3d blue btns" id="button6">NEXT</button>
                </div>
            </div>

        </div>

        <div class="job-posting" id="job-posting-7">
        
             <div id="main-area2">
                <p id="number">6/6</p>
                <p id="question2">사용 가능한 기술을 선택해주세요 (복수 선택 가능)</p>
                
                <div class="answer" id="stackChoice1">✔️ JAVA</div>
                <div class="answer" id="stackChoice2">✔️ JavaScript</div>
                <div class="answer" id="stackChoice3">✔️ Spring</div>
                <div class="answer" id="stackChoice4">✔️ Oracle</div>
                <div class="answer" id="stackChoice5">✔️ Visual studio Code</div>
                <div class="answer" id="stackChoice6">✔️ JQuery</div>
<%--                 <div class="answer">✔️ Ajax</div>
                <div class="answer">✔️ React</div>
                <div class="answer">✔️ GitHub</div> --%>

                <div class="btn-container">
                    <button type="submit" class="btn-3d blue" id="button7">DONE🎉</button>
                </div>

            </div>
        </div>

        </div> <%-- divContainer --%>
    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script>
        const loginMember = "${loginMember}"; 
    </script>

    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/recruit/recruit-test.js"></script>

</body>
</html>