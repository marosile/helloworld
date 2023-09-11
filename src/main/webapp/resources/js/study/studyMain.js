// 모집하기눌렀을때
const joinStudy = document.getElementById("P-study-btn");
joinStudy.addEventListener("click",()=>{
    location.href="main"
})

// 스터디 클릭
const popularContainer = document.getElementById("P-study-popular-container");
popularContainer.addEventListener("click",()=>{
    location.href="detail"
})


// 스터디 클릭
const studyArea = document.getElementById("P-study-area");
studyArea.addEventListener("click",()=>{
    location.href="detail"
})
