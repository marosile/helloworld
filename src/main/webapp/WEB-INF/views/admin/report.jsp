<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html lang="ko">

<c:set var="report" value="${reportList}" />


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신고글관리</title>

    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/admin/report.css">
    <link rel="stylesheet" href="/resources/css/admin/adminSidebar.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="adminMemberAll">
        <h1><i class="fa-solid fa-face-angry"></i> 신고글 관리</h1>
        
        <div class="adminMemberMain">
            
            <jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp"/>


            <div class="adminMemberDisplay">
                
                <form action="#" id="searchMemberMenu" class="searchMemberMenu">
                    <div class="adminSearchDiv">
                        <button type="button" name="searchMember" id="searchMember">조회 방법
                            <img src="/resources/images/admin/sort.png">
                        </button>
                        <ul class="searchMenu menuHidden" id="searchMenu">
                            <li><button type="button" class="sidebarMenu" id="searchId">아이디</button></li>
                            <li><button type="button" class="sidebarMenu" id="searchId">제목</button></li>
                        </ul>
    
                    </div>

                    <input type="text" id="searchInput"> 
                    <button id="searchBtn"><img src="/resources/images/admin/search.png"></button>

                </form>

                <form action="#">
                    <div class="tableDiv">

                        <div class="row">

                    <c:forEach items="${report}" var="report">
                    
                        <a href="/board/${report.boardCode}/${report.boardNo}">
                            <div class="box" id="box">
                                <p id="title">${report.boardTitle}</p>
                                <p id="userId">${report.memberId}</p>
                                <p id="content">${report.reportContent}</p>
                            </div>    
                        </a>

                    </c:forEach>
                        </div>

                    </div>

                    <button></button>
                </form>

            </div>

        </div>

    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
    <script src="/resources/js/common/general.js"></script>
    <script src="/resources/js/common/admin/adminMember.js"></script>
    <script src="/resources/js/common/admin/adminSidebar.js"></script>
</body>
</html>