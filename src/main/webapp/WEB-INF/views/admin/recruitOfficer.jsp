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
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="adminMemberAll">
        <h1><i class="fa-solid fa-building"></i> 기업 담당자 자격 신청 <span id="recruit">| 강사 자격 신청</span></h1>
        
        <div class="adminMemberMain">
            
            <jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp"/>


            <div class="adminMemberDisplay">
                
                <form action="#" id="searchMemberMenu" class="searchMemberMenu">
                    <div class="adminSearchDiv">
                        <button type="button" name="searchMember" id="searchMember">조회 방법
                            <img src="/resources/images/admin/sort.png">
                        </button>
                        <ul class="searchMenu menuHidden" id="searchMenu">
                            <li><button type="button" class="sidebarMenu" id="searchId">이름</button></li>
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
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>

                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>

                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>

                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>

                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>

                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>
                        </div>

                        <div class="row">
                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
                            </div>

                            <div class="box">
                                <p id="title">네오사피엔스</p>
                                <p id="user-name">이름 : 오형석</p>

                                <h4>기업설명</h4>
                                <p id="introduce">네오사피엔스는 음성·언어 분야의 인공지능 원천기술을 개발하고 있습니다.</p>

                                <h4>내용</h4>
                                <p id="content">신입 채용 및 경력 직원 채용 희망합니다 🐰</p>
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