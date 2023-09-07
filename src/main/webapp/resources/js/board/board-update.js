
// 수정하기
const createOrUpdatePostButton = document.getElementById("createOrUpdatePostButton");

createOrUpdatePostButton.addEventListener("click", () =>{

    alert("게시글이 수정되었습니다.");
    location.href = "/board/detail";

})


// 수정 취소
const cancelButton = document.getElementById("cancelButton");

cancelButton.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 변경한 내용은 저장되지 않습니다.")){

        // 확인
        location.href ="/board/detail";
    
    }else{

    }

})


