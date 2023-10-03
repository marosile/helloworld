const input = $('#inputTag');
const tagInputs = document.getElementsByName("tagInputs");
const maxTags = 5;

$.ajax({
    type: 'post',
    url: '/tag/list',
    dataType: 'json',
    success: function (data) {

        let tagList = $.map(data, function (item) {
            chosung = "";
            Hangul.d(item, true).forEach(function (strItem, index) {
                if (strItem[0] != " ") chosung += strItem[0];
            });
            return {
                label: chosung + "|" + item,
                value: item,
                chosung: chosung
            }
        });

        const uniqueValues = {};

        // tagList의 key값을 비교해서 중복제거
        for (const item of tagList) {
          const value = item.value.toUpperCase();
          if (!uniqueValues[value]) {
            uniqueValues[value] = item;
          }
        }
        
        // Convert the uniqueValues object back to an array
        const uniqueTagList = Object.values(uniqueValues);
        console.log(uniqueTagList);

        input.autocomplete({
          source: uniqueTagList,
          select: function (event, ui) { console.log(ui.item.label + " 선택 완료"); },
          focus: function (event, ui) { return false; }
      }).autocomplete("instance")._renderItem = function (ul, item) {
          return $("<li>").append("<div>" + item.value + "</div>").appendTo(ul);
      };
    
      }
});
input.on("keyup", function () {	//검색창에 뭔가가 입력될 때마다
    value = input.val();	//입력된 값 저장
    input.autocomplete("search", Hangul.disassemble(value).join("").replace(" ", ""));	//자모 분리후 띄어쓰기 삭제
});

$('#inputTag').keydown(function(event) {

  if (event.keyCode === 13) {
      const val = $(this).val().replace(' ', '&nbsp;'); // 공백 유지
      if (!val.length) {
        event.preventDefault(); // 입력이 비어있으면 엔터 키 동작 막기
        return;
      }
      if ($('#tagsContainer #tagsDiv span').length >= 5) {
        event.preventDefault(); // 5개 이상의 태그가 입력되면 엔터 키 동작 막기
        snackbar('태그는 5개까지 입력 가능합니다.', 'rgb(0, 128, 255)', '/resources/images/moon.png');
        return;
      }
    } 

  if (event.keyCode === 13) {
    event.preventDefault();
    const val = $(this).val().replace(' ', '&nbsp;');
    if (!val.length) return;
    $('#tagsContainer #tagsDiv').append(`<span onClick="$(this).remove()">#` + val + `&nbsp;×<input type="hidden" name="tagInputs" value="` + val + `"></span>`)
    $(this).val(null);
}  else if (event.keyCode === 8 && !$(this).val().length) {
  // 백스페이스 키 처리 부분 (텍스트 지우기)
  event.preventDefault();
  $('#tagsContainer #tagsDiv > span:last-of-type').remove();
}
});












// 채용공고 등록 취소
const Backbutton = document.getElementById("Backbutton");

Backbutton.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){

        alert("채용공고 등록 취소");
        
        location.href = "allNoticeList";
    }else{

    }

})




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

