// 모두체크 js방식
// const checkAllId = document.getElementById("checkAll");
// const checkAll = document.getElementsByName("checkAll");

// checkAllId.addEventListener("click", ()=>{
    

//     checkAll.forEach(check => {
//         check.checked = checkAllId.checked;

//         check.addEventListener("click", ()=>{
//             if(!check.checked){
//                 checkAllId.checked = check.checked;
//             }
            
//         })


//     })

// });




/* 회원가입 유효성 검사 진행 여부 확인용 객체 생성
 -> 모든 value가 true인 경우에만 회원가입 할 수 있도록 진행 
*/
const checkSignUp = {

    "inputId" : false,
    "inputEmail" : false,
    "inputTel1" : false,
    "inputTel2" : false,
    "inputNickname" : false,
    "inputPw" : false,
    "inputConfirmPw" : false,
    "essentialCheck" : false,
    "authKey" : false

    // "inputId" : true,
    // "inputEmail" : true,
    // "inputTel1" : true,
    // "inputTel2" : true,
    // "inputNickname" : true,
    // "inputPw" : true,
    // "inputConfirmPw" : true,
    // "essentialCheck" : true,
    // "authKey" : true
    // 실험용

};

///////////////////// 아이디 유효성 검사 /////////////////////
const inputId = document.getElementById("inputId");
const idMessage = document.getElementById("idMessage");

// 아이디가 입력 될 때 마다 검사
inputId.addEventListener("input", () => {

    if(inputId.value.trim().length == 0){
        inputId.value = "";

        idMessage.innerText = "영문(대,소문자)와 숫자를 조합하여 5~14글자 사이로 입력해주세요";

        // confirm, error 클래스 삭제해서 검정 글씨로 만들기
        idMessage.classList.remove("confirm", "error");

        checkSignUp.inputId = false; 

        return;
    }

    // 아이디 정규식
    const regExp = /^([A-z]|[0-9]){5,14}$/;



    // 정규식 확인
    if(regExp.test(inputId.value)){

        // ajax 로  아이디 중복검사 실행
        fetch("/member/signUp/dupId?memberId=" + inputId.value)

        .then(resp => resp.text())

        .then(result => {

            console.log(result);

            if(result == 0){
                idMessage.innerText = "사용 가능한 아이디 입니다"
                idMessage.classList.add("confirm");
                idMessage.classList.remove("error");

                checkSignUp.inputId = true;
            }else{
                idMessage.innerText = "중복된 아이디 입니다. 다시 입력해주세요"
                idMessage.classList.add("error");
                idMessage.classList.remove("confirm");

                checkSignUp.inputId = false;
            }


        })

        .catch(e => console.log(e))




    }else{
        idMessage.innerText = "올바른 아이디 형식이 아닙니다. 다시 입력해주세요"
        idMessage.classList.add("error");
        idMessage.classList.remove("confirm");

        checkSignUp.inputId = false;
    }




});



///////////////////// 이메일 유효성 검사 /////////////////////
const inputEmail = document.getElementById("inputEmail");
const emailMessage = document.getElementById("emailMessage");

// 이메일이 입력 될 때 마다
inputEmail.addEventListener("input", () => {

    // 입력된 이메일이 없을 경우
    if(inputEmail.value.trim().length == 0){
        inputEmail.value = "";

        emailMessage.innerText = "이메일을 입력해주세요";

        // confirm, error 클래스 삭제해서 검정 글씨로 만들기
        emailMessage.classList.remove("confirm", "error");

        checkSignUp.inputEmail = false; // 빈칸 == 유효 X

        return;
    }

    // 정규 표현식
    const regExp = /^[A-Za-z\d\-\_]{4,}@[가-힣\w\-\_]+(\.\w+){1,3}$/;

    if(regExp.test(inputEmail.value)){ 


        // ajax 로 중복검사 실행 후 결과값으로 다시 if문 걸어야할듯
        // 이미 사용 중인지 확인해야한다

        fetch("/member/signUp/dupEmail?memberEmail=" + inputEmail.value)
        .then(resp => resp.text())
        .then(result => {

            if(result == 0){
                emailMessage.innerText = "사용 가능한 이메일 입니다";
                emailMessage.classList.add("confirm");
                emailMessage.classList.remove("error");

                checkSignUp.inputEmail = true;
            }else{
                emailMessage.innerText = "이미 가입 되어 있는 이메일 입니다";
                emailMessage.classList.add("error");
                emailMessage.classList.remove("confirm");

                checkSignUp.inputEmail = false;

            }


        })
        .catch(e => console.log(e))

    } else { 

        emailMessage.innerText = "이메일 형식이 일치하지 않습니다";
        emailMessage.classList.add("error");
        emailMessage.classList.remove("confirm");

        checkSignUp.inputEmail = false; // 유효 X
    }
    

});



