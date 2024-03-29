const boardNo = document.getElementById("boardNo").value;
const contactBtn=document.getElementById("contact-button");

if(contactBtn!=null){
    contactBtn.addEventListener("click",()=>{
        if(confirm("친구와 같이 스터디 하기 원하면 확인 버튼을 눌러주세요!\n친구에게 문자로 알림이 갑니다!📧")){

            fetch("/study/detail/"+boardNo+"/message",{
                method:"POST",
                headers:{"Content-Type":"application/json"}
            })
                .then(res=>res.text())
                .then(result =>{
                    console.log(result)

                    if(result>0){

                        location.reload(true);
                    }
                })
                .catch(e=>console.log("에러발생"))
            alert("친구에서 문자가 갔습니다. 자세한 내용은 체팅을 이용해주세요!")
        }
    })
}

// 수정 버튼 시
const updateBtn = document.getElementById("updateBtn");

if(updateBtn!=null){

    updateBtn.addEventListener("click", () => {

        if (confirm("게시글을 수정하시겠습니까?")) {

            location.href = "/study/detail/update/"+boardNo;
        }


    })
}

// 삭제
const deleteBtn = document.getElementById("deleteBtn");

if(deleteBtn!=null){
    deleteBtn.addEventListener("click", () => {

        if (confirm("게시글을 삭제하시겠습니까?")) {

            alert("게시글이 삭제되었습니다.")
            location.href = location.pathname.replace("boardNo")+"/delete"
        }

    })
}


// 모집완료버튼 클릭 시
const completeBtn = document.getElementById("completeBtn");

if(completeBtn!=null){
    completeBtn.addEventListener("click", () => {

        if (confirm("모집완료되신건가요 ?")) {
            alert("🎉 축하합니다! 모집완료되었습니다.")
        }

        const data = {
            "boardNo" :boardNo
        }

        fetch("/study/detail/completed",{
            method:"POST",
            headers:{"Content-Type":"application/json"},
            body:JSON.stringify(data)
        })
            .then(resp=> resp.text())
            .then(result =>{
                console.log(result)

                if(result>0){

                    location.reload(true);
                }
            })
            .catch(e=>{console.log(e)})
    })
}

// 목록으로
const goToBackBtn = document.getElementById("goToBackBtn");

if (goToBackBtn!=null){

    goToBackBtn.addEventListener("click",function (){
        location.href = `/study/main`;
    })

}

    // 좋아요 클릭 시
    const like = document.getElementById("like");
    const countSpan = document.getElementById("count");
    const loginMemberId = document.getElementById("loginMemberId").value;


    like.addEventListener("click", e=>{

        // 로그인 여부
        if(loginMemberId == ""){
            alert("로그인 후 이용해주세요");
            return;
       }

        let check;

        if( e.target.classList.contains("fa-regular")){
            check=0; // 좋아요 안 눌른 상태
        } else {
            check=1;
        }

        const data = {
            "memberId": loginMemberId,
            "boardNo" : boardNo,
            "likeCheck" : check
        };

        fetch("/study/detail/like",{
            method: "POST",
            headers:{"Content-Type" : "application/json" },
            body : JSON.stringify(data)
        })
            .then( res => res.text())
            .then( count => {


                if(count == -1) { // DML 실패
                    alert("좋아요 실패 ㅜㅜ");
                    return;
                }

                e.target.classList.toggle("fa-regular");
                e.target.classList.toggle("fa-solid");

                countSpan.innerText = count;



            })
            .catch( err => {
                console.log("예외발생")
            })
    })


// 팔로우 클릭 시
var followElement =  document.querySelector('#share-button i');

const followSpan = document.getElementById("followSpan");
const followingSpan = document.getElementById("followingSpan");
const userId = document.getElementById("userId").value;

followElement.addEventListener("click",e=>{

    if(loginMemberId==""){
        alert("로그인 후 이용해주세요")
        return;
    }

    let check;

    if(followElement.classList.contains("fa-user-plus")){ // 팔로우를 안눌렀을떄
        check=0;
    }else{ // 팔로우를 클릭 했을때 -> 팔로잉
        check=1;
    }

    const data={
        "memberId" :loginMemberId,
        "userId" : userId,
        "followCheck" : check
    }
    fetch("/study/detail/follow",{
        method: "POST",
        headers:{"Content-Type" : "application/json" },
        body : JSON.stringify(data)
    })
        .then(resp => resp.text())
        .then(result=>{

            if(result == -1){
                alert("팔로우 실패")
                return;
            }

            followElement.classList.toggle("fa-user-plus");
            followElement.classList.toggle("fa-check");

            if(followSpan != null){

                followSpan.innerText = '팔로우';
                location.reload(true);
            }
            if(followingSpan != null){

                followingSpan.innerText = '팔로잉';
                location.reload(true);
            }



        })
        .catch(e=>console.log(e))

})

