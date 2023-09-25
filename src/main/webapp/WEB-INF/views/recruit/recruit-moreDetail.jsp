<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

<!DOCTYPE html>
<html lang="ko">

<c:set var="recruit" value="${recruit}" />

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채용 상세페이지</title>
    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/index.css">
    <link rel="stylesheet" href="/resources/css/recruit/recruit-detail.css">
</head>

<body>
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    <jsp:include page="/WEB-INF/views/recruit/recruit-nav.jsp"/>
     <main id="main-area">

        <div id="body-area">
            <div id="left">
                <div id="company-name">
                    <img src="${recruit.companyLogo}">
                    <div>${recruit.companyName}</div>
                </div>


                <div id="main-title">${recruit.boardTitle}</div>

                <div class="company-info">
                    <makr> <i class="fa-regular fa-building"></i> 회사정보 </makr>
                    <div class="article">
                        <p>회사소개</p>
                        <li>
                            ${recruit.companyIntroduce}
                        </li>
                    </div>
                </div>
                <div class="info">
                    <makr><i class="fa-solid fa-file-lines"></i> 모집부문 및 상세내용</makr>
                    <div class="article">
                        <li>
                            ${recruit.boardContent}
                        </li>
                    </div>
                </div>
                <div class="Detail">
                    <makr><i class="fa-solid fa-check"></i> 근무조건</makr>
                    <div class="article">
                        <li>
                            ${recruit.selectionProcess}
                        </li>
                    </div>
                </div>
                <div class="selectionProcess">
                    <makr><i class="fa-solid fa-pen-to-square"></i> 전형절차</makr>
                    <div class="article">
                        <li>
                            ${recruit.selectionProcess}
                        </li>
                    </div>
                </div>
                <div class="info">
                    <makr><i class="fa-regular fa-face-smile-wink"></i> 복리후생</makr>
                    <div class="article">
                        ${recruit.employmentBenefits}
                    </div>
                </div>
            </div>
            <div id="right">
                <div id="box">
                    <div class="row">
                        <div>직군</div>
                        <div>${recruit.jobField}</div>
                    </div>
    
                    <div class="row">
                        <div>경력사항</div>
                        <div>무관</div>
                    </div>
    
                    <div class="row">
                        <div>고용형태</div>
                        <div>${recruit.employmentType}</div>
                    </div>
    
                    <div class="row">
                        <div>근무지</div>
                        <div>${recruit.companyAddress}</div>
                    </div>
    
                    <div id="map-area">
                        <div id="map"><iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d12662.370940940582!2d127.03096!3d37.493936!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca1505ec4e92b%3A0xd1cec067eb1b98e4!2z64yA7ZWc66-86rWtIOyEnOyauO2KueuzhOyLnCDqsJXrgqjqtawg7Jet7IK866GcMeq4uCA4!5e0!3m2!1sko!2sus!4v1693838902792!5m2!1sko!2sus" width="320" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe></div>
                    </div>
                </div>
                <div>
                    <button id="applyBtn">지원하기</button>
                </div>
            </div>
        </div>
    </main> 


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
	<script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/recruit/recruit-moreDetail.js"></script>


</body>
</html>
