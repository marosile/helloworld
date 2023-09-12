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
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>



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
                     <textarea id="summernote"></textarea>
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



 <script>

        $(document).ready(function() {
            textEdit();
        });

// summernote 부분 
 function textEdit(){
    jsonArray = [];
    $('#summernote').summernote({
          height: 500,                 // 에디터 높이
          minHeight: null,             // 최소 높이
          maxHeight: null,             // 최대 높이
          focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
          lang: "ko-KR",					// 한글 설정
         toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
            ['color', ['forecolor','color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert',['picture','link','video']],
            ['view', ['fullscreen', 'help']]
          ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        callbacks: {
          onImageUpload : function(files, editor, welEditable){

                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i],
                this);
                    }
                }
            } 
        });

    $('#summernote').summernote('fontSize', '24');

    function uploadSummernoteImageFile(file, el) {
        var data = new FormData();	
        data.append("file",file);
            $.ajax({
              url: '/../summer_image.do',
              type: "POST",
              enctype: 'multipart/form-data',
              data: data,
              cache: false,
              contentType : false,
              processData : false,
              success : function(data) {
                        var json = JSON.parse(data);
                        $(el).summernote('editor.insertImage',json["url"]);
                            jsonArray.push(json["url"]);
                            jsonFn(jsonArray);
                    },
                    error : function(e) {
                        console.log(e);
                    }
                });
            }

}

function jsonFn(jsonArray){
	console.log(jsonArray);
}

      /* $(document).ready(function () {

    $('#summernote').summernote({
        lang: 'ko-KR',
        width:600,
        height: 500,
        placeholder: '내용을 입력하세요',
        toolbar: [
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['table', ['table']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
            ['insert', ['picture', 'link', 'video']],
            ['view', ['fullscreen', 'help']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체',
            '굴림', '돋음체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36',
            '50', '72'],
        callbacks : { 
            onImageUpload : function(files, editor, welEditable) {
                // 파일 업로드(다중업로드를 위해 반복문 사용)
                for (var i = files.length - 1; i >= 0; i--) {
                    uploadSummernoteImageFile(files[i], this);
                }
            }
        }
    });

    function uploadSummernoteImageFile(file, el) {
        data = new FormData();
        data.append("file", file);
        $.ajax({
            data : data,
            type : "POST",
            url : "uploadSummernoteImageFile",
            contentType : false,
            enctype : 'multipart/form-data',
            processData : false,
            success : function(data) {
                $(el).summernote('editor.insertImage', data.url);
            }
        });
    }

}); */


    </script>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/board/board-write.js"></script>


</body>
</html>