

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
  .then( resp => resp.json())
  .then( tList => {

    document.getElementById("right-area").innerHTML='';
    var i = 1;

    tList.forEach ( tList => {

          

          var postAppends = 
                        '<div class="row-area">' +
                              '<div class="row1-1">' +
                                  '<div class="number">' + i++ + '</div>' +
                                  '<div class="profile">' + '<img src="' + tList.profileImage +'" id="userProfile">' + '</div>' +
                                  '<div class="name-area">' +
                                         '<div class="name">' + tList.memberId + '</div>' +
                                         '<div class="nickname">' + tList.memberNickname + '</div>' +
                                  '</div>' +
                              '</div>' +

                              '<div class="row1-2">' + 
                                    '<div class="text-area" data-boardNo='+ tList.boardNo + '>' +
                                        '<div class="title">' + tList.boardTitle + '</div>' +
                                        '<div class="content">' + tList.boardContent + '</div>' +
                                    '</div>' +
                                    '<div class="picture">' + '<img src="/resources/images/trand/sample.jpg" id="pic">' + '</div>' +
                              '</div>' +

                              '<div class="row1-3">' +
                                    '<div class="heart">' + '<i class="fa-solid fa-heart">'+'</i>'+ tList.likeCount + '</div>' +
                                    '<div class="bookmark">' + '<i class="fa-solid fa-eye">' + '</i>' + tList.readCount + '</div>' +
                              '</div>' +
                        '</div>';      

                    $('#right-area').append(postAppends);  
    });


            
const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
  textArea[i].addEventListener("click", (e) => {

    const boardNo = e.currentTarget.getAttribute("data-boardno");

    location.href = "detail?boardNo=" + boardNo;
  });
}

  })
  .catch( err => {
    console.log("예외발생");
  })

})

design.addEventListener("click", ()=>{

  const type = design.textContent;

  const data = { "type" : type };

  fetch("/trand/tagList",{
      method: "POST",
      headers:{ "Content-Type" : "application/json" },
      body:JSON.stringify(data)
  })
  .then( resp => resp.json())
  .then( tList => {

    document.getElementById("right-area").innerHTML='';
    var i = 1;

    tList.forEach ( tList => {

          

      var postAppends = 
                    '<div class="row-area">' +
                          '<div class="row1-1">' +
                              '<div class="number">' + i++ + '</div>' +
                              '<div class="profile">' + '<img src="' + tList.profileImage +'" id="userProfile">' + '</div>' +
                              '<div class="name-area">' +
                                     '<div class="name">' + tList.memberId + '</div>' +
                                     '<div class="nickname">' + tList.memberNickname + '</div>' +
                              '</div>' +
                          '</div>' +

                          '<div class="row1-2">' + 
                                '<div class="text-area" data-boardNo='+ tList.boardNo + '>' +
                                    '<div class="title">' + tList.boardTitle + '</div>' +
                                    '<div class="content">' + tList.boardContent + '</div>' +
                                '</div>' +
                                '<div class="picture">' + '<img src="/resources/images/trand/sample.jpg" id="pic">' + '</div>' +
                          '</div>' +

                          '<div class="row1-3">' +
                                '<div class="heart">' + '<i class="fa-solid fa-heart">'+'</i>'+ tList.likeCount + '</div>' +
                                '<div class="bookmark">' + '<i class="fa-solid fa-eye">' + '</i>' + tList.readCount + '</div>' +
                          '</div>' +
                    '</div>';      

                $('#right-area').append(postAppends);  
});


        
const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
textArea[i].addEventListener("click", (e) => {

const boardNo = e.currentTarget.getAttribute("data-boardno");

location.href = "detail?boardNo=" + boardNo;
});
}

})
  .catch( err => {
    console.log("예외발생");
  })

})

