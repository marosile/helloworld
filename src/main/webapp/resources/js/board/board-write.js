
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




// 게시물 저장
function savePost() {
    var content = simplemde.value(); // 마크다운 에디터의 내용 가져오기

    // AJAX 요청을 사용하여 서버에 게시물 저장 요청 보내기
    // 서버는 받은 데이터를 DB에 저장합니다.
}

// 게시물 불러오기
function loadPosts() {
    // AJAX 요청을 사용하여 서버에서 게시물 목록 가져오기
    // 가져온 데이터를 게시물 목록 영역에 표시합니다.
}

