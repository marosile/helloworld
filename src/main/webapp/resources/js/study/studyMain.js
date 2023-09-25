
// 모집하기눌렀을때
const joinStudy = document.getElementById("P-study-btn");
const loginMemberId = document.getElementById("loginMemberId").value;

joinStudy.addEventListener("click", () => {

    if(loginMemberId==""){
        alert("로그인 후 이용해주세요")
    }else{
        location.href = "/study/write";
    }



})

// 카테고리 - 역할 클릭 했을때
const categoryBtn = document.querySelector('.P-body-category-btn');
const selectBoxRole = document.querySelector('.P-selectBox-role');

categoryBtn.addEventListener("click", () => {

    selectBoxRole.classList.toggle("menuHidden")

});

selectBoxRole.addEventListener("click", (e) => {
    if (e.target.nodeName === "BUTTON") {
        const selectedRole = e.target.innerHTML; // 클릭한 버튼의 내용(예: "프론트앤드")을 가져옴
        categoryBtn.innerHTML = selectedRole;
        selectBoxRole.classList.add("menuHidden")

        // selectedRole 값을 해당 요소의 value 속성에 설정
        document.getElementById("selectedRole").value = selectedRole;
    }
});



// 카테고리 - 위치를 클릭 했을떄
const purposeBtn = document.querySelector('.P-body-purpose-btn');
const selectBoxPurpose = document.querySelector('.P-selectBox-purpose');

purposeBtn.addEventListener("click", () => {

    selectBoxPurpose.classList.toggle("menuHidden")

})

selectBoxPurpose.addEventListener("click", (e) => {

    if (e.target.nodeName == "BUTTON") {
        const seoulGuList = e.target.innerHTML;
        purposeBtn.innerHTML = seoulGuList;
        selectBoxPurpose.classList.add("menuHidden")

        document.getElementById("seoulGuList").value=seoulGuList;
    }
})


// 카테고리 - 인원 클릭 했을때
const countBtn = document.querySelector('.P-body-count-btn'); /* 큰 버튼 */
const selectBoxCount = document.querySelector('.P-selectBox-count'); /* 숨겨진 버튼 */
const minusBtn = document.getElementById("P-minusBtn"); /* +버튼 */
const count = document.getElementById("count"); /* 숫자 작성 */
const plusBtn = document.getElementById("P-plusBtn"); /* -버튼 */
const personBtn = document.getElementById("P-personBtn"); /* 완료버튼 */

countBtn.addEventListener("click", () => {
    selectBoxCount.classList.toggle("menuHidden")
})

let count1 = 1

minusBtn.addEventListener("click", () => {


    if (count1 > 1) {
        count1--

    }
    count.innerText = count1;
})

plusBtn.addEventListener("click", () => {

    count1++
    count.innerText = count1;

})

personBtn.addEventListener("click", (e) => {

    if (e.target.nodeName == "BUTTON") {
        selectBoxCount.classList.add("menuHidden")
        countBtn.innerText = "인원 : " + count1

        document.getElementById('countInput').value = count1;
    }


})

var mySwiper = new Swiper('.swiper-container', {
    slidesPerView: 2, // 한 화면에 보여질 슬라이드 개수
    slidesPerGroup: 2,    // 한 번에 그룹으로 넘어갈 슬라이드 개수
    spaceBetween: 10,     // 슬라이드 사이의 간격
    navigation: {
        nextEl: '.swiper-button-next', // 다음 버튼 클래스
        prevEl: '.swiper-button-prev', // 이전 버튼 클래스
    },

});

// 목록 조회  id 중복이 안되니까 class로 가져오는것!
/*const studyArea = document.getElementsByClassName("P-study-area");

    for(let i=0; i<studyArea.length;i++){
        studyArea[i].addEventListener("click",()=>{

            location.href ="detail";

        });
    }*/

// 각 like 버튼에 대한 이벤트 핸들러를 추가
const likeButtons = document.querySelectorAll(".like-button");

likeButtons.forEach(likeButton => {
    likeButton.addEventListener("click", e => {
        e.preventDefault();

        if (loginMemberId == "") {
            alert("로그인 후 이용해주세요");
            return;
        }

        let check;

        if (likeButton.querySelector("i").classList.contains("fa-regular")) {
            check = 0;
        } else {
            check = 1;
        }

        const data = {
            "memberId": loginMemberId,
            "boardNo": likeButton.id.replace("like", ""), // like 버튼의 ID에서 숫자 부분을 추출
            "likeCheck": check
        }

        fetch("/study/main/like", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        })
            .then(res => res.text())
            .then(count => {
                if (count == -1) { // DML 실패
                    alert("좋아요 실패 ㅜㅜ");
                    return;
                }
                likeButton.querySelector("i").classList.toggle("fa-regular");
                likeButton.querySelector("i").classList.toggle("fa-solid");
                // 좋아요 개수를 업데이트하는 부분 (생략)
            })
            .catch(err => {
                console.log("예외 발생");
            })
    });
});

