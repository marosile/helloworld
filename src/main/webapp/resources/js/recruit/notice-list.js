const deleteBtn = document.getElementById("deleteBtn");

deleteBtn.addEventListener("click", ()=>{

    if(confirm("정말 삭제하시겠습니까?")){
        location.href
            = "moreDetail?boardNo="+boardNo;
        alert("삭제 되었습니다.")
    }


})