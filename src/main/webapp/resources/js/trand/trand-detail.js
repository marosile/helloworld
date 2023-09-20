const goToBackButton = document.getElementById("goToBackButton");

// 목록으로 버튼
goToBackButton.addEventListener("click", () => {
    location.href = "list";
})


const top10 = document.getElementById("top10");

top10.addEventListener("click", ()=>{
    location.href = "list";
})



/* 북마크 */
const bookMark = document.getElementById("bookMark");

bookMark.addEventListener("click", e=>{
    
    // 로그인 여부
    if(loginMemberId == ""){
         alert("로그인 후 이용해주세요");
         return;
    }

    let check;

    if( e.target.classList.contains("fa-regular")){ // 북마크 안눌렀을 때
        check=0;
    } else {  // 북마크 눌렀을 때
        check=1;
    }

    const data = {
        "memberId": loginMemberId,
        "boardNo" : boardNo,
        "bookMarkCheck" : check
    };

    fetch("/board/bookMark",{
        method: "POST",
        headers:{"Content-Type" : "application/json" },
        body : JSON.stringify(data)
    })
    .then( res => res.text())
    .then( count => {

        if(count == -1) { // DML 실패
            alert("fail");
            return;
        }

        e.target.classList.toggle("fa-regular");
        e.target.classList.toggle("fa-solid");
    })
    .catch( err => {
        console.log("예외발생")
    })
})



/* 좋아요 */
const like = document.getElementById("like");

like.addEventListener("click", e=>{

    // 로그인 여부
    if(loginMemberId == ""){
         alert("로그인 후 이용해주세요");
         return;
    }

    let check;

    if( e.target.classList.contains("fa-regular")){
        check=0;
    } else {  
        check=1;
    }

    const data = {
        "memberId": loginMemberId,
        "boardNo" : boardNo,
        "likeCheck" : check
    };

    fetch("/board/like",{
        method: "POST",
        headers:{"Content-Type" : "application/json" },
        body : JSON.stringify(data)
    })
    .then( res => res.text())
    .then( count => {

        console.log("count :" + count)

        if(count == -1) { // DML 실패
            alert("좋아요 실패 ㅜㅜ");
            return;
        }

        e.target.classList.toggle("fa-regular");
        e.target.classList.toggle("fa-solid");

        e.target.nextElementSibling.innerText = count;
        
    })
    .catch( err => {
        console.log("예외발생")
    })
})





/* 댓글 영역 */
selectCommentList = () => {

    fetch("/comment?boardNo=" + boardNo) 
    
    .then(response => response.json()) 
    
    .then(cList => { 
        console.log(cList);

        // 화면에 출력되어 있는 댓글 목록 삭제
        const replys = document.getElementById("replys"); // ul태그
        replys.innerHTML = "";

        // cList에 저장된 요소를 하나씩 접근
        for(let comment of cList){

            // 행
            const commentRow = document.createElement("li");
            commentRow.classList.add("reply-row");

            // 답글일 경우 child-comment 클래스 추가
            if(comment.parentNo != 0)  commentRow.classList.add("child-comment");


            // 작성자
            const commentWriter = document.createElement("p");
            commentWriter.classList.add("reply-writer");

            // 프로필 이미지
            const profileImage = document.createElement("img");

            if( comment.profileImage != null ){ // 프로필 이미지가 있을 경우
                profileImage.setAttribute("src", comment.profileImage);
            }else{ // 없을 경우 == 기본이미지
                profileImage.setAttribute("src", "/resources/images/user.png");
            }

            // 작성자 닉네임
            const memberNickname = document.createElement("span");
            memberNickname.innerText = comment.memberNickname;
            
            // 작성일
            const commentDate = document.createElement("span");
            commentDate.classList.add("reply-date");
            commentDate.innerText =  "(" + comment.createDate + ")";

            // 작성자 영역(p)에 프로필,닉네임,작성일 마지막 자식으로(append) 추가
            commentWriter.append(profileImage , memberNickname , commentDate);


            // 댓글 내용
            const commentContent = document.createElement("p");
            commentContent.classList.add("reply-content");
            commentContent.innerHTML = comment.commentContent;
         
                     // 행에 작성자, 내용 추가
                     commentRow.append(commentWriter, commentContent);

            
            // 로그인이 되어있는 경우 답글 버튼 추가
            if(loginMemberId != ""){
                // 버튼 영역
                const commentBtnArea = document.createElement("div");
                commentBtnArea.classList.add("reply-btn-area");

                // 답글 버튼
                const childCommentBtn = document.createElement("button");
                childCommentBtn.setAttribute("onclick", "showInsertComment("+comment.commentNo+", this)");
                childCommentBtn.innerText = "답글";

                // 버튼 영역에 답글 버튼 추가
                commentBtnArea.append(childCommentBtn);

                // 로그인한 회원번호와 댓글 작성자의 회원번호가 같을 때만 버튼 추가
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

                } // if 끝
                

                // 행에 버튼영역 추가
                commentRow.append(commentBtnArea); 
            }
            

            // 댓글 목록(ul)에 행(li)추가
            commentList.append(commentRow);
        }


    })
    .catch(err => console.log(err));

}






