// 대화하기 모달창
const chattingPlus = document.getElementById("P-studyChatting-follow-btn"); // + 버튼
const FollowArea = document.getElementById("Follow-area"); // 대화하기 창
const close = document.getElementById("close"); // x 버튼

// 대화하기 클릭 시 팔로우한 목록을 불러와서 팝업에 표시
chattingPlus.addEventListener("click", () => {


    const data ={
        "memberId":loginMemberId,
        "boardNo":boardNo
    }

    const url = `/study/chatting?boardNo=${boardNo}&memberId=${loginMemberId}`;

        fetch(url,{
            method:"POST",
            headers:{"Content-Type":"application/json"},
            body:JSON.stringify(data)
        })
            .then(res => res.text())
            .then(followList=>{

            })
            .catch(e=>{console.log(e)})



});

close.addEventListener("click", () => {
    FollowArea.classList.toggle("Follow-area");
});

//체팅창 나가기
const leaveChat = document.getElementById("P-studyChatting-content-out")
leaveChat.addEventListener("click", () => {

    if (confirm("채팅방을 나가시겠습니까?")) {

    }
})