///////////////////// 전화번호 유효성 검사 /////////////////////
const inputTel1 = document.getElementById("inputTel1");
const telMessage = document.getElementById("telMessage");

// 전화번호가 입력 되었을 때
inputTel1.addEventListener("input", () => {

    // 전화번호가 입력이 되지 않은 경우
    if(inputTel1.value.trim().length == 0){
        inputTel1.value = "";
        telMessage.innerText = "전화번호를 입력해주세요(- 제외)";
        telMessage.classList.remove("confirm", "error");
        checkSignUp.inputTel1 = false;
        return;
    }


    // 정규표현식으로 유효성 검사
    const regExp = /^0(1[01679]|2|[3-6][1-5]|70)\d{3,4}\d{4}$/;

    if(regExp.test(inputTel1.value)){

        /* ajax로 중복되는 전화번호가 있는지 확인 필요! */
        fetch("/member/signUp/dupTel?memberTel=" + inputTel1.value)
            .then(resp => resp.text())
            .then(result => {

                if(result == 0){
                    telMessage.innerText = "사용 가능한 전화번호 입니다";
                    telMessage.classList.add("confirm");
                    telMessage.classList.remove("error");

                    checkSignUp.inputTel1 = true;
                }else{
                    telMessage.innerText = "이미 가입 되어 있는 전화번호 입니다";
                    telMessage.classList.add("error");
                    telMessage.classList.remove("confirm");

                    checkSignUp.inputTel1 = false;
                }
            })
            .catch(e => console.log(e))





    }else{ // 무효
        telMessage.innerText = "전화번호 형식이 일치하지 않습니다";
        telMessage.classList.add("error");
        telMessage.classList.remove("confirm");

        checkSignUp.inputTel1 = false;

    }

});

///////////////////// 전화번호인증 유효성 검사 /////////////////////
const btn1 = document.getElementById("btn1");
const btn2 = document.getElementById("btn2");

const telAuthMessage = document.getElementById("telAuthMessage");

/* 전화번호 인증 타이머 */
const authKeyMessage = document.getElementById("authKeyMessage");
let authTimer;
let authMin = 4;
let authSec = 59;

    /* 전화번호 인증 */

    btn1.addEventListener("click", () => {

        // 전화번호가 입력이 되지 않은 경우
        if(inputTel1.value.trim().length == 0){
            inputTel1.value = "";
            telMessage.innerText = "전화번호를 입력해주세요(- 제외)";
            snackbar("전화번호를 입력해주세요(- 제외)", 'rgb(0, 128, 255)', '/resources/images/moon.png')
            telMessage.classList.remove("confirm", "error");
            checkSignUp.inputTel1 = false;
            return;
        }

        authMin = 4;
        authSec = 59;
        
        if(checkSignUp.inputTel1){
        
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
                    snackbar("인증번호가 발송되었습니다.", 'rgb(0, 128, 255)', '/resources/images/moon.png')
                    return;
                } else {
                    snackbar("인증번호 발송 실패", 'rgb(0, 128, 255)', '/resources/images/moon.png')
                    return;
                }
                
            })
            .catch(err => {
                console.log("인증번호 중 에러 발생");
                console.log(err);
            });



        
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

    }   else{
            snackbar("전화번호 형식이 일치하지 않거나 중복입니다. 다시 입력해주세요", 'rgb(0, 128, 255)', '/resources/images/moon.png');
            inputTel1.focus();
    }
});


// 전화번호 인증 input창 입력시 비어있을 때
inputTel2.addEventListener("input", () => {
    if(inputTel2.value.trim().length == 0){
        inputTel2.value = "";
        
        telAuthMessage.innerText = "";
        telAuthMessage.classList.remove("confirm", "error");

        checkSignUp.inputTel2 = false;
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

                telAuthMessage.innerText ="인증되었습니다.";
                telAuthMessage.classList.add("confirm");
                telAuthMessage.classList.remove("error");

                checkSignUp.inputTel2 = true;
                checkSignUp.authKey = true;



            } else { //인증번호가 일치하지 않을 때


                telAuthMessage.innerText ="인증번호가 일치하지 않습니다";
                telAuthMessage.classList.add("error");
                telAuthMessage.classList.remove("confirm");

                checkSignUp.inputTel2 = false;
                checkSignUp.authKey = false;

            }

        })

        .catch(err => console.log(err))

    }else{
        snackbar("인증 시간이 만료되었습니다. 다시 시도해주세요.", 'rgb(0, 128, 255)', '/resources/images/moon.png');
    }


});



