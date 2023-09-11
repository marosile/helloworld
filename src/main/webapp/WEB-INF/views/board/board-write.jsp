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

    <link rel="stylesheet" href="/resources/css/board/board-writeUpdate.css">
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <!-- 마크다운 에디터 라이브러리 (CKEditor4)-->
 <script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>


    <script src="/resources/ckeditor/ckeditor.js"></script>


</head>

<body>
    <%-- 0080FF (200, 100, 255) --%>

    <jsp:include page="/WEB-INF/views/common/header.jsp"/>



    <main id="main">
    
    
        <!-- 모든걸 담는 div -->
        <div id="divContainer">


            <!-- 작성 or 수정 표시 -->
            <div id="boardWrite">
                <div>게시글 작성</div>
            </div>


            <!-- 게시판 이름 -->
            <div id="boardNameDiv">
                <div>자유 게시판</div>
            </div>


            <form id="uploadForm" action="/test" method="post" enctype="multipart/form-data">

                <!-- 제목 -->
                <div id="boardTitleDiv">
                    <input type="text" id="boardTitle" placeholder="제목을 입력해주세요.">
                </div>


                <!-- 내용 -->
                <div id="boardContent">
                    <textarea id="contents" name="contents" placeholder="내용을 입력해주세요."></textarea>
                </div>



                <!-- 태그 설정 (자동완성하는거 어떻게 만들지 몰라서 일단 select 태그)-->
                <div id="tagsContainer">

                    <div id="tagText"># 태그 선택</div>

                    <div id="tagsDiv">
                        
                        <select id="selectTag" name="tags" class="tagSelects">
                            <option value="태그1">태그1</option>
                            <option value="태그2">태그2</option>
                            <option value="태그3">태그3</option>
                            <option value="태그3">태그4</option>
                            <option value="태그3">태그5</option>
                        </select>

                        <select id="selectTag" name="tags" class="tagSelects">
                            <option value="태그1">태그1</option>
                            <option value="태그2">태그2</option>
                            <option value="태그3">태그3</option>
                            <option value="태그3">태그4</option>
                            <option value="태그3">태그5</option>
                        </select>

                        <select id="selectTag" name="tags" class="tagSelects">
                            <option value="태그1">태그1</option>
                            <option value="태그2">태그2</option>
                            <option value="태그3">태그3</option>
                            <option value="태그3">태그4</option>
                            <option value="태그3">태그5</option>
                        </select>

                    </div>

                </div>

            </form>
            <!-- 등록, 작성취소 버튼 -->
            <div id="buttonsArea">

                <button id="createOrUpdatePostButton" class="btns">등록하기</button>
                <button id="cancelButton" class="btns">등록취소</button>

            </div>


        </div>
 

    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/board/board-write.js"></script>


</body>
</html>