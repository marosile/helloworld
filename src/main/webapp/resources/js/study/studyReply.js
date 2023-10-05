// 댓글 목록 조회
selectStudyCommentList = () =>{

    fetch("/commentStudy?boardNo="+boardNo)
        .then(resp => resp.json())
        .then(sList =>{


            console.log(sList);
            const commentList = document.getElementById("reply-list");
            commentList.innerHTML="";

            for(let comment of sList){

                const commentRow = document.createElement("li");
                commentRow.classList.add("reply-row");

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
                    alert("삭제되었습니다.");
                    selectStudyCommentList(); // 목록을 다시 조회해서 삭제된 글을 제거
                }else{
                    alert("삭제 실패");
                }
            })
            .catch(err => console.log(err));

    }
}
// 댓글 수정 화면 전환
let beforeCommentRow;

function showUpdateComment(commentNo, btn){

    const temp = document.getElementsByClassName("update-textarea");

    if(temp.length > 0){

        if(confirm("다른 댓글이 수정 중입니다. 현재 댓글을 수정 하시겠습니까?")){

            temp[0].parentElement.innerHTML = beforeCommentRow;

        }else{
            return;
        }
    }

    // 1. 댓글 수정이 클릭된 행을 선택
    const commentRow = btn.parentElement.parentElement; // 수정 버튼의 부모의 부모

    // 2. 행 내용 삭제 전 현재 상태를 저장(백업) (문자열)
    beforeCommentRow = commentRow.innerHTML;

    // 3. 댓글에 작성되어 있던 내용만 얻어오기 -> 새롭게 생성된 textarea 추가될 예정
    let beforeContent = commentRow.children[1].innerHTML;

    //let beforeContent = btn.parentElement.previousElementSibling.innerHTML; 도 가능

    // 4. 댓글 행 내부 내용을 모두 삭제
    commentRow.innerHTML = "";

    // 5. textarea 요소 생성 + 클래스 추가  +  **내용 추가**
    const textarea = document.createElement("textarea");
    textarea.classList.add("update-textarea");

    // ******************************************
    // XSS 방지 처리 해제
    beforeContent =  beforeContent.replaceAll("&amp;", "&");
    beforeContent =  beforeContent.replaceAll("&lt;", "<");
    beforeContent =  beforeContent.replaceAll("&gt;", ">");
    beforeContent =  beforeContent.replaceAll("&quot;", "\"");

    // ******************************************
    textarea.value = beforeContent; // 내용 추가

    // 6. commentRow에 생성된 textarea 추가
    commentRow.append(textarea);

    // 7. 버튼 영역 + 수정/취소 버튼 생성
    const commentBtnArea = document.createElement("div");
    commentBtnArea.classList.add("replyBtns");


    const updateBtn = document.createElement("button");
    updateBtn.innerText = "수정";
    updateBtn.setAttribute("onclick", "updateComment("+commentNo+", this)");


    const cancelBtn = document.createElement("button");
    cancelBtn.innerText = "취소";
    cancelBtn.setAttribute("onclick", "updateCancel(this)");

    // 8. 버튼영역에 버튼 추가 후
    //    commentRow(행)에 버튼영역 추가
    commentBtnArea.append(updateBtn, cancelBtn);
    commentRow.append(commentBtnArea);

}

// 댓글 수정 취소
function updateCancel(btn){
    if(confirm("댓글 수정을 취소하시겠습니까?")){
        btn.parentElement.parentElement.innerHTML=beforeCommentRow;
    }
}



// 댓글 수정(AJAX)
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
                location.reload(true);
                alert("댓글이 수정되었습니다.");
                selectStudyCommentList()

            }else{
                alert("댓글 수정 실패")
            }

        })


        .catch(e=>console.log(e))
}
// 답글 작성 화면 추가 (답글 작성은 1개만 가능)
function showInsertComment(parentNo,btn){
    const temp = document.getElementsByClassName("commentInsertContent");

    if(temp.length>0){
        if(confirm("다른 답글 작성중입니다. 현재 댓글에 답글을 작성하시겠습니까?")){
            temp[0].nextElementSibling.remove();
            temp[0].remove();

        }else{
            return;
        }
    }

    const textarea = document.createElement("textarea");
    textarea.classList.add("commentInsertContent")

    btn.parentElement.after(textarea);

    const commentBtnArea = document.createElement("div");
    commentBtnArea.classList.add("replyBtns");

    const insertBtn = document.createElement("button");
    insertBtn.innerText="등록";
    insertBtn.setAttribute("onclick","insertChildComment("+parentNo+",this)");

    const cancelBtn = document.createElement("button");
    cancelBtn.innerText = "취소";
    cancelBtn.setAttribute("onclick", "insertCancel(this)");

// 답글 버튼 영역의 자식으로 등록/취소 버튼 추가
    commentBtnArea.append(insertBtn, cancelBtn);


    textarea.after(commentBtnArea)

}
// 답글 작성 취소
function insertCancel(btn){

    btn.parentElement.previousElementSibling.remove();
    btn.parentElement.remove();

}
// 답글 등록
function insertChildComment(parentNo,btn){

    const commentContent = btn.parentElement.previousElementSibling.value

    if(commentContent.trim().length==0){

        console.log(commentContent);
        alert("답글 작성 후 등록 버튼을 클릭해주세요.");
        btn.parentElement.parentElement.value="";
        btn.parentElement.parentElement.focus();
        return;
    }

    const data = {
        "commentContent" :commentContent,
        "boardNo" :boardNo,
        "parentNo":parentNo,
        "memberId": loginMemberId
    }

    fetch("/commentStudy",{
        method:"POST",
        headers:{"Content-Type":"application/json"},
        body : JSON.stringify(data)
    })
        .then(resp=>resp.text())
        .then(result=>{
            if(result>0){
                location.reload(true);
                alert("댓글 등록이 완료되었습니다.")
                return;

            }else{
                alert("댓글 등록 실패")
            }

        })
        .catch(err=>console.log(err))

}


