<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="memberList" value="${map.memberList}"/>
<c:set var="memberCount" value="${map.memberCount}"/>
<c:set var="searchCount" value="${map.searchCount}"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자회원관리</title>

    <link rel="stylesheet" href="/resources/css/common/general.css">
    <link rel="stylesheet" href="/resources/css/admin/adminMember.css">
    <link rel="stylesheet" href="/resources/css/admin/adminSidebar.css">

    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
</head>
<body>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

    <c:if test="${!empty param.key}">
        <c:set var="sp" value="&key=${param.key}&query=${param.query}"/>
    </c:if>

    <div class="adminMemberAll">
        <h1>회원 관리</h1>
        
        <div class="adminMemberMain">
            
            <jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp"/>


            <div class="adminMemberDisplay">

                <%-- 검색창 --%>
                
                <form action="/admin/adminMember" id="searchMemberMenu" class="searchMemberMenu">

                    <div class="adminSearchDiv">
                        <button type="button" name="searchMember" id="searchMember">조회 방법
                            <img src="/resources/images/admin/sort.png">
                        </button>
                        <ul class="searchMenu menuHidden" id="searchMenu" name="key">
                            <li><button type="button" class="sidebarMenu" name="key1" id="searchId" value="아이디">아이디</button></li>
                            <li><button type="button" class="sidebarMenu" name="key2" id="searchEmail" value="이메일">이메일</button></li>
                            <li><button type="button" class="sidebarMenu" name="key3" id="searchTel" value="전화번호">전화번호</button></li>
                            <li><button type="button" class="sidebarMenu" name="key4" id="searchNickname" value="닉네임">닉네임</button></li>
                        </ul>

                        <select name="key" class="selectHidden">
                            <option value="아이디" id="searchId1">아이디</option>
                            <option value="이메일" id="searchEmail1">이메일</option>
                            <option value="전화번호" id="searchTel1">전화번호</option>
                            <option value="닉네임" id="searchNickname1">닉네임</option>
                        </select>
                    </div>




                    <input type="text" id="searchInput" name="query">
                    <button id="searchBtn"><img src="/resources/images/admin/search.png"></button>

                </form>


                <div class="checkNumber">
                    <div>
                        <span>총 회원수 : </span>
                        <c:choose>
                            <c:when test="${empty memberList}">
                                <span>0명</span>
                            </c:when>

                            <c:otherwise>
                                <span>${memberCount}명</span>

                            </c:otherwise>

                        </c:choose>

                    </div>
                    <div>
                        <span>검색된 회원수 : </span>
                        <c:choose>
                            <c:when test="${empty searchCount}">
                                <span>0명</span>
                            </c:when>

                            <c:otherwise>
                                <span>${searchCount}명</span>

                            </c:otherwise>

                        </c:choose>

                    </div>
                </div>

                <form action="/admin/adminMember/deleteMember" id="adminMemberForm" method="post">
                    <div class="tableDiv">
                    

                        <table>
                            <thead>
                                <tr>
                                    <th><input type="checkbox" name="memberCheckAll" id="memberCheckAll"></th>
                                    <th>번호</th>
                                    <th>아이디</th>
                                    <th>전화번호</th>
                                    <th>이메일</th>
                                    <th>닉네임</th>
                                    <th>가입일</th>
                                </tr>
                            </thead>
                            
                            <tbody>

                                <c:choose>
                                    <c:when test="${empty memberList}">
                                        <tr>
                                            <th colspan="8">게시글이 존재하지 않습니다.</th>
                                        </tr>
                                    </c:when>

                                    <c:otherwise>
                                        <c:forEach items="${memberList}" var="memberList">
                                            <tr class="adminTr">
                                                <td><input type="checkbox" name="memberCheck"></td>
                                                <td>${memberList.rowNum}</td>
                                                <td>${memberList.memberId}</td>
                                                <td>${memberList.memberTel}</td>
                                                <td>${memberList.memberEmail}</td>
                                                <td>${memberList.memberNick}</td>
                                                <td>${memberList.enrollDate}</td>
                                            </tr>


                                        </c:forEach>

                                    </c:otherwise>

                                </c:choose>

                            </tbody>
                        
                        
                        </table>
                        
                    </div>

                    <button id="searchMemberBtn">선택한 회원 탈퇴</button>
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