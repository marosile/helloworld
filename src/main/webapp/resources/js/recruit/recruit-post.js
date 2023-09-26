
// 채용공고 등록 취소
const Backbutton = document.getElementById("Backbutton");

Backbutton.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){

        alert("채용공고 등록 취소");
        
        location.href = "allNoticeList";
    }else{

    }

})


const uploadForm = document.getElementById("uploadForm");

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

            tagsDiv.appendChild(inputTag);

            // 태그 추가 후에만 snackbar를 표시
            if (tagsDiv.children.length >= maxTags) {
                snackbar('태그는 5개까지 입력 가능합니다.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
            }
        
        }
    });
});

const boardTitle = document.getElementById("boardTitleInput");
const jobTitle = document.getElementById("jobTitleInput");
const salaryInfo = document.getElementById("salaryInfo");
const experiencePeriod = document.getElementById("experiencePeriod");
const workConditions = document.getElementById("workConditions");
const employmentType = document.getElementById("employmentType");
const qualrespTextArea1 = document.getElementById("qualrespTextArea1");
const qualrespTextArea2 = document.getElementById("qualrespTextArea2");
const qualrespTextArea3 = document.getElementById("qualrespTextArea3");
const qualrespTextArea4 = document.getElementById("qualrespTextArea4");

// form 제출 event 막기
uploadForm.addEventListener("submit", (e) => {

    if(boardTitle.value.trim().length == 0){
        snackbar('제목을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        boardTitle.focus();
        return;
    }

    if(jobTitle.value.trim().length == 0){
        snackbar('요구 직무명을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        jobTitle.focus();
        return;
    } 

    if(salaryInfo.value.trim().length == 0){
        snackbar('연봉정보를 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        salaryInfo.focus();
        return;
    } 

    if(experiencePeriod.value.trim().length == 0){
        snackbar('요구 경력기간을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        experiencePeriod.focus();
        return;
    } 

    if(workConditions.value.trim().length == 0){
        snackbar('출근 형태를 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        workConditions.focus();
        return;
    } 

    if(employmentType.value.trim().length == 0){
        snackbar('고용 형태를 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        employmentType.focus();
        return;
    } 
    
    if(qualrespTextArea1.value.trim().length == 0){
        snackbar('자격요건을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        qualrespTextArea1.focus();
        return;
    } 

    if(qualrespTextArea2.value.trim().length == 0){
        snackbar('근무조건을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        qualrespTextArea2.focus();
        return;
    } 

    if(qualrespTextArea3.value.trim().length == 0){
        snackbar('전형절차를 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        qualrespTextArea3.focus();
        return;
    } 

    if(qualrespTextArea4.value.trim().length == 0){
        snackbar('복리후생을 입력해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault();
        qualrespTextArea4.focus();
        return;
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
        snackbar('추가한 태그를 모두 작성해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        e.preventDefault(); // 이벤트 막음
    }

  
})

