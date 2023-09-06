
// 채용공고 등록
const writeButton = document.getElementById("writeButton");

writeButton.addEventListener("click", () => {

    alert("채용공고가 등록되었습니다.");

    location.href = "allNoticeList";

})

// 채용공고 등록 취소
const Backbutton = document.getElementById("Backbutton");

Backbutton.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){

        alert("채용공고 등록 취소");
        
        location.href = "allNoticeList";
    }else{

    }


})
