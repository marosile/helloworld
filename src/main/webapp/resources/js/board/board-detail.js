/* 게시글 수정 */
const update = document.getElementById("update"); 

update.addEventListener("click", ()=>{

    location.href="/board/update";
});


/* 게시글 목록으로 */
const list = document.getElementById("list");

list.addEventListener("click", function(){

    location.href="/board"
});