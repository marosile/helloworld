<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 공고 등록</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/recruit/recruit-post.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
   
</head>

<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>

    <main id="main">
    
        <div id = "divContainer">

            <!-- 타이틀 -->
            <div id="title">채용 공고 등록</div>
    
            <!-- 기업 이미지 + 이름 -->
            <div id="companyInfo1">

                <!-- 	private int companyNo; // 회사 번호 (회사 아이디)
                        private String memberId; // 담당자 아이디
                        private String companyName; //회사 이름
                        private String companyAddress; // 회사 주소
                        private String companyLogo; // 회사 로고
                        private String companyIntroduce; // 회사 소개
                        private int companyMcount;  // 사원수
                        private String companyFl; // 담당자로 등록 여부 
                -->

                <!-- 이미지 -->
                <div id="companyImage">
                    <img src = "${company.companyLogo}">
                </div>

                <!-- 이름 -->
                <div id="companyName">
                    <span>${company.companyName}<span>
                </div>

            </div>

            <!-- 직무명 -->
            <div id="jobTitleDiv">
                <input type="text" id="jobTitleInput" name="" placeholder="구하고자 하는 직무명을 입력해주세요.">
            </div>

            <!-- 직무에 맞는 태그 선택 -->
            <div id="jobTitleTag">
                <div id="jobTitleTagText">직무 태그 선택</div>
                <input type="text" class="jobTitleTags" placeholder="#tag1" maxlength="20">
                <input type="text" class="jobTitleTags" placeholder="#tag2" maxlength="20">
                <input type="text" class="jobTitleTags" placeholder="#tag3" maxlength="20">
                <input type="text" class="jobTitleTags" placeholder="#tag4" maxlength="20">
                <input type="text" class="jobTitleTags" placeholder="#tag5" maxlength="20">
            </div>

            <!-- 기업 소개 -->
            <div id="companyIntroduce">
                <textarea>${company.companyIntroduce}</textarea>
            </div>

            <!-- 연봉 년차 출퇴근여부 지역 2개씩 큰 div로-->
            <div class="companyInfos">

                <div class="checksInfo2">
                    <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                    <div class="infos"><input type="text" placeholder=" 연봉정보를 입력해주세요. (비공개 가능)" class="infoInputs"></div>
                </div>
                <div class="checksInfo2">
                    <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                    <div class="infos"><input type="text" placeholder=" 요구 경력기간을 입력해주세요 (ex: 신입~5년차)" class="infoInputs"></div>
                </div>

            </div>

            <div class="companyInfos">

                <div class="checksInfo2">
                    <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                    <div class="infos"><input type="text" placeholder=" 출근 장소 여부를 입력해주세요.(ex: 재택, 사무실 출근)" class="infoInputs"></div>
                </div>
                <div class="checksInfo2">
                    <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                    <div class="infos">
                        <textarea>회사 주소 : ${company.companyAddress} / 사원수 : ${company.companyMcount}명</textarea>
                    </div>
                </div>

            </div>
        
            <!-- 자격 요건 + 주요 업무-->
            <div id="qualificationAndresponsibilities">
                
                <!-- BOARD - boardContent -->
                <textarea placeholder="자격요건을 작성해주세요. ( 👨‍👦‍👦이런 분을 원해요. )" class="qualRespTextArea" id="qualrespTextArea1"></textarea>
           
                <!-- BOARD_RECRUIT - EMPL_CNDT -->
                <textarea placeholder=" 근무조건을 작성해주세요. ( 🔥 ex : 주 5일 09:00 ~ 18:00시간 야근 X )" class="qualRespTextArea" id="qualrespTextArea2"></textarea>
                
                <!-- BOARD_RECRUIT - EMPL_EXAM -->
                <textarea placeholder=" 전형절차를 작성해주세요. ( 👌 ex : 지원서 제출 -> 코딩테스트 -> 직무인터뷰 -> 임원진 인터뷰)"  class="qualRespTextArea" id="qualrespTextArea3"></textarea>
                
                <!-- BOARD_RECRUIT - BENEFIT -->
                <textarea placeholder=" 복리후생을 작성해주세요. ( 🛀 ex : 1년 이상 재직자에 한해 50만원 상당의 건강검진 패키지를 제공합니다.)"  class="qualRespTextArea" id="qualrespTextArea4"></textarea>

            </div>

            <div id="buttonsArea">

                <button id="writeButton" class="btns">등록하기</button>
                <button id="Backbutton" class="btns">등록취소</button>

            </div>

    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/recruit/recruit-post.js"></script>

</body>
</html>