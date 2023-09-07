<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자회원관리</title>

    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/admin/adminMember.css">
    <link rel="stylesheet" href="/resources/css/admin/adminSidebar.css">
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <div class="adminMemberAll">
        <h1>회원 관리</h1>
        
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
                            <li><button type="button" class="sidebarMenu" id="searchPw">이메일</button></li>
                            <li><button type="button" class="sidebarMenu" id="searchTel">전화번호</button></li>
                            <li><button type="button" class="sidebarMenu" id="searchNickname">닉네임</button></li>
                        </ul>
    
                    </div>

                    <input type="text" id="searchInput"> 
                    <button id="searchBtn"><img src="/resources/images/admin/search.png"></button>

                </form>

                <div class="checkNumber">
                    <div>
                        <span>총 회원수 : </span>
                        <span>0명</span>
                    </div>
                    <div>
                        <span>검색된 회원수 : </span>
                        <span>0명</span>
                    </div>
                </div>

                <form action="#">
                    <div class="tableDiv">
                    

                        <table>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="memberCheckAll" id="memberCheckAll"></th>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>이름</th>
                                    <th>전화번호</th>
                                    <th>닉네임</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <tr class="adminTr">
                                    <td><input type="checkbox" name="memberCheck"></td>
                                    <td>1</td>
                                    <td>아이디입니다</td>
                                    <td>유저일</td>
                                    <td>01012341234</td>
                                    <td>닉네임입니다</td>
                                </tr>
                            
                                <tr class="adminTr">
                                    <td><input type="checkbox" name="memberCheck"></td>
                                    <td>2</td>
                                    <td>아이디2</td>
                                    <td>유저이</td>
                                    <td>01012341234</td>
                                    <td>닉네임2</td>
                                </tr>
                            </tbody>
                        
                        
                        </table>
                        
                    </div>

                    <button>선택한 회원 탈퇴</button>
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