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
    
<%-- 나중에 for문

    슬라이드를 동적으로 생성할 개수
    const numberOfSlides = 2;

    슬라이드를 감싸는 부모 요소
    const sliderContainer = document.getElementById("divContainer");

    반복문을 사용하여 슬라이드 생성 및 추가
    for (let i = 1; i <= numberOfSlides; i++) {
    새로운 슬라이드 요소 생성
    const slide = document.createElement("div");
    slide.className = "slide";
    slide.textContent = `페이지 ${i} 내용`;

    슬라이드를 슬라이더 컨테이너에 추가
    sliderContainer.appendChild(slide); 

} --%>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>

    <main id="main">
    
        <div id ="sliderContainer">

         <div id="slider">

            <div class="slide">
            <!-- 공고 번호 -->
                <div id="recruitNo">
                    <span>1/6</span>
                </div>

                <!-- 이미지, 회사명 -->
                <div id="companyInfo1">
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
                    <div class="mySkill">✔ Java</div>
                    <div class="mySkill">✔ Javascript</div>
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
                <div id="locationAndtotalEmployees">
                    <div id="location">
                        <img src="/resources/images/recruit/company.png" class="imageInfo1">
                        <span>서울특별시 강남구 테헤란로14길 5</span>
                    </div>
                    <div id="totalEmployees">
                        <img src="/resources/images/recruit/totalEmployees.png" class="imageInfo1">
                        <span>120명</span>
                    </div>
                </div>

                <!-- 매칭퍼센트와 설명 몇가지 -->
                <div id="matchingInfo">
                    <div id="matching">오형석 님과 매칭률</div>
                    <div id="percent"> 85.8 %</div>
                    
                    <div id="companyInfo2">
                        <div id="widthDiv">
                            
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>연봉 정보 비공개</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>신입 ~ 15년차</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>사무실 출근</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>서울 강남</div>
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
                        <div class="marginDiv">🤵신입</div>
                        <p> - 컴퓨터/정보통신/전산학과 전공자 <br>
                            - Java 프로그래밍을 하실 수 있는 분
                        </p>
                    </div>

                    <!-- 신입 내용 -->
                    <div>
                    </div>

                    <!-- 사람이미지 + 경력 -->
                    <div class="personInfo" id="personInfo2">
                        <div class="marginDiv">👩‍💼경력</div>
                        <p> - Java 프로그래밍이 가능하신 분 <br>
                            - 스프링 프레임워크 기반 개발 경험이 있으신 분 <br>
                            - DB 개발 경험이 있으신 분 <br>
                            - Linux 환경에서 개발이 가능하신 분
                        </p>
                    </div>

                    <!-- 이런분을 원해요, 이런 역량은 플러스, 이런 일 하게 돼요 -->
                    <div class="want">
                        <img src="/resources/images/recruit/bulb.png" class="bulbImages">
                        이런 역량은 플러스 요인이 될 수 있어요.
                    </div>

                    <div id="plusDiv">
                        <p>
                            - 통신 프로그램 개발 경험이 있으신 분 <br>
                            - EMS, NMS 개발 경험이 있으신 분 <br>
                            - UI(BootStrap 등) 개발 경험이 있으신 분 <br>
                            - Javascript(jQuery) 개발 경험이 있으신 분
                        </p>
                    </div>

                    </div>

                    <!-- 주요업무 -->
                    <div id="responsibilities">
                        
                        <div id="responsibilitiesTitle">주요업무</div>
                        
                        <div class="want">
                            <img src="/resources/images/recruit/bulb.png" class="bulbImages">
                            이런 일을 하게 돼요!
                        </div>

                        <p>- 웹 서비스와 EMS(OAM) 관련 업무를 담당하고 개발합니다.</p>

                    </div>

            </div>

            <div class="slide">
                <div id="recruitNo">
                    2/6
                </div>

                <!-- 이미지, 회사명 -->
                <div id="companyInfo1">
                    <div><img src="/resources/images/recruit/companyImageEx2.png" id="companyImg"></div>
                    <div id="companyName">클라썸</div>
                </div>

                <!-- 직무(웹 백엔드 개발자) -->
                <div id="jobTitle">
                    백엔드 개발자
                </div>

                <!-- 요구하는 기능들 -->
                <div id="jobRequirements">

                    <!-- 기업의 요구 태그에 대해 내가 가입할때 넣은 태그와 같을때는 
                    색 바꾸고 체크표시해주기 -->

                    <!-- 일단 임시 -->
                    <div class="notMySkill">typescript</div>
                    <div class="notMySkill">NestJs</div>
                    <div class="notMySkill">Node.js</div>
                    <div class="notMySkill">serverless</div>
                    <div class="notMySkill">CloudWatch</div>
                    <div class="notMySkill">AWS Lambda</div>

                </div>

                <!-- 기업 간단 설명 -->
                <div id="companyDescription">
                    교육 및 지식 공유 플랫폼
                </div>

                <!-- 주소 + 몇명 -->
                <div id="locationAndtotalEmployees">
                    <div id="location">
                        <img src="/resources/images/recruit/company.png" class="imageInfo1">
                        <span>서울특별시 강남구 테헤란로2길 27</span>
                    </div>
                    <div id="totalEmployees">
                        <img src="/resources/images/recruit/totalEmployees.png" class="imageInfo1">
                        <span>47명</span>
                    </div>
                </div>

                <!-- 매칭퍼센트와 설명 몇가지 -->
                <div id="matchingInfo">
                    <div id="matching">오형석 님과 매칭률</div>
                    <div id="percent"> 83.1 %</div>
                    
                    <div id="companyInfo2">
                        <div id="widthDiv">
                            
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>연봉 정보 비공개</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>신입 ~ 5년차</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>사무실 출근</div>
                            </div>
                            <div class="checksInfo2">
                                <div class="imgCenter"><img src="/resources/images/greenCheck.png" class="greenChecks"></div>
                                <div>서울 강남</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 자격요건 -->
                <div id="qualification">
                    <div id="qualificationTitle">자격요건</div>
                    
                    <!-- 이런분을 원해요, 이런 역량은 플러스, 이런 일 하게 돼요 -->
                    <div class="want">
                        <img src="/resources/images/recruit/bulb.png" class="bulbImages">
                        이런분을 원해요.
                    </div>

                    <!-- 사람이미지 + 신입 + 내용-->
                    <div class="personInfo">
                        <div class="marginDiv"></div>
                        <p> - 2년 이상의 백엔드 개발 경력이 있거나 그에 준하는 실력을 갖추신 분 (경력 지원자의 경우)<br>
                            - AWS/GCP를 통해 인프라 구축한 경험이 있는 분<br>
                            - Node.js와 JavaScript 또는 TypeScript 에 대한 이해를 갖춘 분<br>
                            - 단위테스트, 기능테스트, 종단테스트, 빌드 자동화, 지속적 통합의 경험이 있는 분<br>
                            - RDBMS, NoSQL에 대한 이해를 갖춘 분<br>
                            - 자유로운 근무환경에서 스스로의 목표와 일정을 관리할 수 있는 분<br>
                            - 배움에 대한 열정을 갖고, 지속적이고 효과적으로 피드백을 주고 받는 분<br>
                            - 맡은 작업에 대한 오너십을 갖고, 이를 완성시키는 일에 열정이 있는 분<br>
                        </p>
                    </div>

                    <!-- 신입 내용 -->
                    <div>
                    </div>

                    <!-- 사람이미지 + 경력 -->
                    <div class="personInfo">
                        <div class="marginDiv"></div>
                      
                    </div>

                    <!-- 이런분을 원해요, 이런 역량은 플러스, 이런 일 하게 돼요 -->
                    <div class="want">
                        <img src="/resources/images/recruit/bulb.png" class="bulbImages">
                        이런 역량은 플러스 요인이 될 수 있어요.
                    </div>

                    <div id="plusDiv">
                         <p> - 서버리스로 상용 서비스를 운영한 경험이 있으신 분<br>
                            - WebSocket 혹은 socket.io로 많은 사람들이 접속하는 실시간 채팅 서비스를 구현한 경험이 있는 분<br>
                            - 성장하는 서비스에서 결제 및 VAN 연동 경험이 있는 분<br>
                            - 여러 국가에 걸쳐 서비스를 운영/배포한 경험이 있는 분<br>
                            - MSA를 직접 설계, 구축해 본 경험이 있는 분<br>
                        </p>
                    </div>

                    </div>

                    <!-- 주요업무 -->
                    <div id="responsibilities">
                        
                        <div id="responsibilitiesTitle">주요업무</div>
                        
                        <div class="want">
                            <img src="/resources/images/recruit/bulb.png" class="bulbImages">
                            이런 일을 하게 돼요!
                        </div>

                        <p>
                            - 클라썸 웹, 어플리케이션을 위한 API 개발
                            - AWS 기반의 서버리스 인프라 구성
                            - 클라썸 서비스 품질 향상을 위한 다양한 최적화 작업 및 리서치
                        </p>

                    </div>
            
            </div>



            <div class="slide"><h1>3</h1></div>
            <div class="slide"><h1>4</h1></div>
            <div class="slide"><h1>5</h1></div>
            <div class="slide"><h1>6</h1></div>


            </div>

        </div>
    
    </main>

    <jsp:include page="/WEB-INF/views/recruit/recruit-footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/recruit/testResultAndDetail.js"></script>

</body>
</html>