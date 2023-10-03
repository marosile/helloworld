<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 </title>
   <link rel="stylesheet" href="/resources/css/common/general.css">

    <link rel="stylesheet" href="/resources/css/board/board-writeUpdate.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
    crossorigin="anonymous"></script>

    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"
    integrity="sha256-lSjKY0/srUM9BE3dPm+c4fBo1dky2v27Gdjm2uoZaL0="
    crossorigin="anonymous"></script>

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.js"
    integrity="sha512-lVkQNgKabKsM1DA/qbhJRFQU8TuwkLF2vSN3iU/c7+iayKs08Y8GXqfFxxTZr1IcpMovXnf2N/ZZoMgmZep1YQ=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"></script>

    <link rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/summernote-lite.min.css"
    integrity="sha512-ZbehZMIlGA8CTIOtdE+M81uj3mrcgyrh6ZFeG33A4FHECakGrOsTPlPQ8ijjLkxgImrdmSVUHn1j+ApjodYZow=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ko-KR.min.js"
    integrity="sha512-Zg4LEmUTxIodfMffiwHk5HUeapoVo2VTSGZS5q6ttOMseXr/ZbkiBgV2lyds3UQFPAX05AlF8RIpszT3l7BXKA=="
    crossorigin="anonymous"
    referrerpolicy="no-referrer"></script>
    
    <script src="https://unpkg.com/hangul-js" type="text/javascript"></script>

</head>

<body>

    <jsp:include page="/WEB-INF/views/common/snack-bar.jsp"/>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>


    <main id="main">
    
    
        <!-- 모든걸 담는 div -->
        <div id="divContainer">


            <!-- 작성 or 수정 표시 -->
            <div id="boardWrite">
                <div>게시글 수정</div>
            </div>


            <!-- 게시판 이름 -->
            <div id="boardNameDiv">
                <div>${boardName}</div>
            </div>


            <form id="uploadForm" action="/board2/${boardCode}/${boardNo}/update" method="post"> 

                <!-- 제목 -->
                <div id="boardTitleDiv">
                    <input type="text" id="boardTitle" name="boardTitle"
                           placeholder="제목을 입력해주세요." value="${board.boardTitle}"
                           maxlength="30">
                </div>


                <!-- 내용 -->
                <div id="boardContent">
                     <textarea id="summernote" name="boardContent">${board.boardContent}</textarea>
                </div>

                <div id="tagsContainer">
                    
                    <div id="tagsDiv">
                        <input type="text" id="inputTag" placeholder="#태그를 입력해주세요.">
                            
                            <c:forEach var="tag" items="${tagNames}">
                                <span onClick="$(this).remove()">
                                    #${tag}&nbsp;×
                                </span>
                            </c:forEach>
                    </div>

                </div>


                <div id="buttonsArea">
    
                    <button id="createOrUpdatePostButton" class="btns" type="submit">등록하기</button>
                    <button id="cancelButton" class="btns">등록취소</button>
    
                </div>
            </form>
            
            <!-- 등록, 작성취소 버튼 -->
            <input type="hidden" name="tagNums" value="${tagNums}"> 

        </div>



    </main>

    <script>
        const boardNo = "${boardNo}";
    </script>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script type="module" src="/resources/js/board/board-update.js"></script>

</body>
</html>

