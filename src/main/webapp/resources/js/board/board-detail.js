/* 게시글 수정 */
const update = document.getElementById("update"); 

update.addEventListener("click", ()=>{

    location.href="/board2/update";
});


/* 게시글 목록으로 */
const list = document.getElementById("list");

list.addEventListener("click", function(){

    location.href="list";
});


/* 게시글 삭제 */
const deleteBtn = document.getElementById("delete");

deleteBtn.addEventListener("click", () =>{

    if(confirm("정말로 삭제하시겠습니까?")){

        // 삭제 후
        alert("게시글이 삭제되었습니다.");
        location.href="list";

    }else{

    }

})