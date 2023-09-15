const memberId = document.getElementById("login-inputEmail");
const memberPw = document.getElementById("login-inputPw");

const loginFrm = document.getElementById("loginFrm");

loginFrm.addEventListener("submit", e => {

        if(memberId.value.trim().length == 0){
            alert("아이디를 입력 해주세요");
            memberId.value="";
            memberId.focus();
            e.preventDefault();
            return;
        }

    if(memberPw.value.trim().length == 0){
        alert("비밀번호를 입력 해주세요");
        memberPw.value="";
        memberPw.focus();
        e.preventDefault();
        return;
    }



});

