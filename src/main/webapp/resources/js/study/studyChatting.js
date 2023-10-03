
// 대화하기 모달창
const chattingPlus = document.getElementById("P-studyChatting-follow-btn"); // + 버튼
const FollowArea = document.getElementById("Follow-area"); // 대화하기 창
const close = document.getElementById("close"); // x 버튼
const targetInput = document.getElementById("P-studyChatting-query"); // 검색
const resultArea = document.getElementById("P-studyChatting-search-list-area"); // 검색 결과
const boardNo = document.getElementById("boardNo").value;
const loginMemberId = document.getElementById("loginMemberId").value;


chattingPlus.addEventListener("click", () => {
    FollowArea.classList.toggle("Follow-area");
});

close.addEventListener("click", () => {
    FollowArea.classList.toggle("Follow-area");
});



// 사용자 검색
targetInput.addEventListener("input", e => {
    const query = e.target.value.trim();

    // 입력된 내용이 없을 때
    if (query.length === 0) {
        resultArea.innerHTML = ""; // 이전 검색 결과 비우기
        return;
    }

    if (query.length > 0) {
        fetch("chatting/selectTarget?query="+query)
            .then(resp => resp.json())
            .then(list => {
                console.log(list);
                // 검색 결과를 화면에 표시하거나 처리하는 로직을 추가할 수 있습니다.

                resultArea.innerHTML = ""; // 이전 검색 결과 비우기

                if(list.length == 0) {
                    const div = document.createElement("div");
                    div.classList.add("result-row");
                    div.innerText = "일치하는 회원이 없습니다";
                    resultArea.append(div);

                }
            })
            .catch(error => {
                console.error("검색 에러:", error);
            });
    }
});




// 대화하기 클릭 시 팔로우한 목록을 불러와서 팝업에 표시
chattingPlus.addEventListener("click", () => {
    const data = {
        "memberId": loginMemberId,
        "boardNo": boardNo
    };

    fetch('/study/chatting/getFollowList', {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(data)
    })
        .then(res => res.json())
        .then(followList => {
            if (followList.length == 0) {
                const div = document.createElement("div");
                div.classList.add("");
            }
        })
        .catch(e => {
            console.log(e);
        });
});

//체팅창 나가기
const leaveChat = document.getElementById("P-studyChatting-content-out")
leaveChat.addEventListener("click", () => {

    if (confirm("채팅방을 나가시겠습니까?")) {

    }
})

