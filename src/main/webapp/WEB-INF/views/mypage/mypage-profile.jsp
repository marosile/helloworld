<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="followerList" value="${followerList}" />
<c:set var="followingList" value="${followingList}" />
<c:set var="following" value="${following}" />
<c:set var="follower" value="${follower}" />

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

    <section class="ttt"> 
        <div id="side" class="window">
            <h6>일반</h6>
            <div class="category-selected">
                <a href="/mypage/profile">
                    <img src="/resources/images/mypage/category/profile.png">
                    프로필
                </a>
            </div>
            <div>
                <a href="/mypage/account">
                    <img src="/resources/images/mypage/category/account.png">
                    계정 관리
                </a>
            </div>
            <div>
                <a href="/mypage/resume">
                    <img src="/resources/images/mypage/category/applications.png">
                    이력서 관리
                </a>
            </div>
            <div>
                <a href="/mypage/applications">
                    <img src="/resources/images/mypage/category/resume.png">
                    지원 이력
                </a>
            </div>
            <div>
                <a href="/mypage/post">
                    <img src="/resources/images/mypage/category/post.png">
                    나의 게시글
                </a>
            </div>
            <div>
                <a href="/mypage/bookmark">
                    <img src="/resources/images/mypage/category/bookmark.png">
                    북마크 목록
                </a>
            </div>
            <div>
                <a href="/mypage/like">
                    <img src="/resources/images/mypage/category/like.png">
                    좋아요 목록
                </a>
            </div>
            <h6>강사</h6>
            <div>
                <a href="/mypage/lecture/dashboard">
                    <img src="/resources/images/mypage/category/lecture-dashboard.png">
                    대시보드
                </a>
            </div>
            <div>
                <a href="/mypage/lecture/management">
                    <img src="/resources/images/mypage/category/lecture-management.png">
                    관리
                </a>
            </div>
        </div>
        
        <main>
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

                            <button type="button" id="follower">팔로워 ${followingList}</button>
                            <!-- //// 팝업창 -->
                            <div class="popup" id="popup1">
                                <span id="closeBtn1">
                                    <p>팔로워 목록</p>&times
                                </span>
        
                                <!-- 팔로워 목록 -->
                                <div class="followList">

                                    <!-- 팔로워 한 행 요소들 -->
                                    <c:forEach items="${follower}" var="follower">
                                        <div class="row">
                                            <div class="followerImage">
                                                <img src="${follower.profileImage}" id="werImage">
                                            </div>
                                            <div>${follower.memberNickname}</div>
                                        </div>
                                    </c:forEach>

                                </div>

                            </div>
                            <!-- //// 팝업창 끝 -->
                        </div>


                        <!-- ======== 팔로잉 영역 ==========-->
                        <div class="following-area">
                            <button type="button" id="following">팔로잉 ${followerList}</button>
                            
                            <!-- //// 팝업창 -->
                            <div class="popup" id="popup2">
                                <span id="closeBtn2">
                                    <p>팔로잉 목록</p>&times
                                </span>
        
                                <!-- 팔로잉 목록 -->
                                <div class="followList">

                                    <!-- 팔로잉 한 행 요소 -->
                                    <c:forEach items="${following}" var="following">
                                        <div class="row">
                                            <div class="followerImage">
                                                <img src="${following.profileImage}" id="wingImage">
                                            </div>
                                            <div>${following.memberNickname}</div>
                                        </div>
                                    </c:forEach>
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
    </section>

    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/mypage/mypage-profile.js"></script>
</body>
</html>
