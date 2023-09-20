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


            <form id="uploadForm" action="/board2/${boardCode}/${boardNo}/update" method="post"> <!-- enctype="multipart/form-data" -->

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

                    <div id="tagText"># 태그 선택</div>

                    <div id="tagsDiv">

                    </div>

                </div>


                <div id="buttonsArea">
    
                    <button id="createOrUpdatePostButton" class="btns" type="submit">등록하기</button>
                    <button id="cancelButton" class="btns">등록취소</button>
    
                </div>
            </form>
            <!-- 등록, 작성취소 버튼 -->
    <input type="text" name="tagNums" value="${tagNums}"> <%-- 배열같이 생긴 문자열이 됨 --%>

        </div>


 <script>

document.addEventListener("DOMContentLoaded", function() {
    console.log("jsp - script test")
    const tagsDiv = document.getElementById("tagsDiv");
    const maxTags = 5;

    const tagData = ${tagListJson};
    console.log(tagData);

    for (let i = 0; i < tagData.length; i++) {  
        if (tagsDiv.children.length < maxTags) {
            const inputTag = document.createElement("input");
            inputTag.type = "text";
            inputTag.classList.add("tagInputs");
            inputTag.setAttribute("name", "tagInputs");

            // 서버에서 받은 태그 데이터로 초기값 설정
            inputTag.value = tagData[i];

            // 각각의 input 요소에 다른 placeholder 설정
            inputTag.placeholder = "#태그" + (i + 1);

            tagsDiv.appendChild(inputTag);
        }
    }

    document.getElementById("tagText").addEventListener("click", function() {
        if (tagsDiv.children.length < maxTags) {
            const inputTag = document.createElement("input");
            inputTag.type = "text";

            // 클래스 추가
            inputTag.classList.add("tagInputs");

            // name 추가 -> controller로
            inputTag.setAttribute("name", "tagInputs");

            // 각각의 input 요소에 다른 placeholder 설정
            inputTag.placeholder = "#태그" + (tagsDiv.children.length + 1);

            tagsDiv.appendChild(inputTag);

            if (tagsDiv.children.length >= maxTags) {
                snackbar('태그는 5개까지 입력 가능합니다.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
            }
        }
    });

	console.log("jstest");
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
            width:900,
            minHeight : 600,
            focus : true,
            lang : 'ko-KR',
            toolbar : toolbar,
            disableHtml: true,
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
				url : "/board2/uploadSummernoteImageFile",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}

        


    </script>
    </main>


    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

    <script src="/resources/js/common/general.js"></script>

    <script type="module" src="/resources/js/board/board-update.js"></script>

</body>
</html>