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




/* =================== 이력서 약관동의 ==================== */
const allcheck = document.getElementById("allcheck"); // 전체동의 박스
const boxList = document.getElementsByName("boxList"); // 나머지 체크 박스들

const saveBtn = document.getElementById("saveBtn");

saveBtn.addEventListener("click", e =>{

    // 세가지 항목이 체크 안됐을때 
    if(!box2.checked){
        alert("약관 동의 후 저장해주세요.");
        e.preventDefault();
        return;
    }
    if(!box3.checked){
        alert("약관 동의 후 저장해주세요.");
        e.preventDefault();
        return;
    }
    if(!box4.checked){
        alert("약관 동의 후 저장해주세요.");
        e.preventDefault();
        return;
    }
});

// 전체 동의 선택 시 전체 선택 하기
allcheck.addEventListener("click", function(){
    for(let i=0; i<boxList.length; i++){
        boxList[i].checked = allcheck.checked;
    }
});


// 체크박스 하나 풀렸을때 전체동의 박스도 풀리게 하기
this.addEventListener("click", function(e){
    for(let i =0; i<boxList.length; i++){
        if(e.target == boxList[i]){
            if(!this.checked && allcheck.checked){
                allcheck.checked = false;
            }
            
            let flag = true;
            for(let j=0; j<boxList.length; j++){
                if(!boxList[j].checked){
                    flag = false;
                }
            }

            if(!allcheck.checked && flag){
                allcheck.checked = true;
            }

        }
        
    }
});








    







 
