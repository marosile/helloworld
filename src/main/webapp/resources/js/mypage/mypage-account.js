












/* ==========비번========== */
const accountFrm = document.getElementById("accountFrm");
const currentPw = document.getElementById("currentPw");
const newPw = document.getElementById("newPw");
const newPwConfirm = document.getElementById("newPwConfirm");

/* 비밀번호 유효성 */
if(accountFrm != null){
    accountFrm.addEventListener("submit", e => {
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
            alert("비밀번호가 유효하지 않습니다.");
            e.preventDefault();
            newPw.focus();
            return;
        }

        // 새비번, 새비번 일치하는지 확인
        if(newPw.value != newPwConfirm.value){
            alert("비밀번호가 일치하지 않습니다.");
            e.preventDefault();
            newPwConfirm.focus();
            return;
        }
    })
};





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










