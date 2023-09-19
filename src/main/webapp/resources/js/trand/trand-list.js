const textArea = document.getElementsByClassName("text-area");

const develope = document.getElementById("develope");
const design = document.getElementById("design");
const marketing = document.getElementById("marketing");
const business = document.getElementById("business");


develope.addEventListener("click", ()=>{

  const type = develope.textContent;

  const data = { "type" : type };


  fetch("/trand/tagList",{
      method: "POST",
      headers:{ "Content-Type" : "application/json" },
      body:JSON.stringify(data)
  })
  .then( resp => resp.text())
  .then( tList => {

    console.log("tList : " + tList);
  })
  .catch( err => {
    console.log("예외발생");
  }) 

})

 










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






