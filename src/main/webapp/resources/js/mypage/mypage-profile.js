/* 팝업 영역 */
/* follower 요소들 */
const follower = document.getElementById("follower"); // 팔로워 버튼
const popup1 = document.getElementById("popup1"); // 팝업창
const closeBtn1 = document.getElementById("closeBtn1"); // 닫기 버튼

/* following 요소 */
const following = document.getElementById("following"); // 보기버튼
const popup2 = document.getElementById("popup2"); // 팝업창
const closeBtn2 = document.getElementById("closeBtn2"); // 닫기 버튼

closeBtn1.addEventListener("click", e =>{
    popup1.classList.toggle("popup");
});

follower.addEventListener("click", e => {
    popup1.classList.toggle("popup");
});


closeBtn2.addEventListener("click", e =>{
    popup2.classList.toggle("popup");
});
following.addEventListener("click", e => {
    popup2.classList.toggle("popup");
});



/* =========체크 리스트 ========= */
const checkObj = {
    "memberNickname" : false
};





/* ============================ 프로필 이미지 ============================== */
const profileImage = document.getElementById("profileImage"); // img 태그
const deleteBtn = document.getElementById("deleteBtn"); // 제거 버튼
const imageInput = document.getElementById("imageInput"); // 인풋 태그

const saveBtn = document.getElementById("saveBtn"); // 저장버튼

let initCheck;
let deleteCheck = -1;
let originalImage;

if(imageInput != null){
    originalImage = profileImage.getAttribute("src");

    if(originalImage =="/resources/images/user.png"){
        initCheck = false;
    }else{
        initCheck = true;
    }

    imageInput.addEventListener("change", e => {

        const maxSize = 1 * 1024 * 1024 * 2;

        const file = e.target.files[0];

        // 파일한번 선택했다가 취소했을떄
        if(file == undefined){
            console.log("파일 선택 취소");
            deleteCheck = -1;
            profileImage.setAttribute("src", originalImage);
            return;
        }

        // 파일 크기 초과한 경우
        if(file.size > maxSize){
            alert("2MB 이하의 이미지만 가능합니다.");
            imageInput.value = "";
            deleteCheck = -1;
            profileImage.setAttribute("src", originalImage);
            return;
        }

        const reader = new FileReader();

        reader.readAsDataURL(file);

        reader.onload = e => {

            const url = e.target.result;
            profileImage.setAttribute("src", url);

            deleteCheck = -1;
        }
    });

    // 제거 버튼 눌렀을때
    deleteBtn.addEventListener("click", () => {
        profileImage.setAttribute("src", "/resources/images/user.png");
        imageInput.value = ""; 
        deleteCheck = 0;
    });



}



/* ================================ 닉네임 ================================ */
const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById("nickMessage");


// 닉네임이 입력이 되었을 때
memberNickname.addEventListener("input", () => {


    // 닉네임 입력이 되지 않은 경우
    if(memberNickname.value.trim().length == 0){

        memberNickname.value = "";
        
        nickMessage.innerText = "한글,영어,숫자 2~8글자 입력 해주세요";
        nickMessage.classList.remove("confirm", "error");

        checkObj.memberNickname = false;
        return;
    
    }

    // 정규표현식으로 유효성 검사
    const regExp = /^[가-힣\w\d]{2,10}$/;

    if(regExp.test(memberNickname.value)){ // 유효
       
        nickMessage.innerText = "사용 가능한 닉네임 입니다";
        nickMessage.classList.add("confirm");
        nickMessage.classList.remove("error");

        checkObj.memberNickname = true; // 유효 O

    }else{ 
        nickMessage.innerText = "닉네임 형식이 유효하지 않습니다";
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");

        checkObj.memberNickname = false;
    }
});






    







 
