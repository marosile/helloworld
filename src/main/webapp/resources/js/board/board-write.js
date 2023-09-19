const uploadForm = document.getElementById("uploadForm");
const boardTitle = document.getElementById("boardTitle");
const boardContent = document.getElementById("summernote");

document.addEventListener("DOMContentLoaded", function() {
    const tagsDiv = document.getElementById("tagsDiv");
    const maxTags = 5;

    document.getElementById("tagText").addEventListener("click", function() {
        if (tagsDiv.children.length < maxTags) {
            const inputTag = document.createElement("input");
            inputTag.type = "text";

            // 클래스 추가
            inputTag.classList.add("tagInputs");
            
            // name 추가 -> controller로
            inputTag.setAttribute("name", "tagInputs");

            // 각각의 input 요소에 다른 placeholder 설정
            if (tagsDiv.children.length === 0) {
                inputTag.placeholder = "#태그1";
            } else if (tagsDiv.children.length === 1) {
                inputTag.placeholder = "#태그2";
            } else if (tagsDiv.children.length === 2) {
                inputTag.placeholder = "#태그3";
            } else if (tagsDiv.children.length === 3) {
                inputTag.placeholder = "#태그4";
            } else {
                inputTag.placeholder = "#태그5";
            }
            // 나머지 태그에 대해서도 필요한 만큼 추가 설정 가능

            tagsDiv.appendChild(inputTag);

            // 태그 추가 후에만 snackbar를 표시
            if (tagsDiv.children.length >= maxTags) {
                snackbar('태그는 5개까지 입력 가능합니다.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
            }

        
        }
    });
});

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

    // 태그 입력 여부 확인
    const tagInputs = document.querySelectorAll(".tagInputs"); // nodeList
    let allTagsEntered = true; // 모든 입력 필드가 값이 있는지 여부

    for (const inputTag of tagInputs) {
        const trimmedValue = inputTag.value.trim();
        if (trimmedValue.length === 0) {
            allTagsEntered = false;
            break; // 하나라도 비어 있는 경우 반복문 종료
        }
    }

    if (!allTagsEntered) {
        alert('추가한 태그를 모두 작성해주세요.');
        e.preventDefault(); // 이벤트 막음
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

