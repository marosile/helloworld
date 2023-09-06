<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 담당자 지원서 작성</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/application.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
       <main id="body-area">
            <div id="main-area">
                <p id="title3"><i class="fa-solid fa-building"></i></i> 기업 담당자 신청</p>
                <div id="company-name">기업명</div>
                <div class="info">
                    <span>오형석</span><span>과장</span><span>010-1234-5678</span>
                </div>
                <div id="explain">
                    네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다. 우리의 인공지능 성우 서비스 '타입캐스트'는 2019년 11월 정식 론칭 이래, 수많은 콘텐츠 창작자와 기업들의 더빙 툴로 사랑받고 있습니다.
                </div>
                <div class="info">
                    <span><i class="fa-solid fa-location-dot"></i>서울특별시 강남구 삼성동169</span><span><i class="fa-solid fa-users"></i>63명</span>
                </div>
                <div id="content">
                    신입 채용 및 경력 직원 채용 희망합니다 🐰
                </div>
                
                <button id="sub">신청</button>
                <button id="go-to-list">목록으로</button>
      
            </div>
            
        </main> 

	<script src="/resources/js/common/general.js"></script>
    
    <script src="/resources/js/recruit/application.js"></script>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>
