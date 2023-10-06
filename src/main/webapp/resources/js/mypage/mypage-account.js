/* ==========비번========== */
const accountFrm = document.getElementById("accountFrm");
const currentPw = document.getElementById("currentPw");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");
const pwBtn = document.getElementById("pwBtn");



/* 비밀번호 유효성 */
const changePwFrm = document.getElementById("changePwFrm"); // 비번 폼태그

changePwFrm.addEventListener("submit", e => {
    
    // 현재 비번 미작성시
    if(currentPw.value.trim() == ""){
        alert("현재 비밀번호를 입력하세요.");
        e.preventDefault();
        currentPw.focus();
        currentPw.value = "";
        return;
    }

    // 새 비번 미작성시
    if(newPw.value.trim() == ""){
        alert("새 비밀번호를 입력하세요.");
        e.preventDefault();
        newPw.focus();
        newPw.value = "";
        return;
    }

    // 새 비번 미작성시
    if(newPwConfirm.value.trim() == ""){
        alert("비밀번호 확인을 입력하세요.");
        e.preventDefault();
        newPwConfirm.focus();
        newPwConfirm.value = "";
        return;
    }

    // 비번 유효성 검사
    const reg = /^[\w!@#_-]{6,20}$/;
    if(!reg.test(newPw.value)){
        alert("영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요.");
        e.preventDefault();
        newPw.focus();
        return;
    }

    // 새비번, 새비번확인 일치하는지 확인
    if(newPw.value != newPwConfirm.value){
        alert("비밀번호가 일치하지 않습니다.");
        e.preventDefault();
        newPwConfirm.focus();
        return;
    }
})








/* ======================== 이메일 인증 ========================== */
const memberEmail = document.getElementById("memberEmail"); // 이메일칸
const authKey = document.getElementById("authKey"); // 인증 번호칸

const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");   // 인증번호 받기 버튼
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn"); // 인증하기 버튼

const authKeyMessage = document.getElementById("authKeyMessage");     // 타이머 태그
const emailAuthMessage = document.getElementById("emailAuthMessage"); // 인증번호 메세지

// 인증번호 입력칸 유효성 검사
authKey.addEventListener("input", ()=>{
    if(authKey.value.trim().length==0){
        authKey.value = "";

        emailAuthMessage.innerText = "";
        emailAuthMessage.classList.remove("confirm", "error");

        return;
    }
})

// 인증번호 받기 버튼 클릭시
sendAuthKeyBtn.addEventListener("click", ()=>{

    authMin = 4;
    authSec = 59;

    fetch("/myPageEmailAuth", {
        method : "POST",
        headers : {"content-Type":"application/text"},
        body: memberEmail.value
    })

    .then(resp=>resp.text())
    .then(result=>{
        if(result != null){
            alert("인증 번호가 발송되었습니다.")
            console.log(result);
        }else{
            alert("인증 번호 발송 실패")
        }
    })
    .catch(err=>{
        console.log("에러 발생");
        console.log(err)
    });

    authKeyMessage.innerText = "05:00";
    authKeyMessage.classList.remove("confirm");

    authTimer = window.setInterval(()=>{

        authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);

        // 남은 시간이 0분 0초 일 때
        if(authMin == 0 && authSec == 0 ){
            clearInterval(authTimer);
            return;
        }

        if(authSec == 0){
            authSec = 60;
            authMin--;
        }

        authSec--;
    }, 1000)

});


// 인증하기 버튼 클릭 시
checkAuthKeyBtn.addEventListener("click", ()=> {

    if(authMin > 0 || authSec > 0){

        const data = {
            "memberEmail" : memberEmail.value,
            "authKey" : authKey.value
        }

        fetch("/myPageEmailAuthCheck", {
            method : "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(data)
        })

        .then(resp => resp.text())

        .then(result => {

            if(result > 0){
                clearInterval(authTimer);
                emailAuthMessage.innerText ="인증되었습니다.";
                emailAuthMessage.classList.add("confirm");
                emailAuthMessage.classList.remove("error");
                alert("인증 확인 및 이메일이 변경되었습니다.");

            }else{
                emailAuthMessage.innerText ="인증번호가 일치하지 않습니다";
                emailAuthMessage.classList.add("error");
                emailAuthMessage.classList.remove("confirm");
                alert("인증번호가 일치하지 않습니다. 다시 입력해주세요.");
            }
        })

        .catch( err => {
            console.log("에러");
            console.log(err);
        });

    }else{
        alert("인증 시간이 만료 되었습니다. 다시 시도해주세요.")
    }
})










// 회원 탈퇴
const agree = document.getElementById("agree");
const secessionBtn = document.getElementById("secessionBtn");

secessionBtn.addEventListener("click", e => {

    // 박스 안눌렀을때
    if(!agree.checked){
        alert("약관 동의 후 탈퇴 버튼을 눌러주세요.");
        e.preventDefault();
        agree.focus();
        return;
    }

    // 취소 클릭 시
    if(!confirm("정말로 탈퇴 하시겠습니까....?")){
        alert("탈퇴를 취소했습니다.");
        e.preventDefault();
        return;
    } 
});