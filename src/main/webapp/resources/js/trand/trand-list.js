const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
  textArea[i].addEventListener("click", () => {
   
    location.href = "detail";
  });
}

// 왼쪽 태그 클릭 시 색상 유지
var div2 = document.getElementsByClassName("div2");

function handleClick(event) {

  if (event.target.classList[1] === "clicked") {
    event.target.classList.remove("clicked");
  } else {
    for (var i = 0; i < div2.length; i++) {
      div2[i].classList.remove("clicked");
    }

    event.target.classList.add("clicked");
  }
}

function init() {
  for (var i = 0; i < div2.length; i++) {
    div2[i].addEventListener("click", handleClick);
  }
}

init();