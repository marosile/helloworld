
// 이력서 등록
const Btn = document.getElementById("Btn");

Btn.addEventListener("click", () => {

    if(confirm("xx사에 이력서를 등록하시겠습니까?")){

        alert("xx사에 이력서가 제출되었습니다.");

        location.href = "allNoticeList";

    }else{

    }

})