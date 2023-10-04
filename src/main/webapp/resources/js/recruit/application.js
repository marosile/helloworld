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

const companyMcountInput = document.querySelector('input[name="companyMcount"]');

// 사원수 숫자입력 빼고 막기
companyMcountInput.addEventListener("input", function () {
    // Remove non-numeric characters from the input value
    const numericValue = this.value.replace(/\D/g, '');

    // Update the input value with the cleaned numeric value
    this.value = numericValue;
});

// 폼 제출 이벤트 리스너
document.getElementById("boardWriteFrm").addEventListener("submit", function (e) {
    // 필수 입력 필드를 체크하고 라벨과 에러 메시지를 설정합니다.
    const companyNameInput = document.querySelector('input[name="companyName"]');
    const companyAddressInput = document.querySelector('input[name="companyAddress"]');

    const companyIntroduceTextarea = document.querySelector('textarea[name="companyIntroduce"]');
    const companyHomePageAddressInput = document.querySelector('input[name="companyHomePageAddress"]');

    const inputImage = document.querySelector('.inputImage');

    if (inputImage.files.length === 0) {
        snackbar('이미지를 업로드해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        return;
    }

    if (companyNameInput.value.trim() === "") {
        snackbar('회사명을 작성해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        companyNameInput.focus();
        return;
    }

    if (companyAddressInput.value.trim() === "") {
        snackbar('회사 주소를 작성해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        companyAddressInput.focus();
        return;
    }

    if (companyMcountInput.value.trim() === "") {
        snackbar('사원수를 작성해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        companyMcountInput.focus();
        return;
    }



    if (companyIntroduceTextarea.value.trim() === "") {
        snackbar('회사 소개를 작성해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        companyIntroduceTextarea.focus();
        return;
    }

    if (companyHomePageAddressInput.value.trim() === "") {
        snackbar('회사 홈페이지 주소를 작성해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        companyHomePageAddressInput.focus();
        return;
    }

    alert("신청이 완료 되었습니다.")
});
