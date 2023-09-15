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
    <link rel="stylesheet" href="/resources/css/study/studyDetail.css">
     <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

     
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955d027ad541e959373216700e779cf3&libraries=services"></script>

</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">

        <!-- 글 상세div + 인기 탑 10 div -->
        <div id="divContainer">

            <div id="trandDetailContent">

                <!-- 이미지 + 제목 / 소개  -->
                <div id="postHeader">
                    

                    <div class="P-study-detail-category">
                        <div>
                            스터디
                        </div>
                            <i class="fa-regular fa-heart" id="heart"></i>
                          <%--   <i class="fa-solid fa-heart"></i> --%>
                    </div>

                    <div class="P-study-detail-title">
                        <span class="PN"> 모집중</span>
                        <span class="PS"> | </span>
                        우리 같이 백엔드 공부하는거 어때요?
                    </div>


                    <div class="P-study-detail-location-area">
                        <span class="P-study-datail-location">
                            <i class="fa-solid fa-location-dot"></i>
                            서울 송파구
                            <i class="fa-solid fa-angle-right"></i>
                        </span>

                    </div>
                </div>

                <div id="studyInfoArea">
                    <div id="studyInfoRole">

                    </div>
                </div>





                <!-- 제목 -->
                <div id="detailTitle">
                    상세설명
                </div>


                <div id="pDiv">
                    <p>“ Advice + Pointcut = Aspect “
                        실제로 동작 코드를 의미하는 Advice와
                        작성한 Advice가 실제로 적용된 메소드인 Pointcut을 합친 개념으로
                        부가기능(로깅, 보안, 트랜잭션 등)을 나타내는 공통 관심사에 대한 추상적인 명칭.
                        (여러 객체에 공통으로 적용되는 부가기능을 작성한 클래스 나타냄)

                        AOP 개념을 적용하면 핵심기능 코드 사이에 끼어있는 부가기능을 독립적인 요소로 구분해 낼 수 있고,
                        이렇게 구분된 부가기능 Aspect는 런타임 시에 필요한 위치에 동적으로 참여하게 할 수 있다.
                    </p>
                </div>

                <!-- 작성일 -->
                <div id="writeDate">
                    2023년 8월 21일 오전 4:43
                </div>

                <div class="P-study-detail-container">
                    <a href="">
                        <div class="P-study-detail-tag">
                            <span># 백엔드</span>
                        </div>
                    </a>

                    <a href="">
                        <div class="P-study-detail-tag">
                            <span># 프론트 앤드</span>
                        </div>
                    </a>
                </div>




                <!-- 좋아요 북마크 수정 삭제 목록으로 div-->
                <div id="likeBookMarkUpdateDeleteBack">

                    <!-- 좋아요 북마크 -->
                    <div class="P-study-datail-footer-area">
                        <p>
                            <!--    <i class="fa-solid fa-heart"></i> 꽉찬하트 -->
                            <i class="fa-regular fa-heart"> 좋아요</i>
                            <b>15</b>
                        </p>
                        <p>&nbsp • &nbsp</p>

                        <p>
                            <i class="fa-regular fa-face-smile"> 조회</i>
                            <b>7,150</b>
                        </p>
                    </div>



                    <div id="updateDeleteBack">
                        <button class="boardBtns" id="updateBtn">수정</button>
                        <button class="boardBtns" id="deleteBtn">삭제</button>
                        <button class="boardBtns" id="goToBackBtn">목록</button>
                    </div>


                </div>


                <!-- 댓글 -->
                <div id="replyContainer">

                    <div id="replyCount">
                        댓글 : 2
                    </div>

                    <!-- 댓글 하나하나 나중에 for문 -->
                      <div class="replys">

                        <div class="inReplyfirstDiv">
                            <div><img src="/resources/images/user.png" class="replyImages"></div>
                            <div id="replyWriter">작성자
                            <div id="replyCreateDate">(2023-09-04)</div>
                            </div>
                            
                        </div>

                        <div class="replyContents">
                            댓글 내용입니다.
                        </div>

                        <div class="replyBtns">
                            <button class="replyBtn" id="updateBtn">수정</button>
                            <button class="replyBtn" id="deleteBtn">삭제</button>
                            <button class="replyBtn" id="replyBtn">대댓글</button>
                        </div>

                    </div>

                    <div class="replys">

                        <div class="inReplyfirstDiv">
                            <div><img src="/resources/images/user.png" class="replyImages"></div>
                            <div id="replyWriter">작성자</div>
                            <div id="replyCreateDate">(2023-09-04)</div>
                        </div>

                        <div class="replyContents">
                            댓글 내용입니다.
                        </div>

                        <div class="replyBtns">
                            <button class="replyBtn">수정</button>
                            <button class="replyBtn">삭제</button>
                            <button class="replyBtn">대댓글</button>
                        </div>

                    </div>

                    <!-- 댓글 작성 div -->
                    <div id="replyWrite">

                        <!-- 작성 부분 -->
                        <div id="replyWriteContent">
                            <input type="text" placeholder="댓글을 작성해주세요.">
                        </div>

                        <!-- 버튼 부분 -->
                        <div id="replyWriteBtn">
                            <button>작성하기</button>
                        </div>

                    </div>


                </div>

            </div>


            <!-- /////////////////////////////////////////////////////////////////////////////////////// -->


                <div class="P-profile-area">
                    <div class="P-profile-container">
                        <!-- 프로필 이미지 -->
                        <a href="" class="P-profile-pro">
                            <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQX0NG%2Fbtq4eLx4ioT%2FHIAI77g1dqA3t1ilaoSIzK%2Fimg.jpg"
                                class="P-profile-image">
                        </a>

                        <!-- 이름 및 회사 정보 -->
                        <p>박진아</p>
                        <p>KH정보교육원</p>

                        <!-- 공유하기 및 문의하기 버튼 -->
                        <div class="P-profile-buttons">
                            <button id="contact-button">채팅하기</button>
                            <button id="share-button">팔로우하기</button>
                        </div>
                    </div>
                </div>




    </main>

        
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/study/studyWrite.js"></script>
    <script src="/resources/js/study/studyDetail.js"></script>
</body>
</html>
