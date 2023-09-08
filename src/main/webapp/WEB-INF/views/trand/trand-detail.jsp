<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트렌드 상세</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/trand/trand-detail.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="main">
    
        <!-- 글 상세div + 인기 탑 10 div -->
        <div id = "divContainer">

            <div id="trandDetailContent">

                <!-- 이미지 + 제목 / 소개  -->
                <div id="postHeader">
                    
                    <div id="headerImage">
                        <img src="/resources/images/user.png" 
                             id="detailWriterImage">
                    
                    </div>
                    
                    <div id="headerNameIntro">
                        <div id="nickName">달레</div>
                        <div id="introduce">블로그쓰는 개발자✍️</div>
                    </div>

                    <div id="followButtonDiv">
                        <button id="followBtn">팔로우</button>
                    </div>

                </div>

                <!-- 제목 -->
                <div id="detailTitle">
                    🕊️ JWT 기본 개념 이해하기
                </div>

                <!-- 내용 p태그 쓰는게 맞나 -->
                <div id="pDiv">
                    <p>📌JWT(Json Web Token)는 말그대로 웹에서 사용되는 JSON 형식의 토큰에 대한 표준 규격인데요. 주로 사용자의 인증(authentication) 또는 인가(authorization) 정보를 서버와 클라이언트 간에 안전하게 주고 받기 위해서 사용됩니다.<br><br>

                        JWT 토큰 웹에서 보통 `Authorization` HTTP 헤더를 `Bearer 토큰`의 형태로 설정하여 클라이언트에서 서버로 전송되며, 서버에서는 토큰에 포함되어 있는 서명(signature) 정보를 통해서 위변조 여부를 빠르게 검증할 수 있게 됩니다.<br><br>
                        
                        JWT 토큰은 Base64로 인코딩이 되어 있어서 육안으로 보면 `eyJ`로 시작하는 아주 긴 문자열인데요. 온라인 디버거를 통해서 어렵지 않게 실제로 저장되어 있는 내용을 JSON 형태로 디코딩하여 확인해볼 수 있습니다.<br><br>
                        
                        이번 글에서는 JWT를 처음 접하시는 분들을 위해서 JWT의 기본 개념을 잡아보겠습니다.<br><br>
                        
                        📝 포스팅: https://www.daleseo.com/jwt/
                    </p>
                </div>

                <!-- 작성일 -->
                <div id="writeDate">
                    2023년 8월 21일 오전 4:43
                </div>

                <!-- 좋아요 북마크 수정 삭제 목록으로 div-->
                <div id="likeBookMarkUpdateDeleteBack">
                    
                    <!-- 좋아요 북마크 -->
                    <div id="likeBookMark"> 
                    
                            <div id="like">
                                <div>
                                    <i class="fa-solid fa-heart fa-2xl"></i>
                                </div>  
                                <div id="likeCount">
                                    135
                                </div>
                            </div>

                        <div id="bookMark">
                            <div>
                                <i class="fa-regular fa-bookmark fa-2xl"></i>
                            </div>
                        </div>
                    </div>

                    <div id="updateDeleteBack">
                        <button class="boardBtns" id="goToBackButton">목록으로</button>
                    </div>


                </div>


                <!-- 댓글 -->
                <div id="replyContainer">

                    <div id="replyCount">
                        댓글 수 : 2
                    </div>

                    <!-- 댓글 하나하나 나중에 for문 -->
                    <div class="replys">

                        <div class="inReplyfirstDiv">
                            <div><img src="/resources/images/user.png" class="replyImages"></div>
                            <div>작성자</div>
                            <div>(2023-09-04)</div>
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

            <!-- 인기글 top 10 -->
            <div id="top10">
              
                <div id="top10HeaderText">트렌드 인기 TOP 10</div>
                <div></div>

                <!-- 백엔드 할때 for문 돌리기 -->
                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers" style="color:orangered !important">1</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers" style="color:orangered !important">2</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>
                
                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers" style="color:orangered !important">3</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers">4</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers">5</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers">6</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers">7</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers">8</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers">9</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

                <div class="top10Posts">
                    
                    <!-- 1~10 번호 -->
                    <div class="numbers">10</div>

                    <!-- 1~10 작성자 이미지 -->
                    <div class="WriterImages">
                        <img src="/resources/images/logo.svg" id="top10WritersImage">
                    </div>

                    <!-- 1~10 제목 + 작성자 + 간단소개???(ex:블로그 쓰는 개발자) -->
                    <div class="top10Texts">
                        <div class="top10Title">
                            JWT 기본 개념 이해하기
                        </div>

                        <div class="top10WriterIntroduce">
                            <span class="nickname">이명진</span> 블로그 쓰는 개발자 ✍️
                        </div>
                    </div>

                </div>

            </div>


        </div>
    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/trand/trand-detail.js"></script>

</body>
</html>