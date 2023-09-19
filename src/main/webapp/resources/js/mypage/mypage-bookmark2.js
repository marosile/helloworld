const row1 = document.getElementsByClassName("row1");

for (let i = 0; i < row1.length; i++){
    row1[i].addEventListener("click", () => {

        location.href = "/recruit/testResultAndRecuritDetail";

    });
}
