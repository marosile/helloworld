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
                <div>${boardName}</div>
            </div>


            <form id="uploadForm" action="/board2/${boardCode}/write" method="post"> <!-- enctype="multipart/form-data" -->

                <!-- 제목 -->
                <div id="boardTitleDiv">
                    <input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요.">
                </div>


                <!-- 내용 -->
                <div id="boardContent">
                     <textarea id="summernote" name="boardContent"></textarea>
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

                <div id="buttonsArea">
    
                    <button id="createOrUpdatePostButton" class="btns" type="submit">등록하기</button>
                    <button id="cancelButton" class="btns">등록취소</button>
                </form>
    
                </div>

            <!-- 등록, 작성취소 버튼 -->


        </div>



 <script>

$(document).ready(function() {

	var toolbar = [
		    // 글꼴 설정
		    ['fontname', ['fontname']],
		    // 글자 크기 설정
		    ['fontsize', ['fontsize']],
		    // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
		    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		    // 글자색
		    ['color', ['forecolor','color']],
		    // 표만들기
		    ['table', ['table']],
		    // 글머리 기호, 번호매기기, 문단정렬
		    ['para', ['ul', 'ol', 'paragraph']],
		    // 줄간격
		    ['height', ['height']],
		    // 그림첨부, 링크만들기, 동영상첨부
		    ['insert',['picture','link','video']],
		    // 코드보기, 확대해서보기, 도움말
		    ['view', ['codeview','fullscreen', 'help']]
		  ];

          var setting = {
            height : 300,
            minHeight : null,
            maxHeight : null,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            //콜백 함수
            callbacks : { 
            	onImageUpload : function(files, editor, welEditable) {
            // 파일 업로드(다중업로드를 위해 반복문 사용)
            for (var i = files.length - 1; i >= 0; i--) {
            uploadSummernoteImageFile(files[i],
            this);
            		}
            	}
            }
         };
        $('#summernote').summernote(setting);
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
        
        const boardCode = "${boardCode}";  // js 사용

    </script>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script src="/resources/js/board/board-write.js"></script>


</body>
</html>