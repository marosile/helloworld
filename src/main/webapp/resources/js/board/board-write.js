
const uploadForm = document.getElementById("uploadForm");
const boardTitle = document.getElementById("boardTitle");
const boardContent = document.getElementById("summernote");

// form 제출 event 막기
uploadForm.addEventListener("submit", (e) => {

    if(boardTitle.value.trim().length == 0){
        snackbar('제목을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        boardTitle.focus();
        return;
    }

    if(boardContent.value.trim().length == 0){
        snackbar('내용을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        boardContent.focus();
    } 

})


// 작성 취소
const cancelButton = document.getElementById("cancelButton");

cancelButton.addEventListener("click", (e) => {

    e.preventDefault();

    if(confirm("정말 취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){

        alert("게시글 작성 취소");
        // 확인
        location.href = "/board/" + boardCode;
    
    }else{

    }

})
