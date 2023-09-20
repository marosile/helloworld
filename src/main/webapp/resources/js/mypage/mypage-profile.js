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
const profileImage = document.getElementById("profileImage"); // 이미지 보여주는 곳
const deleteBtn = document.getElementById("deleteBtn"); // [제거] 버튼
const imageInput = document.getElementById("imageInput"); // [변경] 버튼 (인풋 태그)

const saveBtn = document.getElementById("saveBtn"); // 저장버튼

let initCheck; // 초기 프로필 이미지 상태 저장 변수
                // false면 기본 이미지, true면 이전 업로드 이미지

let deleteCheck = -1; // 프로필 이미지가 새로 업로드 되거나 삭제 되었음을 나타내는 변수
                // -1은 초기값,   0 = 프로필 삭제 (제거버튼), 1 = 새 이미지 업로드 

let originalImage; // 초기 프로필 이미지 파일 경로를 저장

if(imageInput != null){  // 만약에 화면에 imageInput이 있을 경우 -> 이미 input태그에 값이 있을 경우?

    originalImage = profileImage.getAttribute("src");
    // 프로필 이미지가 출력되는 이미지태그의 src 속성을 저장 ->


    if(originalImage =="/resources/images/user.png"){
        // 만약 기본 이미지라면
        initCheck = false;
        // 초기 프로필 이미지 상태가 false이다

    }else{ // 아니라면
        initCheck = true; // 이전 업로드 이미지 이다
    }


    // 변경버튼을 눌러서 input태그값이 바뀐다면
    imageInput.addEventListener("change", e => {
        

        const maxSize = 1 * 1024 * 1024 * 2;
        // 크기 제한 해주고

        const file = e.target.files[0];
        // 업로드한 파일의 정보가 담긴 객체 -> change가 일어난 파일의 정보


        if(file == undefined){
            console.log("파일 선택 취소");
            deleteCheck = -1;       // 초기값이다
            profileImage.setAttribute("src", originalImage);
            return;
        }   // 파일이 삭제 되었다 -> 프로필 이미지에 초기 프로필 이미지로 변경하겠다



        // 파일 크기 초과한 경우
        if(file.size > maxSize){
            alert("2MB 이하의 이미지만 가능합니다.");
            imageInput.value = "";
            deleteCheck = -1;
            profileImage.setAttribute("src", originalImage);
            return;
        }



        const reader = new FileReader();
        // js에서 파일 읽는 객체 -> 파일을 읽고 컴퓨터에 파일 저장 가능


        reader.readAsDataURL(file);
        // 매개변수에서 작성된 파일을 읽어서 저장 후 파일을 나타내는 URL을 result 속성으로 얻음가능


        // 다 읽어지면
        reader.onload = e => {

            const url = e.target.result;
            // 파일을 읽어서 저장 후 파일을 나타내는 URL을 result속성으로 얻어온걸 url에 담음
            // -> url -> 읽어온 파일의 URL을 담고있음

            profileImage.setAttribute("src", url);
            // 프로필이미지에 읽어온 파일의 url 추가

            deleteCheck = 1;
            // 1이다 -> 프로필 이미지가 새로 업로드 됐다
        }
    });



    // 제거 버튼 눌렀을때
    deleteBtn.addEventListener("click", ()=> {
        
        profileImage.setAttribute("src", "/resources/images/user.png");
        // 프로필 이미지를 기본이미지로 추가

        imageInput.value = ""; 
        // file의 value 삭제

        deleteCheck = 0;
        // 딜리트 체크가 0이다 -> 프로필 삭제 한다 [제거 버튼]
    });

    document.getElementById("profileFrm").addEventListener("submit", e=>{

        let flag = true;

        // 프로필 이미지가 없다 -> 있다 
        if(!initCheck && deleteCheck == 1) flag = false;

        // 이전 프로필 이미지가 있다 -> 삭제 
        if(initCheck && deleteCheck == 0 ) flag = false;
     
        // 이전 프로필 이미지가 있다 -> 새 이미지 
        if(initCheck && deleteCheck == 1) flag = false;

        profileImage.getAttribute("src");

        profileImage.setAttribute("src", profileImage.getAttribute("src") );

        /* if(flag){ // flag == true -> 제출하면 안되는 경우 
            e.preventDefault(); // form 기본 이벤트 제거 
            alert("이건 없는 경우야.");
        } */

        if(memberNickname.style.color == "red"){
            alert("닉네임이 유효하지 않습니다~_~.");
            memberNickname.focus();
            e.preventDefault();
            return;
        }

    })


}



/* ================================ 닉네임 ================================ */
const memberNickname = document.getElementById("memberNickname");
const nickMessage = document.getElementById("nickMessage");


// 닉네임이 입력이 되었을 때

initNickname = memberNickname.value;

memberNickname.addEventListener("input", ()=> {

    // 변경전이랑 같을 경우
    if(initNickname == memberNickname.value){
        memberNickname.removeAttribute("style");
        return;
    }

    // 정규표현식 유효성 검사
    const regExp = /^[가-힣\w\d]{2,10}$/;

    if(regExp.test(memberNickname.value)){// 유효
        memberNickname.style.color = "green"; // 초록 글씨
    }else{ //무효
        memberNickname.style.color = "red";// 빨간 글씨
    }
});





/* document.getElementById("profileFrm").addEventListener("submit", e=> {

    if(memberNickname.style.color == "red"){
        alert("닉네임이 유효하지 않습니다~_~.");
        memberNickname.focus();
        e.preventDefault();
        return;
    }
}); */







 
