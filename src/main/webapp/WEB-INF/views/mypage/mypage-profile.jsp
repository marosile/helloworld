<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-profile.css">
    <link rel="stylesheet" href="/resources/css/mypage/mypage-nav.css">
    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<main>
        <!-- 마이페이지 nav -->
        <jsp:include page="/WEB-INF/views/mypage/mypage-nav.jsp"/>
        
        <h1 class="Title">프로필</h1>

        <section class="myPage-profile">

            <form action="/mypage/profile" method="POST" name="myPageFrm" id="profileFrm" enctype="multipart/form-data">

                <!-- =================== 프로필 이미지 영역 ==================== -->
                <div class="profile-image-area">

                    <%-- 프로필사진 없을 때 --%>
                    <c:if test="${empty loginMember.profileImg}">
                        <div class="image-area">
                            <img src="/resources/images/user.png" id="profileImage" name="profileImg">
                        </div>
                    </c:if>

                    <%-- 프로필 사진 있을 때 --%>
                    <c:if test="${!empty loginMember.profileImg}">
                        <div class="image-area">
                            <img src="${loginMember.profileImg}" id="profileImage" name="profileImg">
                        </div>
                    </c:if>

                        <input type="hidden" name="profileImg2" value="${loginMember.profileImg}"/>
                        <input type="hidden" name="profileImg3" value="/resources/images/user.png"/>

                    <%-- 변경 제거 버튼 영역 --%>
                    <input type="hidden" id="ddd" value="${loginMember.profileImg}">
                    <div class="Btn-area">
                        <div class="imageBtn-area">
                            <label for="imageInput" class="fa-solid fa-pencil" style="margin-top: 7px;">&nbsp;변경</label>
                            <input type="file" name="profileImg1" id="imageInput" accept="image/*">
                        </div>
                        <button type="button" id="deleteBtn" class="fa-regular fa-trash-can">&nbsp;제거</button>
                    </div>

                </div>



                
                <!-- ==================== 팔로워 팔로잉 영역 ===================== -->
                <div class="follow-area">

                    <!-- ======= 팔로워 영역 ======== -->
                    <div class="follower-area">

                        <button type="button" id="follower">팔로워 0</button>
                        <!-- //// 팝업창 -->
                        <div class="popup" id="popup1">
                            <span id="closeBtn1">
                                <p>팔로워 목록</p>&times
                            </span>
    
                            <!-- 팔로워 목록 -->
                            <div class="followList">

                                <!-- 팔로워 한 행 요소들 -->
                                <div class="row">
                                    <div class="followerImage">
                                        <img src="/resources/images/user.png" class="followImage">
                                    </div>
                                    <div>아이디</div>
                                    <button>팔로잉</button>
                                </div>
                                <div class="row">
                                    <div class="followerImage">
                                        <img src="/resources/images/user.png" class="followImage">
                                    </div>
                                    <div>아이디</div>
                                    <button>팔로잉</button>
                                </div>

                            </div>

                        </div>
                        <!-- //// 팝업창 끝 -->
                    </div>


                    <!-- ======== 팔로잉 영역 ==========-->
                    <div class="following-area">
                        <button type="button" id="following">팔로잉 0</button>
                        
                        <!-- //// 팝업창 -->
                        <div class="popup" id="popup2">
                            <span id="closeBtn2">
                                <p>팔로잉 목록</p>&times
                            </span>
    
                            <!-- 팔로잉 목록 -->
                            <div class="followList">

                                <!-- 팔로잉 한 행 요소 -->
                                <div class="row">
                                    <div class="followerImage">
                                        <img src="/resources/images/user.png" class="followImage">
                                    </div>
                                    <div>아이디</div>
                                    <button>팔로잉</button>
                                </div>

                            </div>

                        </div> 
                        <!-- 팝업창 끝 -->
                    </div>

                </div>



                <!-- ========================= 닉네임 영역 =============================  -->
                <div>
                    <div class="nick-area">
                        <label>닉네임</label>
                        <input type="text" name="memberNick" id="memberNickname" maxlength="8"
                        value="${loginMember.memberNick}">
                    </div>
                    <span id="nickMessage"></span>
                </div>


                <!-- 저장 버튼 -->
                <button id="saveBtn">저장</button>

            </form>
            

    
    
        </section>



	</main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-profile.js"></script>
</body>
</html>