///////////////////// 닉네임 유효성 검사 /////////////////////
// 닉네임은 중복검사 따로 안하기로 했음 (중복 가능)
const inputNickname = document.getElementById("inputNickname");
const nickMessage = document.getElementById("nickMessage");

// 닉네임이 입력이 되었을 때
inputNickname.addEventListener("input", () => {

    // 닉네임 입력이 되지 않은 경우
    if(inputNickname.value.trim().length == 0){

        inputNickname.value = "";
        
        nickMessage.innerText = "한글,영어,숫자 2~8글자 입력 해주세요";
        nickMessage.classList.remove("confirm", "error");

        checkSignUp.inputNickname = false;
        return;
    
    }

    // 정규표현식으로 유효성 검사
    const regExp = /^[가-힣\w\d]{2,10}$/;

    if(regExp.test(inputNickname.value)){ // 유효
       
        nickMessage.innerText = "사용 가능한 닉네임 입니다";
        nickMessage.classList.add("confirm");
        nickMessage.classList.remove("error");

        checkSignUp.inputNickname = true; // 유효 O

    }else{ 
        nickMessage.innerText = "닉네임 형식이 유효하지 않습니다";
        nickMessage.classList.add("error");
        nickMessage.classList.remove("confirm");

        checkSignUp.inputNickname = false;

    }


})



///////////////////// 비밀번호/비밀번호 확인 유효성 검사 /////////////////////
const inputPw = document.getElementById("inputPw");
const inputConfirmPw = document.getElementById("inputConfirmPw");
const pwMessage = document.getElementById("pwMessage");
const pwCheckMessage = document.getElementById("pwCheckMessage");

