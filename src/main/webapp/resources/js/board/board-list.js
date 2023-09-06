
var mySwiper = new Swiper('.swiper-container', {
    slidesPerView: 3, // 한 화면에 보여질 슬라이드 개수
    slidesPerGroup: 2,    // 한 번에 그룹으로 넘어갈 슬라이드 개수
spaceBetween: 10,     // 슬라이드 사이의 간격
    navigation: {
        nextEl: '.swiper-button-next', // 다음 버튼 클래스
        prevEl: '.swiper-button-prev', // 이전 버튼 클래스
    },

    
});

const boardInsert = document.getElementById("boardInsert");

boardInsert.addEventListener("click", () => {

    location.href = "/board/detail";

})