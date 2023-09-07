const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
  textArea[i].addEventListener("click", () => {
   
    location.href = "detail";
  });
}


// 해쉬태그 클릭 시 
const tagArea = document.getElementsByClassName("tagArea")
for(let i=0; i < tagArea.length; i++) {
  tagArea[i].addEventListener("click", () => {

    tagArea[i].classList.toggle("tagArea");

  })
}
