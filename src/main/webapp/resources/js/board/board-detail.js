/* 게시글 수정 */
const update = document.getElementById("update"); 

update.addEventListener("click", ()=>{

    location.href="/board2/" + boardCode + "/" + boardNo + "/update";
}); 


/* 게시글 목록으로 */
const list = document.getElementById("list");

list.addEventListener("click", function(){
    location.href= boardCode;
})


/* 게시글 신고 모달창 */
const report = document.getElementById("report");
const reportzone = document.getElementById("report-area");
const close = document.getElementById("close");
const reportBtn = document.getElementById("reportBtn");

report.addEventListener("click", () => {

    reportzone.classList.toggle("report-area");
})

close.addEventListener("click", () => {

    reportzone.classList.toggle("report-area");
})


/* 게시글 삭제 */
const deleteBtn = document.getElementById("deleteBtn");

deleteBtn.addEventListener("click", ()=>{

    if(confirm("정말 삭제하시겠습니까?")){

        alert("게시글이 삭제 되었습니다.");
        location.href= boardCode;
    }
})

reportBtn.addEventListener("click", ()=>{

    if(confirm("정말 신고하시겠습니까??")){

        alert("게시글 신고가 완료 되었습니다.");
        location.href="detail";

    }
})
