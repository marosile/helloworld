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

    <link rel="stylesheet" href="/resources/css/application.css">

    <link rel="stylesheet" href="/resources/css/admin/recruitOfficer-detail.css">

    <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <main id="body-area">

        <c:choose>
            <c:when test="${recruitOfficerDetail.cmpnFl == 'N'}">
                <form action="/admin/recruitOfficer/detail/update" id="updateForm" >
            </c:when>
            <c:otherwise>
                <form action="/admin/recruitOfficer/detail/delete" id="deleteForm" >
            </c:otherwise>
        </c:choose>


            <div id="main-area">
                <p id="title3" class="title"><i class="fa-solid fa-building"></i></i>기업 담당자 신청 관리</p>
                <div id="company-name" class="companyName" name="cmpnNm">${recruitOfficerDetail.cmpnNm}</div>
                <div class="info" id="info1">
                    <span>담당자 : </span>
                    <span name="userId">${recruitOfficerDetail.userId}</span>
                    <span class=slash>/</span>
                    <span>연락처 : </span>
                    <span name="userTel">${recruitOfficerDetail.userTel}</span>
                </div>
                <div class="info" id="info2">
                    <div class="infoAddr">
                        <i class="fa-solid fa-location-dot"></i>
                        <span name="cmpnAddr">${recruitOfficerDetail.cmpnAddr}</span>
                    </div>

                    <div>
                        <i class="fa-solid fa-users"></i>
                        <span name="cmpnMCount">${recruitOfficerDetail.cmpnMCount}</span>
                        <span>명</span>
                    </div>
                </div>
                <div id="explain" name="cmpnIntro">
                    ${recruitOfficerDetail.cmpnIntro}
                </div>


                <!-- 반려 버튼, 등록 버튼 누르면 문자메세지로 알림 -->
                <c:choose>
                    <c:when test="${recruitOfficerDetail.cmpnFl == 'N'}">
                        <div id="button-area">
                            <button id="cancelRegistration" class="btns" type="button" onclick="confirmCancel()">등록 반려</button>
                            <button id="registerCompany" class="btns">담당자로 등록</button>
                            <button class="btns" type="button" onClick="location.href='/admin/recruitOfficer'">목록으로</button>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div id="button-area">
                            <button id="deleteCompony" class="btns">기업 담당 해지</button>
                            <button class="btns" type="button" onClick="location.href='/admin/recruitOfficerCurr'">목록으로</button>
                        </div>
                    </c:otherwise>
                </c:choose>


            </div>


            <input type="hidden" name="cmpnNm" value="${recruitOfficerDetail.cmpnNm}"/>
            <input type="hidden" name="userId" value="${recruitOfficerDetail.userId}"/>
            <input type="hidden" name="userTel" value="${recruitOfficerDetail.userTel}"/>
            <input type="hidden" name="cmpnMCount" value="${recruitOfficerDetail.cmpnMCount}"/>
            <input type="hidden" name="cmpnIntro" value="${recruitOfficerDetail.cmpnIntro}"/>

        </form>
    </main>

     

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/admin/recruitOfficer-detail.js"></script>

</body>
</html>