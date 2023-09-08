const slider = document.getElementById('slider');
const slides = document.querySelectorAll('.slide');
const prevButton = document.getElementById('prev');
const nextButton = document.getElementById('next');
let currentIndex = 0;

function showSlide(index) {
    slides.forEach((slide, i) => {
        if (i === index) {
            slide.classList.add('active');
        } else {
            slide.classList.remove('active');
        }
    });
}

function prevSlide() {
    if (currentIndex > 0) {
        currentIndex -= 1; 
        showSlide(currentIndex);
    }
}

function nextSlide() {
    if (currentIndex < slides.length - 1) { // slide는 배열형태와 유사한 객체
        currentIndex += 1;
        showSlide(currentIndex);
    }
}

prevButton.addEventListener('click', prevSlide);
nextButton.addEventListener('click', nextSlide);

// 초기에 첫 번째 슬라이드를 보여줍니다.
showSlide(currentIndex);

function createSlide(number) {
    const sliderContainer = document.getElementById("sliderContainer");

    // 새로운 슬라이드 요소 생성
    const slide = document.createElement("div");
    slide.className = "slide";
    slide.textContent = `페이지 ${number} 내용`;

    // 슬라이드를 슬라이더 컨테이너에 추가
    sliderContainer.appendChild(slide); 
}

// 슬라이드 개수 설정
const numberOfSlides = 6;

// 슬라이드를 동적으로 생성하여 추가
for (let i = 1; i <= numberOfSlides; i++) {
    createSlide(i);
}