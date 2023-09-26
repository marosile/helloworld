const goToList = document.getElementById("go-to-list");

goToList.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){

        alert("작성 취소");

        location.href = "allNoticeList";
   
    }else{

    }

})

// 미리보기 관련 요소 모두 얻어오기
const preview = document.querySelector(".preview");
const inputImage = document.querySelector(".inputImage");
const deleteImage = document.querySelector(".delete-image");

inputImage.addEventListener("change", (e) => {
    const file = e.target.files[0]; // 선택된 파일의 데이터

    if (file != undefined) {
        const reader = new FileReader(); // 파일을 읽는 객체

        reader.readAsDataURL(file);
        // 지정된 파일을 읽은 후 result 변수에 URL 형식으로 저장

        reader.onload = (e) => {
            // 파일을 다 읽은 후 함수 실행
            preview.setAttribute("src", e.target.result); // src = url 대입
        };
    } else {
        // 선택 후 취소 되었을 때 file == undefined
        // 선택 된 파일 없음 -> 미리보기 삭제
        preview.removeAttribute("src");
    }
});

// 미리보기 삭제 버튼(x버튼)
deleteImage.addEventListener("click", (e) => {
    // 미리보기 이미지가 있을 경우에만
    if (preview.getAttribute("src") != "") {
        // 미리보기 삭제
        preview.removeAttribute("src");

        // input type = "file" 태그의 value를 삭제
        // ** input type = "file"의 value ""(빈칸)만 대입 가능 **
        inputImage.value = "";
    }
});
