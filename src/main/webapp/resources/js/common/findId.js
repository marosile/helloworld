/* 전화번호 인증을 위한 js */
const inputTel1 = document.getElementById("inputTel1");
const inputTel2 = document.getElementById("inputTel2");

const btn1 = document.getElementById("btn1");
const btn2 = document.getElementById("btn2");

const telAuthMessage = document.getElementById("telAuthMessage");

/* 아이디 전화번호 / 이메일 인증 유효성 검사 */
const checkPhoneAuth = {
    "inputTel2" : false,
    "inputEmail2" : false
};


/* 전화번호 인증 타이머 */
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;

/* 전화번호 인증 */
btn1.addEventListener("click", () => {

    const data = {
        "inputTel1": inputTel1.value
    }

    authMin = 4;
    authSec = 59;
    
    if(inputTel1.value.trim().length == 0){
        alert("전화번호를 입력 해주세요");
        return;
    }

    fetch("/phoneAuth", {
        method: "POST",
        headers: { "content-Type": "application/json" },
        body: JSON.stringify(data)
    })

        .then(resp => resp.text())
        .then(result => {
            if (result != null) {
                alert("인증번호가 발송되었습니다.");
                return;
            } else {
                alert("인증번호 발송 실패")
                return;
            }

        })
        .catch(err => console.log(err));


    authKeyMessage.innerText = "05:00";
    authKeyMessage.classList.remove("confirm");


    authTimer = window.setInterval(()=>{


        authKeyMessage.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);

        // 남은 시간이 0분 0초인 경우
        if(authMin == 0 && authSec == 0){
            checkSignUp.authKey = false;
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



});



// 전화번호 인증하기 유효성 검사 진행
inputTel2.addEventListener("input", () => {
    if(inputTel2.value.trim().length == 0){
        inputTel2.value = "";

        telAuthMessage.innerText = "";
        telAuthMessage.classList.remove("confirm", "error");

        checkPhoneAuth.inputTel2 = false;
        return;
    }
})


/* 전화번호 인증 확인 */
btn2.addEventListener("click", () => {

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행

        const data = {
            "inputTel2": inputTel2.value
        }

        fetch("/phoneAuthCheck", {
            method: "POST",
            headers: { "content-Type": "application/json" },
            body: JSON.stringify(data)
        })

            .then(resp => resp.text())

            .then(result => {
                if (result > 0) {

                    /* 원래는 체크 메시지를 회원가입에서만 쓰려고 했으나
                    다른곳에도 사용하게 되어 if(telAuthMessage != null) 조건문
                    지워버림
                    */

                    telAuthMessage.innerText ="인증번호 확인";
                    telAuthMessage.classList.add("confirm");
                    telAuthMessage.classList.remove("error");

                    checkPhoneAuth.inputTel2 = true;

                } else { //인증번호가 일치하지 않을 때


                    telAuthMessage.innerText ="인증번호가 일치하지 않습니다";
                    telAuthMessage.classList.add("error");
                    telAuthMessage.classList.remove("confirm");

                    checkPhoneAuth.inputTel2 = false;


                }

            })

            .catch(err => console.log(err))
    }else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }

});






/* 휴대전화 <-> 이메일 인증 변경하는 js */

const TelCertification = document.getElementsByClassName("TelCertification")[0]
const EmailCertification = document.getElementsByClassName("EmailCertification")[0]

document.getElementById("findTel").addEventListener("change", e =>{
    e.target.checked;

    TelCertification.style.display = "block";
    EmailCertification.style.display = "none";
});

document.getElementById("findEmail").addEventListener("change", e=>{
    e.target.checked;

    EmailCertification.style.display = "block";
    TelCertification.style.display = "none";

});


/***********************************************/


const findTelId = document.getElementById("findTelId")
const idModal = document.getElementsByClassName("idModal")[0];

/*************************휴대폰 인증시 버튼***********************/
document.getElementById("findIdBtn1").addEventListener("click", () => {

    // checkSignUp 모든 value가 true인지 검사

    for( let key in checkPhoneAuth ){

        checkPhoneAuth.inputEmail2=true;


        if(!checkPhoneAuth[key]){ // 각 key에 대한 value(true/false)를 얻어와
            // false인 경우 == 유효하지 않다!

            switch(key){
                case "inputTel2" : alert("전화번호 인증을 해주세요"); break;
            }

            // 유효하지 않은 input 태그로 focus 이동
            // - key를 input의 id와 똑같이 설정했음
            document.getElementById(key).focus();

            checkPhoneAuth.inputEmail2=false;

            // form 태그 기본 이벤트 제거
            e.preventDefault();
            return; // 함수 종료

        }

    }


    fetch("/member/findId/tel", {
        method : 'POST',
        headers : {'Content-Type' : 'application/text'},
        body : inputTel1.value
    })
        .then( resp => resp.text())
        .then(findIdTel =>{
            if(findIdTel != '') {
                idModal.style.display = 'block';
                findTelId.innerText = findIdTel;

                inputTel1.value = '';
                inputTel2.value = '';
                authKeyMessage.innerText = '';

            }else{
                idModal.style.display = 'block';
                findTelId.innerText = '일치하는 ID가 없습니다';

                inputTel1.value = '';
                inputTel2.value = '';
                authKeyMessage.innerText = '';
            }

        })
        .catch(e => console.log(e))


})



