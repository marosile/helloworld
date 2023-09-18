/* ==========비번========== */
const accountFrm = document.getElementById("accountFrm");
const currentPw = document.getElementById("currentPw");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");
const pwBtn = document.getElementById("pwBtn");

/* 비밀번호 유효성 */
pwBtn.addEventListener("click", () => {
    // 비번 미작성시
    if(currentPw.value.trim() == ""){
        alert("현재 비밀번호를 입력하세요");
        e.preventDefault();
        currentPw.focus();
        currentPw.value = "";
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
const sendAuthKeyBtn = document.getElementById("sendAuthKeyBtn");
const authKeyMessage = document.getElementById("authKeyMessage");

let authTimer;
let authMin = 4;
let authSec = 59;

// 인증번호를 발송한 이메일 저장
let tempEmail;

sendAuthKeyBtn.addEventListener("click", function(){
    authMin = 4;
    authSec = 59;
    
    checkObj.authKey = false;
    
    if(checkObj.memberEmail){ // 중복이 아닌 이메일인 경우

        
        /* fetch() API 방식 ajax */
        fetch("/sendEmail/signUp?email="+memberEmail.value)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                console.log("인증 번호가 발송되었습니다.")
                tempEmail = memberEmail.value;
            }else{
                console.log("인증번호 발송 실패")
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        });
        
        
        
        alert("인증번호가 발송 되었습니다.");
        
        
        
        authKeyMessage.innerText = "05:00";
        authKeyMessage.classList.remove("confirm");
        
        
        authTimer = window.setInterval(()=>{
            
            
            authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);
            
            // 남은 시간이 0분 0초인 경우
            if(authMin == 0 && authSec == 0){
                checkObj.authKey = false;
                clearInterval(authTimer);
                return;
            }
            
            // 0초인 경우
            if(authSec == 0){
                authSec = 60;
                authMin--;
            }
            
            authSec--; // 1초 감소
            
            
        }, 1000)
        
        
    } else{
        alert("중복되지 않은 이메일을 작성해주세요.");
        memberEmail.focus();
    }
});

// 인증 확인
const authKey = document.getElementById("authKey");
const checkAuthKeyBtn = document.getElementById("checkAuthKeyBtn");

checkAuthKeyBtn.addEventListener("click", function(){
    
    
    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행
        /* fetch API */
        const obj = {"inputKey":authKey.value, "email":tempEmail}
        const query = new URLSearchParams(obj).toString()
        // inputKey=123456&email=user01
        
        fetch("/sendEmail/checkAuthKey?" + query)
        .then(resp => resp.text())
        .then(result => {
            if(result > 0){
                clearInterval(authTimer);
                authKeyMessage.innerText = "인증되었습니다.";
                authKeyMessage.classList.add("confirm");
                checkObj.authKey = true;
                
                
            } else{
                alert("인증번호가 일치하지 않습니다.")
                checkObj.authKey = false;
            }
        })
        .catch(err => console.log(err));
        
        
        
        
    } else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }
    
    
});










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