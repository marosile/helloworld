// 대화하기 모달창
const FollowArea = document.getElementById("Follow-area");// 대화하기 창
const chattingPlus = document.getElementById("P-studyChatting-content-out"); // + 버튼
const close = document.getElementById("close");// x 버튼
const reportBtn = document.getElementById("reportBtn")// 대화하기 버튼 


chattingPlus.addEventListener("click", () => {
    FollowArea.classList.toggle("Follow-area");
})

close.addEventListener("click", () => {
    FollowArea.classList.toggle("Follow-area");
})

// 나가기 (질문)
const leaveChat = document.getElementById("fa-arrow-right")
const addChatting = document.getElementById("addChatting");

leaveChat.addEventListener("click", () => {

    if (confirm("채팅방을 나가시겠습니까?")) {

    }
});

