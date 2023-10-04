
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

// 사용자 검색(ajax)
targetInput.addEventListener("input", e => {

    const query = e.target.value.trim();

    console.log(query)

    // 입력된게 없을 때
    if(query.length == 0){
        resultArea.innerHTML = ""; // 이전 검색 결과 비우기
        return;
    }


    // 입력된게 있을 때
    if(query.length > 0){
        fetch("/chatting/selectTarget?query="+query)
            .then(resp => resp.json())
            .then(list => {
                console.log(list);

                resultArea.innerHTML = ""; // 이전 검색 결과 비우기

                if(list.length == 0){
                    const li = document.createElement("li");
                    li.classList.add("result-row");
                    li.innerText = "일치하는 회원이 없습니다";
                    resultArea.append(li);
                }

                for(let member of list){
                    // li요소 생성(한 행을 감싸는 요소)
                    const li = document.createElement("li");
                    li.classList.add("result-row");
                    li.setAttribute("data-id", member.memberNo);

                    // 프로필 이미지 요소
                    const img = document.createElement("img");
                    img.classList.add("result-row-img");

                    // 프로필 이미지 여부에 따른 src 속성 선택
                    if(member.profileImage == null) img.setAttribute("src", "/resources/images/user.png");
                    else   img.setAttribute("src", member.profileImage);

                    let nickname = member.memberNickname;
                    let email = member.memberEmail;

                    const span = document.createElement("span");
                    span.innerHTML = `${nickname} ${email}`.replace(query, `<mark>${query}</mark>`);

                    // 요소 조립(화면에 추가)
                    li.append(img, span);
                    resultArea.append(li);

                    // li요소에 클릭 시 채팅방에 입장하는 이벤트 추가
                    li.addEventListener('click', chattingEnter);
                }

            })
            .catch(err => console.log(err) );
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

