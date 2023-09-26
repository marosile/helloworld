<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> 기업 담당자 자격 신청</title>

    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/admin/recuritOfficer.css">
    <link rel="stylesheet" href="/resources/css/admin/adminSidebar.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="adminMemberAll">
        <h1><i class="fa-solid fa-building"></i> 기업 담당자 자격 신청 <span id="recruit">| 강사 자격 신청</span></h1>
        
        <div class="adminMemberMain">
            
            <jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp"/>


            <div class="adminMemberDisplay">

                <div class="listChange">
                    <a href="/admin/recruitOfficer">신청 현황</a>
                    <span>|</span>
                    <a href="/admin/recruitOfficerCurr">현재 기업 담당자 리스트</a>
                </div>

                

                    <div class="tableDiv">
                        <div class="row">


                            <c:forEach items="${recruitList}" var="recruitList">
                                <a href="/admin/recruitOfficer/detail/${recruitList.userId}">
                                    <div class="box">
                                        <h4>기업명</h4>
                                        <div class="cmpnNmLogo">
                                            <img src='${recruitList.cmpnLogo}' class="cmpnLogo"/>
                                            <span id="cmpnNm">${recruitList.cmpnNm}</span>
                                        </div>

                                        <div id="userId">담당자 : ${recruitList.userId}</div>
                                        <div id="userTel">연락처 : ${recruitList.userTel}</div>

                                        <h4>기업설명</h4>
                                        <div id="cmpnAddr">주소 : ${recruitList.cmpnAddr}</div>
                                        <div id="cmpnMCount">사원수 : ${recruitList.cmpnMCount}</div>

                                        <h4>상세설명</h4>
                                        <div id="cmpnIntro">${recruitList.cmpnIntro}</div>


                                    </div>
                                </a>
                            </c:forEach>


                        </div>



                       
                    </div>


            </div>

        </div>

    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/common/admin/adminSidebar.js"></script>
    <script src="/resources/js/admin/recruitOfficer.js"></script>
</body>
</html>