// 비밀번호 입력 시 유효성 검사
inputPw.addEventListener("input", () => {

    if(inputPw.value.trim().length == 0){
        inputPw.value = "";

        pwMessage.innerText = "영어,숫자,특수문자(!,@,#,-,_) 6~20글자 사이로 입력해주세요";
        pwMessage.classList.remove("confirm", "error"); // 검정 글씨
      
        checkSignUp.inputPw = false; // 빈칸 == 유효 X
        return;
    } 

    // 정규 표현식을 이용한 비밀번호 유효성 검사
    // 영어, 숫자, 특수문자(!,@,#,-,_) 6~20글자 사이
    const regEx = /^[A-Za-z0-9\!\@\#\-\_]{6,20}$/;

    // 입력한 비밀번호가 유효한 경우
    if(regEx.test(inputPw.value)){
        pwMessage.innerText = "사용 가능한 비밀번호 입니다.";
        pwMessage.classList.add("confirm");
        pwMessage.classList.remove("error");
        checkSignUp.inputPw = true;

        // 비밀번호가 유효하게 작성된 상태에서
        // 비밀번호 확인이 입력되지 않았을 때 비밀번호 확인쪽은 검정글씨에 기본글씨
        if(inputConfirmPw.value.trim().length == 0){
            pwCheckMessage.innerText = "";
            pwCheckMessage.classList.remove("confirm", "error");

        } else{

            // 비밀번호가 유효하게 작성된 상태에서
            // 비밀번호 확인이 입력되어 있을 때
            
            // 비밀번호 == 비밀번호 확인 (같을 경우)
            if(inputPw.value == inputConfirmPw.value){
                pwCheckMessage.innerText = "비밀번호가 일치합니다";
                pwCheckMessage.classList.add("confirm");
                pwCheckMessage.classList.remove("error");

                checkSignUp.inputConfirmPw = true;

            }else{ // 다른 경우

                pwCheckMessage.innerText = "비밀번호가 일치하지 않습니다.";
                pwCheckMessage.classList.add("error");
                pwCheckMessage.classList.remove("confirm");

                checkSignUp.inputConfirmPw = false;

            }

        }


    }else{ // 유효하지 않은 경우


        // 비밀번호가 유효하게 작성된 상태에서
        pwMessage.innerText = "비밀번호 형식이 유효하지 않습니다.";
        pwMessage.classList.add("error");
        pwMessage.classList.remove("confirm");

        checkSignUp.inputPw = false;

    }

})


///////////////////// 비밀번호 확인 입력 시 유효성 검사 /////////////////////
inputConfirmPw.addEventListener("input", ()=> {

    // 비밀번호가 유효하게 작성된 경우는 같을때만 true를 반환하고
    // 유효하게 작성되지 않은 경우는 비밀번호를 같게 작성하더라도 넘어가지 못하게 설정

    if(inputConfirmPw.value.trim().length == 0){
        inputConfirmPw.value = "";

        pwCheckMessage.innerText = "";
        pwCheckMessage.classList.remove("confirm", "error"); // 검정 글씨
      
        checkSignUp.inputConfirmPw = false; // 빈칸 == 유효 X
        return;
    } 


    if(checkSignUp.inputPw){ // 비밀번호가 유효하게 작성된 경우에

        // 비밀번호 == 비밀번호 확인 (같을 경우)
        if(inputPw.value == inputConfirmPw.value){
            pwCheckMessage.innerText = "비밀번호가 일치합니다";
            pwCheckMessage.classList.add("confirm");
            pwCheckMessage.classList.remove("error");

            checkSignUp.inputConfirmPw = true;

        }else{ // 다른 경우

            pwCheckMessage.innerText = "비밀번호가 일치하지 않습니다.";
            pwCheckMessage.classList.add("error");
            pwCheckMessage.classList.remove("confirm");

            checkSignUp.inputConfirmPw = false;

        }

    } else{ // 비밀번호가 유효하지 않은 경우

        if(inputPw.value == inputConfirmPw.value){
            pwCheckMessage.innerText = "비밀번호가 일치합니다";
            pwCheckMessage.classList.add("confirm");
            pwCheckMessage.classList.remove("error");

            checkSignUp.inputConfirmPw = false;

        }else{ // 다른 경우

            pwCheckMessage.innerText = "비밀번호가 일치하지 않습니다.";
            pwCheckMessage.classList.add("error");
            pwCheckMessage.classList.remove("confirm");

            checkSignUp.inputConfirmPw = false;

        }  
    }

})



///////////////////// 필수 동의 하기! /////////////////////
// jquery 방식이 더 쉽다
$(document).ready(function(){

    $("#checkAll").click(function(){

        if($("#checkAll").is(":checked")){
            $("[name='checkAll']").prop("checked", true);
            checkSignUp.essentialCheck = true;
        }else{
            $("[name='checkAll']").prop("checked", false);
            checkSignUp.essentialCheck = false;
        }

    });

    // 한개라도 체크박스 풀리면 풀리고 모두 체크가 되면 모두 동의까지 체크되게 만들어줌    
    $("[name='checkAll']").click(function(){

        var total = $("[name='checkAll']").length;
        var checked = $("[name='checkAll']:checked").length;
        // console.log(total);
        // console.log(checked);

        if(total == checked){
            $("#checkAll").prop("checked", true);

        }else{
            $("#checkAll").prop("checked", false);

        }
        
    });

    $(".essentialCheck").click(function(){

        var total1 = $(".essentialCheck").length;
        var checked1 = $(".essentialCheck:checked").length;

        if(total1 == checked1){

            checkSignUp.essentialCheck = true;
        }else{

            checkSignUp.essentialCheck = false;
        }
        
    });


});








///////////////////// 회원 가입 form태그가 제출 되었을 때 /////////////////////
document.getElementById("mainFrm").addEventListener("submit", e => {

    // checkSignUp 모든 value가 true인지 검사

    // 마케팅 동의 값보내주기 (좀 귀찮음) --> 잘 안되다가 해결 -완-
    const checkAll3 = document.getElementsByName("checkAll")[3];
    const promotionFl = document.getElementsByName("promotionFl")[0];

    if(checkAll3.checked == true){
        promotionFl.value = 'Y';
    }else{
        promotionFl.value = 'N';
    }


    for( let key in checkSignUp ){

        if(!checkSignUp[key]){ // 각 key에 대한 value(true/false)를 얻어와
                // false인 경우 == 유효하지 않다!

            switch(key){
                case "inputId" : alert("아이디가 유효하지 않습니다."); break;

                case "inputEmail" : alert("이메일이 유효하지 않습니다."); break;

                case "inputTel1" : alert("전화번호가 확인되지 않습니다."); break;

                case "inputTel2" : alert("전화번호 인증을 해주세요"); break;

                case "inputNickname" : alert("닉네임이 유효하지 않습니다."); break;

                case "inputPw" : alert("비밀번호가 유효하지 않습니다."); break;

                case "inputConfirmPw" : alert("비밀번호 확인이 유효하지 않습니다."); break;

                case "essentialCheck" : alert("필수 항목에 동의해주세요."); break;


            }

            // 유효하지 않은 input 태그로 focus 이동
            // - key를 input의 id와 똑같이 설정했음
            // essentialCheck만 class기 때문에 제외시켜줌
            if(key != "essentialCheck"){
                document.getElementById(key).focus();
            }

            // form 태그 기본 이벤트 제거
            e.preventDefault();
            return; // 함수 종료

        }

    }



});





