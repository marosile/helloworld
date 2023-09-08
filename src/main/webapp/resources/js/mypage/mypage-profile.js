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




/* ============================ 프로필 이미지 ============================== */
const profileImage = document.getElementById("profileImage"); // img 태그
const deleteBtn = document.getElementById("deleteBtn"); // 제거 버튼
const imageInput = document.getElementById("imageInput"); // 인풋 태그

let initCheck;
let deleteCheck = -1;
let originalImage;

if(imageInput != null){
    originalImage = profileImage.getAttribute("src");

    if(originalImage == "/resources/images/uer.png"){
        initCheck = false;
    }else{
        initCheck = true;
    }

    imageInput.addEventListener("change", e => {

        const maxSize = 1 * 1024 * 1024 * 2

        const file = e.target.file[0];

        // 파일한번 선택했다가 취소했을떄
        if(file == undefined){
            deleteCheck = -1;
            profileImage.setAttribute("src", originalImage);
            return;
        }

        // 파일 크기 초과한 경우
        if(file.size > maxSize){
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



    







 
