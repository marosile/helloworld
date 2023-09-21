/* 게시글 수정 */
const update = document.getElementById("update"); 

if(update != null){
    update.addEventListener("click", ()=>{
    
        location.href="/board2/" + boardCode + "/" + boardNo + "/update";
    }); 
}


/* 게시글 목록으로 */
const list = document.getElementById("list");

if(list != null){

    list.addEventListener("click", function(){
        location.href = `/board/${boardCode}`;
    })

}


/* 게시글 신고 모달창 */
const report = document.getElementById("report");
const reportzone = document.getElementById("report-area");
const close = document.getElementById("close");
const reportBtn = document.getElementById("reportBtn");
const cancelBtn = document.getElementById("cancelBtn");

if(report != null){
    report.addEventListener("click", () => {
    
        reportzone.classList.toggle("report-area");
    })
    
    close.addEventListener("click", () => {
    
        reportzone.classList.toggle("report-area");
    })
    
    cancelBtn.addEventListener("click", () => {
    
        reportzone.classList.toggle("report-area");
    })
}


/* 게시글 삭제 */
const deleteBtn = document.getElementById("deleteBtn");

if(deleteBtn != null){
    deleteBtn.addEventListener("click", ()=>{
    
        if(confirm("정말 삭제하시겠습니까?")){
    
            alert("게시글이 삭제 되었습니다.");
            location.href= "/board2/" + boardCode + "/" + boardNo + "/delete";
        }
    })
}


if(reportBtn != null){
    reportBtn.addEventListener("click", ()=>{
    
        const content = document.getElementById("report-content").value;
    
        if(confirm("정말 신고하시겠습니까??")){
            const data = {
                "boardNo" : boardNo,
                "memberId" : loginMemberId,
                "content" : content
            };
            
            // 신고글 작성
            fetch("/board/report",{
                method: "POST",
                headers:{ "Content-Type" : "application/json" },
                body:JSON.stringify(data)
            })
            .then( resp => resp.text())
            .then( count => {
                
                console.log("count : " + count);
                
                
                alert("게시글 신고가 완료 되었습니다.");
                location.href=`/board/${boardCode}`;
            })
            .catch( err => {
                console.log("예외 발생");
                console.log(err);
            })
    
        }
    })
}


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
        "memberId": loginMemberId,
        "boardNo" : boardNo,
        "bookMarkCheck" : check
    };

    fetch("/board/bookMark",{
        method: "POST",
        headers:{"Content-Type" : "application/json" },
        body : JSON.stringify(data)
    })
    .then( res => res.text())
    .then( count => {

        if(count == -1) { // DML 실패
            alert("fail");
            return;
        }

        e.target.classList.toggle("fa-regular");
        e.target.classList.toggle("fa-solid");
    })
    .catch( err => {
        console.log("예외발생")
    })
})



/* 좋아요 */
const like = document.getElementById("like");

like.addEventListener("click", e=>{

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
        "memberId": loginMemberId,
        "boardNo" : boardNo,
        "likeCheck" : check
    };

    fetch("/board/like",{
        method: "POST",
        headers:{"Content-Type" : "application/json" },
        body : JSON.stringify(data)
    })
    .then( res => res.text())
    .then( count => {

        console.log("count :" + count)

        if(count == -1) { // DML 실패
            alert("좋아요 실패 ㅜㅜ");
            return;
        }

        e.target.classList.toggle("fa-regular");
        e.target.classList.toggle("fa-solid");

        e.target.nextElementSibling.innerText = count;


    })
    .catch( err => {
        console.log("예외발생")
    })
})