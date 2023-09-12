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


// 스와이퍼 초기화
var mySwiper = new Swiper('.swiper-container', {
    slidesPerView: 2, // 화면에 보이는 슬라이드 수
    spaceBetween: 10, // 슬라이드 간 간격
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
});

// 슬라이더 내용 설정
var slideContents = [
    {
        category: '스터디',
        title: '모집중 | 우리 같이 백엔드 공부하는거 어때요?',
        content: '안녕하세요. 3개월 안에 서비스를 릴리즈할 스터디 팀원을 모집합니다...',
    },
    {
        category: '스터디',
        title: '모집중 | 우리 같이 백엔드 공부하는거 어때요?',
        content: '안녕하세요. 3개월 안에 서비스를 릴리즈할 스터디 팀원을 모집합니다...',
    },
    // 추가적인 슬라이드 내용을 필요에 따라 추가
];

// 각 슬라이드에 내용을 추가
var swiperWrapper = document.querySelector('.swiper-wrapper');
for (var i = 0; i < slideContents.length; i++) {
    var slideContent = slideContents[i];

    var slide = document.createElement('div');
    slide.className = 'swiper-slide';

    var studyContainer = document.createElement('div');
    studyContainer.className = 'P-study';

    // 슬라이드 내용 추가
    var studyMain = document.createElement('div');
    studyMain.className = 'P-study-main';
    studyMain.innerHTML = '<span class="P-study-category">' + slideContent.category + '</span>' +
        '<span class="P-like-btn"><i class="fa-regular fa-heart"></i></span>';
    studyContainer.appendChild(studyMain);

    var studyTitle = document.createElement('div');
    studyTitle.className = 'P-study-title';
    studyTitle.innerHTML = '<span class="PN">' + slideContent.title + '</span>' +
        '<span class="PS"> | </span>' + slideContent.content;
    studyContainer.appendChild(studyTitle);

    // 슬라이더에 슬라이드 추가
    slide.appendChild(studyContainer);
    swiperWrapper.appendChild(slide);
}

// 스와이퍼 업데이트
mySwiper.update();
