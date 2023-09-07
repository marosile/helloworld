const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
  textArea[i].addEventListener("click", () => {
   
    location.href = "detail";
  });
}