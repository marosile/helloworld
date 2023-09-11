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



/* 전화번호 인증 */
btn1.addEventListener("click", () => {

    const data = {
        "inputTel1": inputTel1.value
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
});



// 전체적으로 유효성 검사 진행
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


/****************************** 이메일 인증 *****************************/
const inputEmail2 = document.getElementById("inputEmail2");


document.getElementById("phoneFrm").addEventListener("submit", e => {

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
    alert("실행 확인용 창");

});


/*************** 이메일 인증을 위한 form 태그 ************************/
document.getElementById("emailFrm").addEventListener("submit", e => {

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

    alert("실행 확인용 창");

});





