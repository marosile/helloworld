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
        location.href= "/board/" + boardCode;
    }
})

reportBtn.addEventListener("click", ()=>{

    if(confirm("정말 신고하시겠습니까??")){

        alert("게시글 신고가 완료 되었습니다.");
        location.href="detail";

    }
})


/* 북마크 */
const bookMark = document.getElementById("bookMark");

bookMark.addEventListener("click", e=>{

    

    // 로그인 여부
    if(loginMemberId == ""){
         alert("로그인 후 이용해주세요");
         return;
    }

    let check;

    if( e.target.classList.contains("fa-regular")){ // 북마크 안눌렀을 때
        check=0;
    } else {  // 북마크 눌렀을 때
        check=1;
    }

    const data = {
        "MemberId" : loginMemberId,
        "boardNo" : boardNo,
        "check" : check
    };

    fetch("/board/bookMark",{
        method: "post",
        headers:{"Content-Type" : "application/json" },
        body : JSON.stringify(data)
    })
    .then( res => res.text())
    .then( count => {

        if(count == -1) { // DML 실패
            return;
        }

        e.target.classList.toggle("fa-regular");
        e.target.classList.toggle("fa-solid");
    })
    .catch( err => {
        console.log("예외발생")
    })
})