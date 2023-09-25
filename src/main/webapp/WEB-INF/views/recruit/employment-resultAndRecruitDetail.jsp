<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="list" value="${map.matching}" />


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용공고 매칭 결과 (채용공고 상세)</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/recruit/employment-result.css">
   <link rel="stylesheet" href="/resources/css/recruit/recruit-footer.css">


   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

   <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
   
</head>

<body>
<%int i = 1;%>



    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>

    <main id="main">
        
        <div id ="DivContainer">

        
            <div class="swiper-container">


            <div class="swiper-wrapper">
            <c:forEach items="${map.matching}" var="recruit">
                <div class="swiper-slide">
                    <!-- 슬라이드 내용 1 -->
                    <!-- 공고 번호 -->
                <div id="recruitNo">
                    <span><%= i++ %></span>
                </div>

                <!-- 이미지, 회사명 -->
                <div id="companyInfo1">
                    <div><img src="/resources/images/recruit/companyImageEx.jpg" id="companyImg"></div>
                    <div id="companyName">${recruit.companyName}</div>
                    <div id="aplly-btn-area">
                        <a href="moreDetail?boardNo=${recruit.boardNo}"><button id="apply-btn">지원하기</button></a>
                    </div>
                </div>

                <!-- 직무(웹 백엔드 개발자) -->
                <div id="jobTitle">
                    ${recruit.jobField}
                </div>

                <!-- 요구하는 기능들 -->
                <div id="jobRequirements">

                    <!-- 기업의 요구 태그에 대해 내가 가입할때 넣은 태그와 같을때는 
                    색 바꾸고 체크표시해주기 -->

                    <!-- 일단 임시 -->
                    <div class="mySkill">✔ Java</div>
                    <div class="mySkill">✔ Javascript</div>
                    <div class="notMySkill">Linux</div>
                </div>

                <!-- 기업 간단 설명 -->
                <div id="companyDescription">
                    ${recruit.companyIntroduce}
                </div>

                <!-- 주소 + 몇명 -->
                <div id="locationAndtotalEmployees">
                    <div id="location">
                        <img src="/resources/images/recruit/company.png" class="imageInfo1">
                        <span>${recruit.companyAddress}</span>
                    </div>
                    <div id="totalEmployees">
                        <img src="/resources/images/recruit/totalEmployees.png" class="imageInfo1">
                        <span>${recruit.companyMcount} 명</span>
                    </div>
                </div>

                <!-- 매칭퍼센트와 설명 몇가지 -->
                <div id="matchingInfo">
                    <div id="matching">${recruit.memberId} 님과 매칭률</div>
                    <div id="percent"> 85.8 %</div>
                    
                    <div id="companyInfo2">
                        <div id="widthDiv">
                            
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>연봉 정보 비공개</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>${recruit.experiencePeriod}</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>${recruit.workConditions}</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>${recruit.companyAddress}</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 자격요건 -->
                <div id="qualification">
                    <div id="qualificationTitle">자격요건</div>
                    
                    <!-- 이런분을 원해요, 이런 역량은 플러스, 이런 일 하게 돼요 -->
                    <div class="want" id="wantFirst">
                        <img src="/resources/images/recruit/bulb.png" class="bulbImages">
                        이런분을 원해요.
                    </div>

                    <!-- 사람이미지 + 신입 + 내용-->
                    <div class="personInfo">
                        <div class="marginDiv"></div>
                        <p>🤵 ${recruit.boardContent}</p>
                    </div>


                    <!-- 사람이미지 + 경력 -->
                    <div class="personInfo" id="personInfo2">
                        <div class="marginDiv"></div>
                        <p>👩‍💼 ${recruit.workConditionsDetail}
                        </p>
                    </div>


                    </div>

                    <!-- 주요업무 -->
<%--                     <div id="responsibilities">
                        
                        <div id="responsibilitiesTitle">주요업무</div>
                        
                        <div class="want">
                            <img src="/resources/images/recruit/bulb.png" class="bulbImages">
                            이런 일을 하게 돼요!
                        </div>

                        <p>- 웹 서비스와 EMS(OAM) 관련 업무를 담당하고 개발합니다.</p>

                    </div> --%>

                </div>
            </c:forEach>  
            </div>    


        </div>


        </div>

        
    
    </main>


    <jsp:include page="/WEB-INF/views/recruit/recruit-footer.jsp"/> 

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/recruit/testResultAndDetail.js"></script>
    <script src="/resources/js/recruit/recruit-footer.js"></script>

</body>
</html>