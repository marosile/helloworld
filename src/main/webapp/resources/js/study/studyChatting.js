// 대화하기 모달창
const FollowArea = document.getElementById("Follow-area");// 대화하기 창
const chattingPlus = document.getElementById("P-studyChatting-follow-btn"); // + 버튼
const close = document.getElementById("close");// x 버튼
const reportBtn = document.getElementById("reportBtn")// 대화하기 버튼
const targetInput = document.getElementById("P-studyChatting-query");// 사용자 검색
const resultArea= document.querySelectorAll(".P-studyChatting-item"); // 검색 결과

let selectChattingNo; // 선택한 채팅방 번호
let selectTargetNo; // 현재 채팅 대상
let selectTargetName; // 대상의 이름
let selectTargetProfile; // 대상의 프로필

// 체팅창 대화 선택
chattingPlus.addEventListener("click", () => {
    FollowArea.classList.toggle("Follow-area");






})

close.addEventListener("click", () => {
    FollowArea.classList.toggle("Follow-area");
})

// 사용자 검색하기
targetInput.addEventListener("input",e=>{

    const query =e.target.value.trim();
    if(query.length==0){
        resultArea.innerHTML="";
        return;
    }

    if(query.length>0){
        fetch("/study/chatting/selectTarget?query=+query")
            .then(resp=> resp.json())
            .then(list=>{

            })
            .catch(e=>console.log(e))
    }
})



// 체팅창 나가기 
const leaveChat = document.getElementById("P-studyChatting-content-out")
leaveChat.addEventListener("click", () => {

    if (confirm("채팅방을 나가시겠습니까?")) {

    }
});

