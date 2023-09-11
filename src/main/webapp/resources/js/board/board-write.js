
// 작성하기
const createOrUpdatePostButton = document.getElementById("createOrUpdatePostButton");

createOrUpdatePostButton.addEventListener("click", () => {

    alert("게시글이 작성되었습니다.");
    location.href = "/board/detail";

})


// 작성 취소
const cancelButton = document.getElementById("cancelButton");

cancelButton.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){

        // 확인
        location.href ="/board/list";
    
    }else{

    }

})

const contents = document.getElementById("contents")

$(function () {
    CKEDITOR.replace('contents', {
        filebrowserUploadUrl: '/adm/fileupload.do',
        contentsLangDirection: 'ltr', // 텍스트 방향 설정 (ltr: 왼쪽에서 오른쪽, rtl: 오른쪽에서 왼쪽)
    });
});

