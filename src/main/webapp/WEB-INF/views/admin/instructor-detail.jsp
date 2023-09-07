<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 목록</title>
   
    <link rel="stylesheet" href="/resources/css/common/general.css">
    
    <link rel="stylesheet" href="/resources/css/admin/instructor-detail.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>
  

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">
        <!-- 전체 담은 div -->
        <div id="divContainer">
            <!-- 타이틀 -->
            <div id="title">강사 신청 관리</div>
    
            <!-- 이미지, 이름, 연락처 -->
            <div id="profileInfo">
                <div><img src="/resources/images/user.png"></div>
                <div id="name">오형석</div>
                <div id="phone">010-4618-2469</div>

            </div>
    
            <!-- 자기소개 -->
            <div id="introduce">
                <div class="specify">자기소개</div>
                <p>
                    안녕하세요 35년차 코딩고수입니다. <br> <br> 저 정말 잘가르켜요
                </p>

            </div>
    
            <!-- 경력사항, 자격증 -->
            <div id="experienceAndCertifications">

                <!-- 경력사항 -->
                <div id="experience">
                    <div class="specify">경력사항</div>

                    <table id="experienceTable">
                        <tr>
                            <th>근무기간</th>
                            <th>근무회사</th>
                            <th>주 업무</th>
                        </tr>

                        <tr>
                            <td>2014~2016</td>
                            <td>kh 정보교육원</td>
                            <td>백엔드 강사</td>
                        </tr>

                        <tr>
                            <td>2016~2020</td>
                            <td>네이버</td>
                            <td>백엔드 개발자</td>
                        </tr>

                        <tr>
                            <td>2020~2023</td>
                            <td>라인</td>
                            <td>프론트 개발자</td>
                        </tr>

             
                    </table>
                </div>

                <!-- 자격증 -->
                <div id="certifications">
                    <div class="specify">자격증</div>
              
                    <table id="certificationsTable">
                        <tr>
                            <th>취득일자</th>
                            <th>자격증명</th>
                            <th>자격증명기관</th>
                            <th></th>
                        </tr>

                        <tr>
                            <td>2016.07.20</td>
                            <td>정보처리기사</td>
                            <td>큐넷</td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>2018.09.10</td>
                            <td>sqld</td>
                            <td>한국데이터진흥원</td>
                            <td></td>
                        </tr>

                        <tr>
                            <td>2018.09.12</td>
                            <td>sqlp</td>
                            <td>한국데이터진흥원</td>
                            <td></td>
                        </tr>


                    </table>
                
                </div>

            </div>
    
    
            <!-- 강의에 대한 설명 -->
            <div id="courseDescription">
                <div class="specify">강의 소개</div>
                <!-- 강의명 -->
                <div id="courseTitle">
                   강의명 : 자바 무료 강의 (기본편)
                </div>
    
                <!-- 강의 주 내용 -->
                <div id="courseContent">
                    <p>
                        🕘 9시간 분량을 학습하면? 😃<br>
                        환경 설정부터 자료형과 변수, 다양한 연산자와 제어문, 배열 등을 공부하며 
                        자바에 대한 기본적인 문법을 이해할 수 있고, 하나의 클래스 내에서 
                        메소드(함수)를 이용하여 어느 정도의 구조를 갖춘 간단한 프로그램을 
                        스스로 개발할 수 있게 됩니다.<br><br>
                   
                        📚 전체 강의를 학습하면? 😎 <br>
                        객체지향 프로그래밍에 대해 이해할 수 있게 됩니다.
                        클래스, 객체, 상속, 추상클래스와 인터페이스 등을 자유롭게 활용하면서 하나의 클래스에서 벗어나 
                        훨씬 더 넓은 시야에서 자바를 바라볼 수 있게 됩니다. 
                        이들을 잘 활용하면 좋은 구조를 갖춘 프로그램의 개발은 물론 코드의 재사용성을 높일 수 있으며 
                        기능 확장이나 유지보수도 빠르게 할 수 있습니다. 그 외에도 자바를 고급스럽게 다루기 위한 제네릭스, 
                        람다와 스트림, 예외처리, 쓰레드, 입출력을 모두 익히게 됩니다.
                   
                    </p>
                </div>
    
                

                <!-- 좌우나누기 -->
                <div id="details">

                    <div class="left">
                        <!-- 가격 -->
                        <div id="coursePrice">
                            가격 : 무료
                        </div>
            
                        <!-- 기간 -->
                        <div id="courseDuration">
                            기간 : 1개월(60시간)
                        </div>
            
                        <!-- 온 / 오프라인 여부 -->
                        <div id="courseLocation">
                            온 / 오프라인 여부 : 온라인
                        </div>
                    </div>

                    <!-- 강의 예시 동영상 -->
                    <div id="courseVideo" class="right">
                        <div class="specify" >강의 예시 동영상</div>
                        <iframe width="460" height="315" 
                        src="https://www.youtube.com/embed/NQq0dOoEPUM?si=6h9tSFXeL1U7wEj7"
                        title="YouTube video player" 
                        frameborder="0" allow="accelerometer; autoplay; 
                        clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                        allowfullscreen></iframe>
                    </div>



                </div>

    


            </div>

            <div id="btn-Area">
                <button class="btns" id="cancelRegistration">반려</button>
                <button class="btns" id="registerCompany">강사 등록</button>
                <button class="btns" id="goToList">목록으로</button>

            </div>

        </div>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    
    <script src="/resources/js/admin/instructor-detail.js"></script>

</body>
</html>