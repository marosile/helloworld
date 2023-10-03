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
            <link rel="stylesheet" href="/resources/css/study/studyChatting.css">

            <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>



            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <script
                src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955d027ad541e959373216700e779cf3&libraries=services"></script>

        </head>

        <body>
            <jsp:include page="/WEB-INF/views/common/header.jsp" />

            <div class="P-header">

                <div class="P-main">

                    <div class="P-studyChatting-search">

                        <div class="P-studyChatting-follow">
                            <p class="P-studyChatting-follow-title">채팅</p>
                            <button i class="fa-regular fa-square-plus" class="P-studyChatting-follow-btn" id="P-studyChatting-follow-btn"></button>
                        </div>

                        <div class="P-studyChatting-search-area">
                            <button id="P-studyChatting-searchBtn" class="fa-solid fa-magnifying-glass"></button>
                            <input type="search" placeholder="닉네임 또는 아이디를 입력해주세요" id="P-studyChatting-query">
                        </div>

                        <div class="P-studyChatting-search-list-area" id="P-studyChatting-search-list-area">

<%--
                                <div class="P-studyChatting-item">

                                    <div class="P-studyChatting-item-header">
                                        <img src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FQX0NG%2Fbtq4eLx4ioT%2FHIAI77g1dqA3t1ilaoSIzK%2Fimg.jpg"
                                            class="P-profile-image">
                                    </div>

                                    <div class="P-studyChatting-item-body">
                                        <div class="P-studyChatting-user-area">
                                            <p class="P-studyChatting-user">
                                                유저일
                                            </p>

                                            <p class="P-studyChatting-time">
                                                06.08
                                            </p>
                                        </div>

                                        <div class="P-studyChatting-message-area">
                                            <p class="P-studyChatting-message">
                                                네 알겠습니다.
                                            </p>
                                        </div>
                                    </div>


                            </div>--%>

                        </div>


                    </div>

                    <div class="P-studyChatting-content">

                        <div class="P-studyChatting-content">

                            <div class="P-studyChatting-content-header">

                                <h4>${studyDetail.memberNickname}</h4>

                                <div class="P-studyChatting-content-btn">
                                    <button class="P-studyChatting-content-out" id="P-studyChatting-content-out">
                                        <i class="fa-solid fa-arrow-right" id="fa-arrow-right"></i></button>
                                  <!--   <button class="P-studyChatting-content-report"><i
                                            class="fa-solid fa-bell-concierge"></i></button> 신고하기 -->
                                </div>
                            </div>



                            <div class="P-studyChatting-contaion">

                                <div class="P-studyChatting-contaion-area">

                                    <div class="P-studyChatting-content-senderArea">

                                        <div class="P-studyChatting-body-senderArea">
                                            <div class="P-studyChatting-sender">
                                                <p class="P-studyChatting-sender-content">
                                                    채팅테스트 진행
                                                </p>
                                            </div>
                                        </div>
                                        <span class="P-studyChatting-message-right">23.07.22 17:06</span>
                                    </div>




                                    <div class="P-studyChatting-content-receiveArea">

                                        <div class="P-studyChatting-body-receiveArea">
                                            <div class="P-studyChatting-receive">
                                                <p class="P-studyChatting-receive-content">
                                                    채팅테스트 진행
                                                </p>
                                            </div>
                                        </div>
                                        <span class="P-studyChatting-message-left">23.07.22 17:06</span>
                                    </div>
                                </div>




                            </div>

                            <div class="P-studyChatting-footer">

                                <textarea placeholder="메시지를 입력하세요. (Enter: 줄바꿈, Ctrl + Enter: 전송)"
                                    id="inbox-message-textarea" rows="1"></textarea>
                                <button id="inbox-message-textarea-btn">전송</button>

                            </div>


                        </div>

                        <!-- 나가기를 했을떄 -->
                        <div class="addChatting">
                            <div class="P-addChatting-content-header">
                            </div>
                            <div class="P-studyChatting-contaion">
                                <div class="P-studyChatting-contaion-area">

                                    <div class="addChattingImg">
                                        <img src="/resources/images/free-icon-chat.png" class="iconChat">
                                    </div>
                                    <div class="addChatContent">
                                        <div class="addChat">새로운 채팅을 시작해보세요! </div>
                                        <button>채팅 시작하기</button>
                                    </div>
                                </div>
                            </div>
                            <div class="P-studyChatting-footer">
                            </div>

                        </div>


                        <div class="Follow-area" id="Follow-area">
                            <span id="close">&times</span>

                            <p id="Follow-title">내 친구</p>

                            <div id="Follow-area2">
                                <p>원하는 친구와 대화를 해보세요.📧</p>

                                <div class="followList">

                                    <div class="FollowArea">
                                        <div class="FollowContainer">
                                            <div><img src="/resources/images/user.png" class="replyImages"></div>
                                            <span id="FollowWriter">박진아<div id="FollowInfo">KH정보교육원</div></span>

                                        </div>

                                        <div id="Follow-button-area">
                                            <button id="reportBtn">대화하기</button>
                                        </div>

                                    </div>
`

                                </div>



                            </div>

                        </div>

                    </div>

                </div>

            </div>
            <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


            <input type="hidden" id="loginMemberId" value="${studyDetail.memberId}"/>
            <input type="hidden" id="boardNo" value="${studyDetail.boardNo}"/>


            <jsp:include page="/WEB-INF/views/common/footer.jsp" />
            <script src="/resources/js/common/general.js"></script>
            <script src="/resources/js/study/studyChatting.js"></script>

        </body>

        </html>