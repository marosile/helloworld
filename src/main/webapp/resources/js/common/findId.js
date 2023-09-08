/* 전화번호 인증을 위한 js */



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

/* 실험용 */
document.getElementById("btn4").addEventListener("click", () => {
    alert("클릭됨");
})






