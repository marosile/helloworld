// 수정하기
const createOrUpdatePostButton = document.getElementById("createOrUpdatePostButton");

/*
createOrUpdatePostButton.addEventListener("click", () =>{

    alert("게시글이 수정되었습니다.");
    location.href = "/board/detail";

})
*/

// 수정 취소
const cancelButton = document.getElementById("cancelButton");

cancelButton.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 변경한 내용은 저장되지 않습니다.")){

        // 확인
        location.href ="/board/detail";
    
    }else{

    }

})

/* $(document).ready(function() {
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
 */