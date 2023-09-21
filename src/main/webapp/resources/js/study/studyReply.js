


selectStudyCommentList = () =>{

    fetch("/commentStudy?boardNo="+boardNo)
        .then(resp => resp.json())
        .then(sList =>{

            location.reload(true);

            console.log(sList);
            const commentList = document.getElementById("reply-area");
            commentList.innerHTML="";

            for(let comment of sList){

                const commentRow = document.createElement("li");
                commentRow.classList.add("replys");

                if(comment.parentNo != 0){
                    commentRow.classList.add("child-comment")
                }

                const commentWriter = document.createElement("div");
                commentWriter.classList.add("inReplyfirstDiv");

                const profileImage = document.createElement("img");

                if(comment.profileImage!=null){
                    profileImage.setAttribute("src",comment.profileImage);
                }else{
                    profileImage.setAttribute("src","/resources/images/user.png");
                }

                const memberNickname = document.createElement("div");
                memberNickname.innerText =comment.memberNickname;

                const commentDate = document.createElement("div");
                commentDate.classList.add("replyCreateDate")
                commentDate.innerHTML = "("+ comment.createDate + ")" ;

                commentWriter.append(profileImage,memberNickname,commentDate);

                const commentContent = document.createElement("div");
                commentContent.classList.add("replyContents");
                commentContent.innerText=comment.commentContent;

                commentRow.append(commentWriter,commentContent);

                //  로그인되
                if(loginMemberId!=""){
                    const commentBtnArea = document.createElement("div");
                    commentBtnArea.classList.add("replyBtns");

                    const childCommentBtn = document.getElementById("button");
                    childCommentBtn.setAttribute("onclick","showInsertComment("+comment.commentNo+", this)");
                    childCommentBtn.innerText="답글";

                    commentBtnArea.append(childCommentBtn);

                    if( loginMemberId == comment.memberId   ){

                        // 수정 버튼
                        const updateBtn = document.createElement("button");
                        updateBtn.innerText = "수정";

                        // 수정 버튼에 onclick 이벤트 속성 추가
                        updateBtn.setAttribute("onclick", "showUpdateComment("+comment.commentNo+", this)");


                        // 삭제 버튼
                        const deleteBtn = document.createElement("button");
                        deleteBtn.innerText = "삭제";
                        // 삭제 버튼에 onclick 이벤트 속성 추가
                        deleteBtn.setAttribute("onclick", "deleteComment("+comment.commentNo+")");


                        // 버튼 영역 마지막 자식으로 수정/삭제 버튼 추가
                        commentBtnArea.append(updateBtn, deleteBtn);

                    }

                    commentRow.append(commentBtnArea);
                }
                commentList.append(commentRow);
            }

        })
        .catch()


}

// 댓글 등록
const commentContent = document.getElementById("commentContent");
const commentBtn = document.getElementById("commentBtn");

commentBtn.addEventListener( "click", e =>{

    if(loginMemberId == ""){
        alert("로그인 후 이용해주세요")
        return
    }
    if(commentContent.value.trim().length==0){
        alert("댓글을 작성한 후 작성버튼을 눌르주세요");
        commentContent.value="";
        commentContent.focus();
        return;
    }

    const data = {
        "commentContent" : commentContent.value,
        "memberId":loginMemberId,
        "boardNo":boardNo
    }

    fetch("/commentStudy",{
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)
    })
        .then( resp => resp.text())
        .then(result => {

            console.log(result)

            if(result>0){
                location.reload(true);
                alert("댓글이 등록되었습니다.")
                commentContent.value="";
            }else{
                alert("댓글 등록이 실패되었습니다.")
            }

        })
        .catch(e => console.log(e))
});

//댓글 삭제
function deleteComment(commentNo){

    if( confirm("정말로 삭제 하시겠습니까?") ){

        fetch("/commentStudy",{
            method:"DELETE",
            headers:{"Content-Type" : "application/json"},
            body : commentNo // 값 하나만 전달 시에는 JSON필요없다
        })
            .then(resp => resp.text())
            .then(result => {

                location.reload(true);
                if(result > 0){
                    alert("삭제되었습니다");
                    selectStudyCommentList(); // 목록을 다시 조회해서 삭제된 글을 제거
                }else{
                    alert("삭제 실패");
                }
            })
            .catch(err => console.log(err));

    }
}
// 댓글 수정(AJAX)
let beforeCommentRow

function updateComment(commentNo,btn){

    const commentContent = btn.parentElement.previousElementSibling.value;
    const data={
        "commentContent":commentContent,
        "commentNo":commentNo
    }
    fetch("/commentStudy",{
        method:"PUT",
        headers : {"Content-Type":"application/json"},
        body : JSON.stringify(data)
    })
        .then(resp=>resp.text())
        .then(result => {

            if(result>0){
                alert("댓글이 수정되었습니다.");
                selectStudyCommentList()

            }else{
                alert("댓글 수정 실패")
            }

        })
        .catch(e=>console.log(e))
}
