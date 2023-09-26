const cancelRegistration = document.getElementById("cancelRegistration");
const registerCompany = document.getElementById("registerCompany");
const goToList = document.getElementById("goToList");
const updateForm = document.getElementById("updateForm");
const deleteForm = document.getElementById("deleteForm");
const deleteCompony = document.getElementById("deleteCompony");

// 반려
if(cancelRegistration != null){
    cancelRegistration.addEventListener("click", () => {

        if(confirm("반려하시겠습니까?")){

            // 반려 문자 보내기


        }

    })
}


// 등록
// registerCompany.addEventListener("click", () => {
//
//     if(confirm("채용 담당자로 등록하시겠습니까?")){
//
//         //location.href = "/admin/recruitOfficer/detail/update";
//         // 등록 문자 보내기
//
//         //alert("등록되었습니다.");
//     }
//
// })



if(updateForm != null && deleteForm == null){
    updateForm.addEventListener("submit", (e) => {
        if(!confirm("채용 담당자로 등록하시겠습니까?")){
            e.preventDefault();
        }
    });
}

// 서버에 폼태그가 제출될 때
if(deleteForm != null && updateForm == null){
    deleteForm.addEventListener("submit", (e) => {
        if(!confirm("채용 담당자에서 해지시키겠습니까?")){
            e.preventDefault();
        }
    });
}
// if(deleteCompony != null && updateForm == null) {
//     deleteCompony.addEventListener("click", (e) => {
//         if (!confirm("채용 담당자에서 해지시키겠습니까?")) {
//             e.preventDefault();
//         }
//     });
// }



// 목록으로
// goToList.addEventListener("click", () => {
//
//     location.href = "/admin/recruitOfficer";
//
// })