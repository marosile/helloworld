//채팅 클릭 시 채팅화면으로 이동
const chatBtn = document.getElementById("contact-button");

chatBtn.addEventListener("click",()=>{

    location.href="chatting"
})

// 수정 버튼 시 
const updateBtn = document.getElementById("updateBtn");
updateBtn.addEventListener("click",()=>{

    if(confirm("게시글을 수정하시겠습니까?")){

        location.href="/study/write"
    }


})

// 수정 버튼 시 
const deleteBtn = document.getElementById("deleteBtn");
deleteBtn.addEventListener("click",()=>{

    if(confirm("게시글을 삭제하시겠습니까?")){

        alert("게시글이 삭제되었습니다.")
        location.href="/study/main"
    }

})

// 모집완료버튼 클릭 시
const complete = document.getElementById("complete");

complete.addEventListener("click",()=>{

        if(confirm("모집완료되신건가요 ?")){
            alert("🎉 축하합니다! 모집완료되었습니다.")
        }
})

