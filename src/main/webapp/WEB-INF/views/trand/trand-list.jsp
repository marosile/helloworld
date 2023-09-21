<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<c:set var="list" value="${List}" />


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>트렌드 상세</title>

   <link rel="stylesheet" href="/resources/css/common/general.css">
   <link rel="stylesheet" href="/resources/css/trand/trand-list.css">

   <script src="https://kit.fontawesome.com/98acdabf0d.js" crossorigin="anonymous"></script>

   <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

</head>
<body>

<%
        int i = 1;
    %>

    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>

   <main id="body-area">
        <div id="main-area">
            <div id="left-area">

                <h1>
                    <span style="color:rgb(222, 143, 241)">H</span>
                    <span style="color:rgb(181, 102, 201)">E</span>
                    <span style="color:rgb(181, 102, 201)">L</span>
                    <span style="color:rgb(128, 102, 201)">L</span>
                    <span style="color:rgb(66, 58, 146)">O</span>
                    <span style="color:rgb(44, 36, 126)">,</span>
                    <span style="color:rgb(57, 46, 179)">w</span>
                    <span style="color:rgba(60, 47, 204, 0.808)">O</span>
                    <span style="color:rgba(174, 79, 230, 0.808)">R</span>
                    <span style="color:rgba(140, 70, 180, 0.808)">L</span>
                    <span style="color:rgb(176, 148, 212)">D</span>
                    <span style="color:rgb(148, 148, 212)">!</span>
                    <span style="color:rgb(148, 148, 212)">💜</span>
                </h1>

                <p id="sub-title">한 달 동안 반응이 가장 좋았던 게시물을 만나보세요!</p>


                <div class="div1" id="tag-area">
                    <div class="div2" id="develope"><i class="fa-solid fa-calendar"></i>개발</div>
                    <div class="div2" id = "design"><i class="fa-solid fa-arrow-pointer"></i>디자인</div>
                    <div class="div2" id="marketing"><i class="fa-solid fa-tag"></i>마케팅</div>
                    <div class="div2" id="business"><i class="fa-solid fa-building"></i>비즈니스</div>
                </div>

            </div>
            <div id="right-area">

                <c:forEach items="${list}" var="list">
                
                    <div class="row-area">
                        <div class="row1-1">
                            <div class="number" style='color:#2188ff'> <%= i++ %> </div>
                            <div class="profile"><img src="${list.profileImage}" id="userProfile"></div>
                            <div class="name-area">
                                <div class="name">${list.memberId}</div>
                                <div class="nickname">${list.memberNickname}</div>
                            </div>
                        </div>

                        <div class="row1-2">
                            <div class="text-area" data-boardNo="${list.boardNo}">
                                <div class="title">${list.boardTitle} </div>
                                <div class="content" id="content">${list.boardContent}</div>
                            </div>
                            <div class="picture"><img src="/resources/images/trand/sample.jpg" id="pic"></div>
                        </div>

                        <div class="row1-3">
                            <div class="heart"><i class="fa-solid fa-heart"></i> ${list.likeCount}</div>
                            <div class="bookmark"><i class="fa-solid fa-eye"></i>  ${list.readCount}</div>
                            <input type="hidden" id="boardNo" name="boardNo" value="${list.boardNo}" />
                        </div>

                    </div>
                
                </c:forEach>

             <script>
                const boardNo = ${list.boardNo}
                const boardContent = ${list.boardContent}
            </script> 
                    
            </div>
        </div>

    </main>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/trand/trand-list.js"></script>


</body>
</html>