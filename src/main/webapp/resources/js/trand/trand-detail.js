const goToBackButton = document.getElementById("goToBackButton");

// 목록으로 버튼
goToBackButton.addEventListener("click", () => {
    location.href = "list";
})


const top10 = document.getElementById("top10");

top10.addEventListener("click", ()=>{
    location.href = "list";
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

    if( e.target.classList.contains("fa-regular")){
        check=0;
    } else {  
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





