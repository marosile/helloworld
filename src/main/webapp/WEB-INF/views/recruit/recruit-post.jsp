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
   
    <!-- 이전 다음 페이지 넘기는거 커리어리에선 전체 스위퍼로함 -->
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

                <!-- 이미지 -->
                <div id="companyImage">
                    <label for="img" id="imgLabel">
                        <img class="preview" src="">
                    </label>

                    <input type="file" accept="image/*" id="img">
                    <div id="insertImage">이미지</div>
                    <div id="deleteImage">&times;</div>
                </div>

                <!-- 이름 -->
                <div id="companyName">
                    <input type="text" id="compnayNameInput" placeholder="기업명을 입력해주세요.">
                </div>

            </div>

            <!-- 직무명 -->
            <div id="jobTitleDiv">
                <input type="text" id="jobTitleInput" placeholder="구하고자 하는 직무명을 입력해주세요.">
            </div>

            <!-- 직무에 맞는 태그 선택 -->
            <div id="jobTitleTag">
                <div id="jobTitleTagText">직무 태그 선택</div>
                <input type="text" class="jobTitleTags" placeholder="tag1">
                <input type="text" class="jobTitleTags" placeholder="tag2">
                <input type="text" class="jobTitleTags" placeholder="tag3">
                <input type="text" class="jobTitleTags" placeholder="tag4">
                <input type="text" class="jobTitleTags" placeholder="tag5">
            </div>

            <!-- 기업 소개 -->
            <div id="companyIntroduce">
                <textarea maxlength="300" placeholder="기업 소개글을 작성해주세요. (300자 이내)"></textarea>

            </div>

            <!-- 연봉 년차 출퇴근여부 지역 -->
            <div>
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
    
    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

</body>
</html>