marketing.addEventListener("click", ()=>{

  const type = marketing.textContent;

  const data = { "type" : type };

  fetch("/trand/tagList",{
      method: "POST",
      headers:{ "Content-Type" : "application/json" },
      body:JSON.stringify(data)
  })
  .then( resp => resp.json())
  .then( tList => {

    document.getElementById("right-area").innerHTML='';
    var i = 1;

    tList.forEach ( tList => {

          

      var postAppends = 
                    '<div class="row-area">' +
                          '<div class="row1-1">' +
                              '<div class="number">' + i++ + '</div>' +
                              '<div class="profile">' + '<img src="' + tList.profileImage +'" id="userProfile">' + '</div>' +
                              '<div class="name-area">' +
                                     '<div class="name">' + tList.memberId + '</div>' +
                                     '<div class="nickname">' + tList.memberNickname + '</div>' +
                              '</div>' +
                          '</div>' +

                          '<div class="row1-2">' + 
                                '<div class="text-area" data-boardNo='+ tList.boardNo + '>' +
                                    '<div class="title">' + tList.boardTitle + '</div>' +
                                    '<div class="content">' + tList.boardContent + '</div>' +
                                '</div>' +
                                '<div class="picture">' + '<img src="/resources/images/trand/sample.jpg" id="pic">' + '</div>' +
                          '</div>' +

                          '<div class="row1-3">' +
                                '<div class="heart">' + '<i class="fa-solid fa-heart">'+'</i>'+ tList.likeCount + '</div>' +
                                '<div class="bookmark">' + '<i class="fa-solid fa-eye">' + '</i>' + tList.readCount + '</div>' +
                          '</div>' +
                    '</div>';      

                $('#right-area').append(postAppends);  
});


        
const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
textArea[i].addEventListener("click", (e) => {

const boardNo = e.currentTarget.getAttribute("data-boardno");

location.href = "detail?boardNo=" + boardNo;
});
}

})
  .catch( err => {
    console.log("예외발생");
  })

})


business.addEventListener("click", ()=>{

  const type = business.textContent;

  const data = { "type" : type };

  fetch("/trand/tagList",{
      method: "POST",
      headers:{ "Content-Type" : "application/json" },
      body:JSON.stringify(data)
  })
  .then( resp => resp.json())
  .then( tList => {

    document.getElementById("right-area").innerHTML='';
    var i = 1;

    tList.forEach ( tList => {

          

      var postAppends = 
                    '<div class="row-area">' +
                          '<div class="row1-1">' +
                              '<div class="number">' + i++ + '</div>' +
                              '<div class="profile">' + '<img src="' + tList.profileImage +'" id="userProfile">' + '</div>' +
                              '<div class="name-area">' +
                                     '<div class="name">' + tList.memberId + '</div>' +
                                     '<div class="nickname">' + tList.memberNickname + '</div>' +
                              '</div>' +
                          '</div>' +

                          '<div class="row1-2">' + 
                                '<div class="text-area" data-boardNo='+ tList.boardNo + '>' +
                                    '<div class="title">' + tList.boardTitle + '</div>' +
                                    '<div class="content">' + tList.boardContent + '</div>' +
                                '</div>' +
                                '<div class="picture">' + '<img src="/resources/images/trand/sample.jpg" id="pic">' + '</div>' +
                          '</div>' +

                          '<div class="row1-3">' +
                                '<div class="heart">' + '<i class="fa-solid fa-heart">'+'</i>'+ tList.likeCount + '</div>' +
                                '<div class="bookmark">' + '<i class="fa-solid fa-eye">' + '</i>' + tList.readCount + '</div>' +
                          '</div>' +
                    '</div>';      

                $('#right-area').append(postAppends);  
});


        
const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
textArea[i].addEventListener("click", (e) => {

const boardNo = e.currentTarget.getAttribute("data-boardno");

location.href = "detail?boardNo=" + boardNo;
});
}

})
  .catch( err => {
    console.log("예외발생");
  })

})


const textArea = document.getElementsByClassName("text-area");

// 각각의 상세페이지로
for (let i = 0; i < textArea.length; i++) {
  textArea[i].addEventListener("click", (e) => {

    const boardNo = e.currentTarget.getAttribute("data-boardno");

    location.href = "detail?boardNo=" + boardNo;
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

var boardContent = boardContent; // 예제 데이터
var maxLength = 20;

var truncatedText = truncateText(boardContent, maxLength);

document.getElementById("content").textContent = truncatedText;

function truncateText(text, maxLength) { // 매개변수명 수정: text
  if (text.length > maxLength) {
      return text.slice(0, maxLength) + '...'; // text로 수정: maxLength 이상인 경우 일부 문자를 자르고 '...'을 추가
  } else {
      return text; // maxLength 이하인 경우 그대로 반환
  }
}