/********************* 이메일 인증을 위한 js*************************/
const inputEmail1 = document.getElementById("inputEmail1");
const inputEmail2 = document.getElementById("inputEmail2");

const btn3 = document.getElementById("btn3");
const btn4 = document.getElementById("btn4");

/* 전화번호 인증 타이머 */
const authKeyMessage2 = document.getElementById("authKeyMessage2");
const emailAuthMessage = document.getElementById("emailAuthMessage");


// 전화번호 인증하기 유효성 검사 진행
inputEmail2.addEventListener("input", () => {
    if(inputEmail2.value.trim().length == 0){
        inputEmail2.value = "";

        emailAuthMessage.innerText = "";
        emailAuthMessage.classList.remove("confirm", "error");

        checkPhoneAuth.inputEmail2 = false;
        return;
    }
})

btn3.addEventListener("click", () => {

    authMin = 4;
    authSec = 59;

    if(inputEmail1.value.trim().length == 0){
        alert("이메일을 입력 해주세요");
        return;
    }



    fetch("/emailAuth" ,{
        method : "POST",
        headers: { "content-Type": "application/text" },
        body: inputEmail1.value
    })
        .then(resp => resp.text())
        .then(result => {
            if(result != null){
                alert("인증 번호가 발송되었습니다.")
                console.log(result);
            }else{
                alert("인증번호 발송 실패")
            }
        })
        .catch(err => {
            console.log("이메일 발송 중 에러 발생");
            console.log(err);
        });

    authKeyMessage2.innerText = "05:00";
    authKeyMessage2.classList.remove("confirm");


    authTimer = window.setInterval(()=>{


        authKeyMessage2.innerText = "0" + authMin + ":" + (authSec<10 ? "0" + authSec : authSec);

        // 남은 시간이 0분 0초인 경우
        if(authMin == 0 && authSec == 0){
            checkSignUp.authKey = false;
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

})


btn4.addEventListener("click", () => {

    if(authMin > 0 || authSec > 0){ // 시간 제한이 지나지 않은 경우에만 인증번호 검사 진행

        const data = {
            "inputEmail2" : inputEmail2.value,
            "inputEmail1" : inputEmail1.value
        }


        fetch("/emailAuthCheck", {
            method : "POST",
            headers: { "content-Type": "application/json" },
            body: JSON.stringify(data)

        })
            .then(resp => resp.text())

            .then(result => {

                if(result > 0){
                    emailAuthMessage.innerText ="인증되었습니다.";
                    emailAuthMessage.classList.add("confirm");
                    emailAuthMessage.classList.remove("error");

                    checkPhoneAuth.inputEmail2 = true;

                }else{
                    emailAuthMessage.innerText ="인증번호가 일치하지 않습니다";
                    emailAuthMessage.classList.add("error");
                    emailAuthMessage.classList.remove("confirm");

                    checkPhoneAuth.inputEmail2 = false;
                }
            })

            .catch(err => {
                console.log("이메일 발송 중 에러 발생");
                console.log(err);
            });

    }else{
        alert("인증 시간이 만료되었습니다. 다시 시도해주세요.")
    }


})


/*************** 이메일 인증 아이디 찾기 버튼 클릭 시 ! ************************/
document.getElementById("findIdBtn2").addEventListener("click", () => {
// checkSignUp 모든 value가 true인지 검사
    checkPhoneAuth.inputTel2=true;


    for( let key in checkPhoneAuth ){

        if(!checkPhoneAuth[key]){ // 각 key에 대한 value(true/false)를 얻어와
            // false인 경우 == 유효하지 않다!

            switch(key){
                case "inputEmail2" : alert("이메일 인증을 해주세요"); break;
            }

            // 유효하지 않은 input 태그로 focus 이동
            // - key를 input의 id와 똑같이 설정했음
            document.getElementById(key).focus();

            checkPhoneAuth.inputTel2=false;

            // form 태그 기본 이벤트 제거
            e.preventDefault();
            return; // 함수 종료

        }

    }

    fetch("/member/findId/email", {
        method : 'POST',
        headers : {'Content-Type' : 'application/text'},
        body : inputEmail1.value
    })
        .then( resp => resp.text())
        .then(findIdEmail =>{
            if(findIdEmail != '') {
                idModal.style.display = 'block';
                findTelId.innerText = findIdEmail;

                inputEmail1.value = '';
                inputEmail2.value = '';
                authKeyMessage2.innerText = '';

            }else{
                idModal.style.display = 'block';
                findTelId.innerText = '일치하는 ID가 없습니다';

                inputEmail1.value = '';
                inputEmail2.value = '';
                authKeyMessage2.innerText = '';
            }

        })
        .catch(e => console.log(e))


})









/* x누를 시 modal창 display none으로 만들기*/
const idModalClose = document.getElementById("idModalClose");

idModalClose.addEventListener("click", () => {
    if(idModal != null){
        idModal.style.display = 'none';
        location.reload(true);
    }

});



