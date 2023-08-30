const prevButton = document.getElementById('prevSlide');
const nextButton = document.getElementById('nextSlide');
const slideContainer = document.querySelector('.slide-container');

let slideIndex = 0;

prevButton.addEventListener('click', () => {
    if (slideIndex > 0) {
        slideIndex--;
        updateSlidePosition();
    }
});

nextButton.addEventListener('click', () => {
    const slideCount = document.querySelectorAll('.slide-item').length;
    if (slideIndex < slideCount - 2) {
        slideIndex++;
        updateSlidePosition();
    }
});

function updateSlidePosition() {
    const slideWidth = document.querySelector('.slide-item').clientWidth;
    const offset = -slideWidth * slideIndex;
    slideContainer.style.transform = `translateX(${offset}px)`;
}