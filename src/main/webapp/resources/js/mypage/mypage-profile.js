/* 팝업 영역 */
/* follower 요소들 */
const follower = document.getElementById("follower"); // 팔로워 버튼
const popup1 = document.getElementById("popup1"); // 팝업창
const closeBtn1 = document.getElementById("closeBtn1"); // 닫기 버튼


/* following 요소 */
const following = document.getElementById("following"); // 보기버튼
const popup2 = document.getElementById("popup2"); // 팝업창
const closeBtn2 = document.getElementById("closeBtn2"); // 닫기 버튼


closeBtn1.addEventListener("click", e =>{
    popup1.classList.toggle("popup");
});

follower.addEventListener("click", e => {
    popup1.classList.toggle("popup");
});


closeBtn2.addEventListener("click", e =>{
    popup2.classList.toggle("popup");
});
following.addEventListener("click", e => {
    popup2.classList.toggle("popup");
});



    







 
