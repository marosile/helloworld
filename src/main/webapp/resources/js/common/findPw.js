const inputTel1 = document.getElementById("inputTel1");
const inputTel2 = document.getElementById("inputTel2");

const btn1 = document.getElementById("btn1");
const btn2 = document.getElementById("btn2");

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
                alert("인증번호 확인")
            } else {
                alert("인증번호 확인 실패")
            }

        })

        .catch(err => console.log(err))


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

/* 실험용 */
document.getElementById("btn4").addEventListener("click", () => {
    alert("클릭됨");
})






