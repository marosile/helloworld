const cancelRegistration = document.getElementById("cancelRegistration");
const registerCompany = document.getElementById("registerCompany");
const goToList = document.getElementById("goToList");

// 반려
cancelRegistration.addEventListener("click", () => {

    if(confirm("반려하시겠습니까?")){

        // 반려 문자 보내기

        alert("반려되었습니다.");

        location.href = "/admin/recruitOfficer";
        
    }

})

// 등록
registerCompany.addEventListener("click", () => {

    if(confirm("강사로 등록하시겠습니까?")){

        // 등록 문자 보내기

        alert("등록되었습니다.");

        location.href = "/admin/recruitOfficer";
        
    }

})

// 목록으로
goToList.addEventListener("click", () => {

    location.href = "/admin/recruitOfficer";

})