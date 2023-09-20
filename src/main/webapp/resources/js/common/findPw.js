/* 휴대전화 인증 */
const inputTel1 = document.getElementById("inputTel1");
const inputTel2 = document.getElementById("inputTel2");

const btn1 = document.getElementById("btn1");
const btn2 = document.getElementById("btn2");

const telAuthMessage = document.getElementById("telAuthMessage");

/* 비밀번호 재발급 전화번호/이메일 인증 유효성 검사 */
const checkPhoneAuth = {
    "inputId1" : false,
    "inputId2" : false,
    "inputTel2" : false,
    "inputEmail2" : false

    // "inputId1" : true,
    // "inputId2" : true,
    // "inputTel2" : true,
    // "inputEmail2" : true
    //실험용
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


const inputId1 = document.getElementById("inputId1");
const inputId2 = document.getElementById("inputId2");

const pwModal = document.getElementsByClassName("pwModal")[0];


/***************************** 전화번호 인증으로 찾기 버튼!!!**********************************/
document.getElementById("findPwBtn1").addEventListener("click", (e) => {

    // checkPw 모든 value가 true인지 검사

    for( let key in checkPhoneAuth ){

        checkPhoneAuth.inputEmail2=true;
        checkPhoneAuth.inputId2 = true;

        if(inputId1.value.trim().length == 0){

            checkPhoneAuth.inputId1 = false;

        }else{

            /* 아이디 찾기 ajax 실행 해야 함*/
            checkPhoneAuth.inputId1 = true;
        }


        if(!checkPhoneAuth[key]){ // 각 key에 대한 value(true/false)를 얻어와
            // false인 경우 == 유효하지 않다!

            switch(key){
                case "inputId1" : alert("비밀번호 재발급할 ID를 입력해주세요"); break;
                case "inputTel2" : alert("전화번호 인증을 해주세요"); break;
            }

            // 유효하지 않은 input 태그로 focus 이동
            // - key를 input의 id와 똑같이 설정했음
            document.getElementById(key).focus();

            checkPhoneAuth.inputEmail2=false;
            checkPhoneAuth.inputId2 = false;

            // form 태그 기본 이벤트 제거
            e.preventDefault();
            return; // 함수 종료

        }

    }

    const data = {
        "inputTel1" : inputTel1.value,
        "inputId1" : inputId1.value
    }

    fetch("/member/findPw/tel", {
        method : 'POST',
        headers : {'Content-Type' : 'application/json'},
        body : JSON.stringify(data)
    })
        .then( resp => resp.text())
        .then(findPwTel =>{
            console.log(findPwTel);

            if(findPwTel > 0) {
                console.log("값 가져오기 성공");
                pwModal.style.display = 'block';

                inputTel1.value = '';
                inputTel2.value = '';
                authKeyMessage.innerText = '';



            }else{
                //idModal.style.display = 'block';
                alert("일치하는 아이디, 전화번호가 아니거나 전화번호 인증이 안되었습니다.")
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
document.getElementById("findPwBtn2").addEventListener("click", (e) => {
    // checkPw 모든 value가 true인지 검사
        checkPhoneAuth.inputTel2=true;
        checkPhoneAuth.inputId1 = true;

        if(inputId2.value.trim().length == 0){
            checkPhoneAuth.inputId2 = false;
        }else{
            checkPhoneAuth.inputId2 = true;
        }

        for( let key in checkPhoneAuth ){

            if(!checkPhoneAuth[key]){ // 각 key에 대한 value(true/false)를 얻어와
                // false인 경우 == 유효하지 않다!

                switch(key){
                    case "inputId2" : alert("비밀번호 재발급할 ID를 입력해주세요"); break;
                    case "inputEmail2" : alert("이메일 인증을 해주세요"); break;
                }

                // 유효하지 않은 input 태그로 focus 이동
                // - key를 input의 id와 똑같이 설정했음
                document.getElementById(key).focus();

                checkPhoneAuth.inputTel2=false;
                checkPhoneAuth.inputId1 = false;

                // form 태그 기본 이벤트 제거
                e.preventDefault();
                return; // 함수 종료

            }

        }

        const data = {
            "inputEmail1" : inputEmail1.value,
            "inputId2" : inputId2.value
        }

        fetch("/member/findPw/email", {
            method : 'POST',
            headers : {'Content-Type' : 'application/json'},
            body : JSON.stringify(data)
        })
            .then( resp => resp.text())
            .then(result =>{
                if(result > 0) {
                    console.log("성공이야?")
                    pwModal.style.display = 'block';

                    inputEmail1.value = '';
                    inputEmail2.value = '';
                    authKeyMessage2.innerText = '';

                }else{
                    console.log("실패이야?")
                    //pwModal.style.display = 'none';

                    alert("일치하는 아이디, 이메일이 아니거나 이메일 인증이 안되었습니다.")

                    authKeyMessage2.innerText = '';
                }

            })
            .catch(e => console.log(e))


})





/********************* 모달창에서 비밀번호 확인 정규표현식 **********************************/

const newPw = document.getElementById("newPw");
const newPw2 = document.getElementById("newPw2");
const pwMessage = document.getElementById("pwMessage");
const pwCheckMessage = document.getElementById("pwCheckMessage");

const checkPw = {
    "newPw" : false,
    "newPw2" : false
}

if(newPw != null){
    /*modal창에서 새 비밀번호로 변경*/
    newPw.addEventListener("input", () => {

        if(newPw.value.trim().length == 0){
            newPw.value = "";

            pwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요";
            pwMessage.classList.remove("confirm", "error"); // 검정 글씨

            checkPw.newPw = false; // 빈칸 == 유효 X
            return;
        }

        // 정규 표현식을 이용한 비밀번호 유효성 검사
        // 영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이
        const regEx = /^[A-Za-z0-9\!\@\#\-\_]{6,20}$/;

        // 입력한 비밀번호가 유효한 경우
        if(regEx.test(newPw.value)){
            pwMessage.innerText = "사용 가능한 비밀번호 입니다.";
            pwMessage.classList.add("confirm");
            pwMessage.classList.remove("error");
            checkPw.newPw = true;

            // 비밀번호가 유효하게 작성된 상태에서
            // 비밀번호 확인이 입력되지 않았을 때 비밀번호 확인쪽은 검정글씨에 기본글씨
            if(newPw2.value.trim().length == 0){
                pwCheckMessage.innerText = "";
                pwCheckMessage.classList.remove("confirm", "error");

            } else{

                // 비밀번호가 유효하게 작성된 상태에서
                // 비밀번호 확인이 입력되어 있을 때

                // 비밀번호 == 비밀번호 확인 (같을 경우)
                if(newPw.value == newPw2.value){
                    pwCheckMessage.innerText = "비밀번호가 일치합니다";
                    pwCheckMessage.classList.add("confirm");
                    pwCheckMessage.classList.remove("error");

                    checkPw.newPw2 = true;

                }else{ // 다른 경우

                    pwCheckMessage.innerText = "비밀번호가 일치하지 않습니다.";
                    pwCheckMessage.classList.add("error");
                    pwCheckMessage.classList.remove("confirm");

                    checkPw.newPw2 = false;

                }

            }


        }else{ // 유효하지 않은 경우


            // 비밀번호가 유효하게 작성된 상태에서
            pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
            pwMessage.classList.add("error");
            pwMessage.classList.remove("confirm");

            checkPw.newPw = false;

        }

    })

}


if(newPw2 != null){
    ///////////////////// 비밀번호 확인 입력 시 유효성 검사 /////////////////////
    newPw2.addEventListener("input", ()=> {

        // 비밀번호가 유효하게 작성된 경우는 같을때만 true를 반환하고
        // 유효하게 작성되지 않은 경우는 비밀번호를 같게 작성하더라도 넘어가지 못하게 설정

        if(newPw2.value.trim().length == 0){
            newPw2.value = "";

            pwCheckMessage.innerText = "";
            pwCheckMessage.classList.remove("confirm", "error"); // 검정 글씨

            checkPw.newPw2 = false; // 빈칸 == 유효 X
            return;
        }


        if(checkPw.newPw){ // 비밀번호가 유효하게 작성된 경우에

            // 비밀번호 == 비밀번호 확인 (같을 경우)
            if(newPw.value == newPw2.value){
                pwCheckMessage.innerText = "비밀번호가 일치합니다";
                pwCheckMessage.classList.add("confirm");
                pwCheckMessage.classList.remove("error");

                checkPw.newPw2 = true;

            }else{ // 다른 경우

                pwCheckMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwCheckMessage.classList.add("error");
                pwCheckMessage.classList.remove("confirm");

                checkPw.newPw2 = false;

            }

        } else{ // 비밀번호가 유효하지 않은 경우

            if(newPw.value == newPw2.value){
                pwCheckMessage.innerText = "비밀번호가 일치합니다";
                pwCheckMessage.classList.add("confirm");
                pwCheckMessage.classList.remove("error");

                checkPw.newPw2 = false;

            }else{ // 다른 경우

                pwCheckMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwCheckMessage.classList.add("error");
                pwCheckMessage.classList.remove("confirm");

                checkPw.newPw2 = false;

            }
        }

    })
}

const newPwFrm = document.getElementById("newPwFrm");


newPwFrm.addEventListener("submit", (e) => {
    for( let key in checkPw ){

        if(!checkPw[key]){ // 각 key에 대한 value(true/false)를 얻어와
            // false인 경우 == 유효하지 않다!

            switch(key){
                case "newPw" : alert("비밀번호가 유효하지 않습니다."); break;
                case "newPw2" : alert("비밀번호 확인이 유효하지 않습니다."); break;
            }

            document.getElementById(key).focus();

            // form 태그 기본 이벤트 제거
            e.preventDefault();
            return; // 함수 종료

        }

    }
})




/* x누를 시 modal창 display none으로 만들기*/
const pwModalClose = document.getElementById("pwModalClose");

pwModalClose.addEventListener("click", () => {
    if(pwModal != null){
        pwModal.style.display = 'none';
        // location.reload(true);
    }

});






