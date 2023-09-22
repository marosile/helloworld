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



// 댓글 목록 조회
selectCommentList = () => {

    fetch("/comment?boardNo=" + boardNo) 
    
    .then(response => response.json()) 
    
    .then(cList => { 
        console.log(cList);

        // 화면에 출력되어 있는 댓글 목록 삭제
        const commentList = document.getElementById("reply-list"); // ul태그
        commentList.innerHTML = "";

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
                    const updateBtn = document.createElement("updateBtn");
                    updateBtn.innerText = "수정";

                    // 수정 버튼에 onclick 이벤트 속성 추가
                    updateBtn.setAttribute("onclick", "showUpdateComment("+comment.commentNo+", this)");                        


                    // 삭제 버튼
                    const deleteBtn = document.createElement("deleteBtn");
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

// -----------------------------------------------------------------------------------------------
// 댓글 등록

const addComment = document.getElementById("addComment");
const commentContent = document.getElementById("commentContent");

addComment.addEventListener("click", e => { 
   
    if(loginMemberId == ""){ 
        alert("로그인 후 이용해주세요.");
        return;
    }

    // 2) 댓글 내용이 작성되어있나?
    if(commentContent.value.trim().length == 0){ 
        alert("댓글을 작성한 후 버튼을 클릭해주세요.");

        commentContent.value = ""; 
        commentContent.focus();
        return;
    }

    const data = {"commentContent" : commentContent.value,
                  "memberId" : loginMemberId,
                  "boardNo" : boardNo} 
    
    fetch("/comment", {
        method : "POST",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data) 
    })
    .then( resp => resp.text())
    .then(result => {
        if(result > 0){ 
            alert("댓글이 등록되었습니다.");

            commentContent.value = ""; 

            selectCommentList(); 

        } else { 
            alert("댓글 등록에 실패했습니다.");
        }
    })
    .catch(err => console.log(err));
});

// -----------------------------------------------------------------------------------
// 댓글 삭제
function deleteComment(commentNo){

    if( confirm("정말로 삭제 하시겠습니까?") ){

        fetch("/comment", {
            method : "DELETE",
            headers : {"Content-Type" : "application/json"},
            body : commentNo 
        })
        
        .then( resp => resp.text())
        .then(result => {
            if(result > 0){
                alert("삭제되었습니다");
                selectCommentList(); // 목록을 다시 조회해서 삭제된 글을 제거
            }else{
                alert("삭제 실패");
            }
        })
        .catch(err => console.log(err));

    }
}

// ------------------------------------------------------------------------------------------
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
    commentBtnArea.classList.add("reply-btn-area");
    

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

// -----------------------------------------------------------------------------------
// 댓글 수정 취소
function updateCancel(btn){
    // 매개변수 btn : 클릭된 취소 버튼
    // 전역변수 beforeCommentRow : 수정 전 원래 행(댓글)을 저장한 변수

    if(confirm("댓글 수정을 취소하시겠습니까?")){
        btn.parentElement.parentElement.innerHTML = beforeCommentRow;
    }
}

// -----------------------------------------------------------------------------------
// 댓글 수정(AJAX)
function updateComment(commentNo, btn){

    // 새로 작성된 댓글 내용 얻어오기
    const commentContent = btn.parentElement.previousElementSibling.value;

    const data = {"commentContent" : commentContent,
                  "commentNo" : commentNo}

    fetch("/comment", {
        method : "PUT",
        headers : {"Content-Type" : "application/json"},
        body : JSON.stringify(data)

    })

    .then(resp => resp.text())

    .then(result => {
        if(result > 0){
            alert("댓글이 수정되었습니다.");
            selectCommentList();
        }else{
            alert("댓글 수정 실패");
        }
    })

    .catch(err => console.log(err));

}

// -------------------------------------------------------------------------------

// 답글 작성 화면 추가 
// -> 답글 작성 화면은 전체 화면에 1개만 존재 해야한다!

function showInsertComment(parentNo, btn){
    // 부모 댓글 번호, 클릭한 답글 버튼


// ** 답글 작성 textarea가 한 개만 열릴 수 있도록 만들기 ** 
const temp = document.getElementsByClassName("commentInsertContent");

if(temp.length > 0){ // 답글 작성 textara가 이미 화면에 존재하는 경우

if(confirm("다른 답글을 작성 중입니다. 현재 댓글에 답글을 작성 하시겠습니까?")){
temp[0].nextElementSibling.remove(); // 버튼 영역부터 삭제
temp[0].remove(); // textara 삭제 (기준점은 마지막에 삭제해야 된다!)

} else{
return; // 함수를 종료시켜 답글이 생성되지 않게함.
}
}

// 답글을 작성할 textarea 요소 생성
const textarea = document.createElement("textarea");
textarea.classList.add("commentInsertContent");

// 답글 버튼의 부모의 뒤쪽에 textarea 추가
// after(요소) : 뒤쪽에 추가
btn.parentElement.after(textarea);


// 답글 버튼 영역 + 등록/취소 버튼 생성 및 추가
const commentBtnArea = document.createElement("div");
commentBtnArea.classList.add("reply-btn-area");


const insertBtn = document.createElement("button");
insertBtn.innerText = "등록";
insertBtn.setAttribute("onclick", "insertChildComment("+parentNo+", this)");


const cancelBtn = document.createElement("button");
cancelBtn.innerText = "취소";
cancelBtn.setAttribute("onclick", "insertCancel(this)");

// 답글 버튼 영역의 자식으로 등록/취소 버튼 추가
commentBtnArea.append(insertBtn, cancelBtn);

// 답글 버튼 영역을 화면에 추가된 textarea 뒤쪽에 추가
textarea.after(commentBtnArea);

}


// 답글 취소
function insertCancel(btn){
// 취소
btn.parentElement.previousElementSibling.remove(); // 취소의 부모의 이전 요소(textarea) 제거
btn.parentElement.remove(); // 취소의 부모 요소(comment-btn-area) 제거
}

// 답글 등록
function insertChildComment(parentNo, btn){
    // 부모 댓글 번호, 답글 등록 버튼

// 누가?                loginMemberNo(로그인한 회원의 memberNo )(전역변수)
// 어떤 내용?           textarea에 작성된 내용
// 몇번 게시글?         현재 게시글 boardNo (전역변수)
// 부모 댓글은 누구?    parentNo (매개변수)

// 답글 내용
const commentContent = btn.parentElement.previousElementSibling.value;

// 답글 내용이 작성되지 않은 경우
if(commentContent.trim().length == 0){
alert("답글 작성 후 등록 버튼을 클릭해주세요.");
btn.parentElement.previousElementSibling.value = "";
btn.parentElement.previousElementSibling.focus();
return;
}

const data = {"commentContent" : commentContent, // 벨류 담겨잇음 위에
"memberId" : loginMemberId,
"boardNo" : boardNo,
"parentNo" : parentNo
}

fetch("/comment", {
method : "POST",
headers : {"Content-Type" : "application/json"},
body : JSON.stringify(data)

})

.then(resp => resp.text())


.then(result => {
if(result > 0){ // 등록 성공
alert("답글이 등록되었습니다.");
selectCommentList(); // 비동기 댓글 목록 조회 함수 호출

} else { // 실패
alert("답글 등록에 실패했습니다...");
}
})
.catch(err => console.log(err));


}


// 팔로우 모달창
const user = document.getElementById("detailWriterImage");  // 유저 프로필
const followBtn = document.getElementById("followBtn");  // 팔로우 버튼
const followArea = document.getElementById("follow-area");  // 팔로우 모달창
const close = document.getElementById("close"); // x버튼
const followBtn2 = document.getElementById("followBtn2");  // 모달안에 팔로우 버튼
const messageBtn = document.getElementById("messageBtn");  // 모달 안에 메시지 버튼 

user.addEventListener("click", () => {

    followArea.classList.toggle("follow-area");
})

followBtn.addEventListener("click", () => {

    followArea.classList.toggle("follow-area");
})

close.addEventListener("click", () => {

    followArea.classList.toggle("follow-area");
    location.reload();
})

var iconElement = document.querySelector('#followBtn2 i'); 

const followSpan = document.getElementById("followSpan");
const followingSpan = document.getElementById("followingSpan");
console.log(followSpan +"1");
/* 팔로우 */
followBtn2.addEventListener("click", e=>{

    // 로그인 여부
    if(loginMemberId == ""){
         alert("로그인 후 이용해주세요");
         return;
    }

    let check;

    if( iconElement.classList.contains('fa-user-plus') ){ // 북마크 안눌렀을 때
        check=0;
    } else {  // 북마크 눌렀을 때
        check=1;
    }



    const data = {
        "memberId": loginMemberId,
        "userId" : memberId,
        "followCheck" : check
    };

    fetch("/board/follow",{
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

        iconElement.classList.toggle("fa-user-plus");
        iconElement.classList.toggle("fa-check");
        if(followSpan != null){
            
            followSpan.innerText = '팔로잉';
            console.log(followSpan +"2");
        }
        if(followingSpan != null){
            
            followSpan.innerText = '팔로우';
        }

    })
    .catch( err => {
        console.log("예외발생")
    })
})










