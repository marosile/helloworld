/* 팝업 영역 */
/* row2 요소들 */
const popupBtn1 = document.getElementById("popupBtn1"); // 보기 버튼
const popup1 = document.getElementById("popup1"); // 팝업창
const closeBtn1 = document.getElementById("closeBtn1"); // 닫기 버튼


/* row3 요소 */
const popupBtn2 = document.getElementById("popupBtn2"); // 보기버튼
const popup2 = document.getElementById("popup2"); // 팝업창
const closeBtn2 = document.getElementById("closeBtn2"); // 닫기 버튼


closeBtn1.addEventListener("click", e =>{
    popup1.classList.toggle("popup");

});
popupBtn1.addEventListener("click", e => {
    popup1.classList.toggle("popup");

});


closeBtn2.addEventListener("click", e =>{
    popup2.classList.toggle("popup");
});
popupBtn2.addEventListener("click", e => {
    popup2.classList.toggle("popup");
});



    







 
