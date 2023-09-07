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

    <link rel="stylesheet" href="/resources/css/admin/recruitOfficer-detail.css">
    
    <link rel="stylesheet" href="/resources/css/application.css">

    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="body-area">
            <div id="main-area">
                <p id="title3" class="title"><i class="fa-solid fa-building"></i></i>기업 담당자 신청 관리</p>
                <div id="company-name" class="companyName">기업명</div>
                <div class="info" id="info1">
                    <span>오형석</span><span>/ 과장 /</span><span>010-1234-5678</span>
                </div>
                <div id="explain">
                    네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다. 우리의 인공지능 성우 서비스 '타입캐스트'는 2019년 11월 정식 론칭 이래, 수많은 콘텐츠 창작자와 기업들의 더빙 툴로 사랑받고 있습니다.
                </div>
                <div class="info" id="info2">
                    <span><i class="fa-solid fa-location-dot"></i>서울특별시 강남구 삼성동169</span><span><i class="fa-solid fa-users"></i>63명</span>
                </div>
                <div id="content">
                    신입 채용 및 경력 직원 채용 희망합니다 🐰
                </div>
                
                <!-- 반려 버튼, 등록 버튼 누르면 문자메세지로 알림 -->
                <div id="button-area">
                <button id="cancelRegistration" class="btns custom-btn btn-8">등록 반려</button>
                <button id="registerCompany" class="btns custom-btn btn-8">담당자로 등록</button>
                <button id="goToList" class="btns custom-btn btn-8">목록으로</button>
                </div>
            </div>
            
        </main> 

     

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/admin/recruitOfficer-detail.js"></script>

</body>
</html>