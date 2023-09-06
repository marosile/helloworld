/* 게시글 수정 */
const update = document.getElementById("update"); 

update.addEventListener("click", ()=>{

    location.href="/board/update";
});


/* 게시글 목록으로 */
const list = document.getElementById("list");

list.addEventListener("click", function(){

    location.href="/board"
});


/* 게시글 신고 모달창 */
const report = document.getElementById("report");
const reportzone = document.getElementById("report-area");
const close = document.getElementById("close");


report.addEventListener("click", () => {

    reportzone.classList.toggle("report-area");
})

close.addEventListener("click", () => {

    reportzone.classList.toggle("report-area");
})