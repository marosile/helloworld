<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>


<!DOCTYPE html>
<html lang="ko">
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
                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>

                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>

                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>

                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>

                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>

                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>

                            <div class="box">
                                <p id="title">쉽게 개발자 되는법!!!!</p>
                                <p id="userId">ID : user01</p>
                                <p id="content">욕설/비방글 유해한 게시글 입니다 🤬</p>
                            </div>
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