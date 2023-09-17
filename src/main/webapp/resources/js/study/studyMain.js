// 모집하기눌렀을때
const joinStudy = document.getElementById("P-study-btn");

joinStudy.addEventListener("click",()=>{

    location.href ="/study/write"

})

// 카테고리 - 역할 클릭 했을때
const categoryBtn = document.querySelector('.P-body-category-btn');
const selectBoxRole = document.querySelector('.P-selectBox-role');

categoryBtn.addEventListener("click", () => {

    selectBoxRole.classList.toggle("menuHidden")

});

selectBoxRole.addEventListener("click", (e) => {

    if (e.target.nodeName === "BUTTON") {
        categoryBtn.innerHTML = e.target.innerHTML;
        selectBoxRole.classList.add("menuHidden")
    }

});




// 카테고리 - 목적 클릭 했을때
const purposeBtn = document.querySelector('.P-body-purpose-btn');
const selectBoxPurpose = document.querySelector('.P-selectBox-purpose');

purposeBtn.addEventListener("click", () => {

    selectBoxPurpose.classList.toggle("menuHidden")

})

selectBoxPurpose.addEventListener("click", (e) => {

    if (e.target.nodeName == "BUTTON") {
        purposeBtn.innerHTML = e.target.innerHTML;
        selectBoxPurpose.classList.add("menuHidden")
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
const studyArea = document.getElementsByClassName("P-study-area");

    for(let i=0; i<studyArea.length;i++){
        studyArea[i].addEventListener("click",()=>{

            location.href ="detail"
        
        });
    }

