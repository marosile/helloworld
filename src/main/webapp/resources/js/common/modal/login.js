const memberId = document.getElementById("login-inputEmail");
const memberPw = document.getElementById("login-inputPw");

const loginFrm = document.getElementById("loginFrm");

const idSave = document.getElementById("idSave");
const autoLogin = document.getElementById("autoLogin");

// 모달창
const modalArea = document.getElementsByClassName("modalArea")[0];

// 헤더에 있는 로그인창
const headerLogin = document.getElementById("header-login");

/* 로그인 모달을 위한 js*/
// 로그인 버튼
const loginBtn = document.getElementById("loginBtn");

// 로그인 했을 때 버튼만 교체해주기 위한 부르기
const loginChange = document.getElementsByClassName("loginChange")[0];
//const headerSignup = document.getElementById("header-signup");
//const headerMypage = document.getElementById("header-mypage");

//loginFrm.addEventListener("submit", e => {

if(loginBtn != null){
    loginBtn.addEventListener("click", (e)=>{
        if(memberId.value.trim().length == 0){
            snackbar('아이디를 입력 해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png')
            memberId.value="";
            memberId.focus();
            e.preventDefault();
            return;
        }

        if(memberPw.value.trim().length == 0){
            snackbar('비밀번호를 입력 해주세요.', 'rgb(0, 128, 255)', '/resources/images/moon.png')
            memberPw.value="";
            memberPw.focus();
            e.preventDefault();
            return;
        }

        const data = {
            "memberId" : memberId.value,
            "memberPw" : memberPw.value,
            "idSave" : idSave.checked,
            "autoLogin" : autoLogin.checked
        };

        fetch("/member/login", {
            method:'post',
            headers: {'Content-Type': 'application/json'},
            body : JSON.stringify(data)


        })
            .then(resp => resp.text())
            .then(result => {

                if(result == 1) {
                    snackbar('환영합니다!', 'rgb(0, 128, 255)', '/resources/images/moon.png')
                    modalArea.style.display = "none";
                    preventScroll(false);
                    loginChange.innerHTML = "<div id='header-mypage' class='button' onClick='location.href=`/mypage/profile`'>마이페이지</div>"

                    headerLogin.innerText = "로그아웃"
                    
                }else{
                    snackbar('아이디 혹은 비밀번호가 일치하지 않습니다.', 'rgb(0, 128, 255)', '/resources/images/moon.png')

                    modalArea.style.display = "block";
                }

            })
            .catch(e => console.log(e))



    });
}



// const autoLogin1 = document.getElementById("autoLogin1");
//
// autoLogin.addEventListener("change", () => {
//
//     if(autoLogin.checked == true){
//         autoLogin1.checked = true;
//     }
//
//     if(autoLogin.checked == false){
//         autoLogin1.checked = false;
//     }
// })




// 얘네는 필요없을듯
// 카카오 로그인 a태그
//const kakaoLogin = document.getElementById("kakaoLogin");
// 구글 로그인 a태그
//const googleLogin = document.getElementById("googleLogin");


if(headerLogin != null){
    headerLogin.addEventListener("click", () => {
        modalArea.style.display = "block";
        preventScroll(true);
    })
}



/* x누를 시 modal창 display none으로 만들기*/
const idModalClose = document.getElementById("idModalClose");

if(idModalClose != null){
    idModalClose.addEventListener("click", () => {
        if(modalArea != null){
            modalArea.style.display = 'none';
            preventScroll(false)
            location.reload(true);
        }

    });

}
