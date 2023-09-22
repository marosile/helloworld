//채팅 클릭 시 채팅화면으로 이동
const chatBtn = document.getElementById("contact-button");

if(chatBtn!=null){
    chatBtn.addEventListener("click", () => {

        location.href = "chatting"
    })
}


// 수정 버튼 시
const updateBtn = document.getElementById("updateBtn");

if(updateBtn!=null){

    updateBtn.addEventListener("click", () => {

        if (confirm("게시글을 수정하시겠습니까?")) {

            location.href = "/study/detail/update/"+boardNo;
        }


    })
}

// 삭제
const deleteBtn = document.getElementById("deleteBtn");

if(deleteBtn!=null){
    deleteBtn.addEventListener("click", () => {

        if (confirm("게시글을 삭제하시겠습니까?")) {

            alert("게시글이 삭제되었습니다.")
            location.href = location.pathname.replace("boardNo")+"/delete"
        }

    })
}


// 모집완료버튼 클릭 시
const completeBtn = document.getElementById("completeBtn");

if(completeBtn!=null){
    completeBtn.addEventListener("click", () => {

        if (confirm("모집완료되신건가요 ?")) {
            alert("🎉 축하합니다! 모집완료되었습니다.")
        }

        const data = {
            "boardNo" :boardNo
        }

        fetch("/study/detail/completed",{
            method:"POST",
            headers:{"Content-Type":"application/json"},
            body:JSON.stringify(data)
        })
            .then(resp=> resp.text())
            .then(result =>{
                console.log(result)

                if(result>0){

                    location.reload(true);
                }
            })
            .catch(e=>{console.log(e)})
    })
}


// 좋아요 클릭 시
const like = document.getElementById("like");
const countSpan = document.getElementById("count");
const loginMemberId = document.getElementById("loginMemberId").value;
const boardNo = document.getElementById("boardNo").value;

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

    fetch("/study/detail/like",{
        method: "POST",
        headers:{"Content-Type" : "application/json" },
        body : JSON.stringify(data)
    })
        .then( res => res.text())
        .then( count => {


            if(count == -1) { // DML 실패
                alert("좋아요 실패 ㅜㅜ");
                return;
            }

            e.target.classList.toggle("fa-regular");
            e.target.classList.toggle("fa-solid");

            countSpan.innerText = count;
           


        })
        .catch( err => {
            console.log("예외발생")
        })
})

// 목록으로
const goToBackBtn = document.getElementById("goToBackBtn");

if (goToBackBtn!=null){

    goToBackBtn.addEventListener("click",function (){
        location.href = `/study/main`;
    })

}