const searchMember = document.getElementById("searchMember");
const searchMenu = document.getElementById("searchMenu");

// searchMember.addEventListener("click", () => {

//     searchMenu.classList.toggle("menuHidden")

// });

const searchId = document.getElementById("searchId");
const searchPw = document.getElementById("searchPw");
const searchTel = document.getElementById("searchTel");
const searchNickname = document.getElementById("searchNickname");

/* 사진 */
const img = document.createElement("img");
img.setAttribute("src", "/resources/images/admin/sort.png");

// /* 아이디 */
// searchId.addEventListener("click", () => {
//     searchMember.innerHTML="아이디";
//     searchMember.append(img);
//     searchMenu.classList.add("menuHidden");
// });

// /* 이메일 */
// searchPw.addEventListener("click", () => {
//     searchMember.innerHTML="이메일";
//     searchMember.append(img);
//     searchMenu.classList.add("menuHidden");
// });

// /* 전화번호 */
// searchTel.addEventListener("click", () => {
//     searchMember.innerHTML="전화번호";
//     searchMember.append(img);
//     searchMenu.classList.add("menuHidden");
// });

// /* 닉네임 */
// searchNickname.addEventListener("click", () => {
//     searchMember.innerHTML="닉네임";
//     searchMember.append(img);
//     searchMenu.classList.add("menuHidden");
// });


// 코드 길이 줄이기

searchMember.addEventListener("click", () => {

    searchMenu.classList.toggle("menuHidden")

});

searchMenu.addEventListener("click", (e) => {

    if (e.target.nodeName === "BUTTON") {
        searchMember.innerHTML = e.target.innerHTML;
        searchMenu.classList.toggle("menuHidden")
        searchMember.append(img);
    }

});





/* 체크박스 모두 선택 ! */
$(document).ready(function(){

    $("#memberCheckAll").click(function(){

        if($("#memberCheckAll").is(":checked")){
            $("[name='memberCheck']").prop("checked", true);
        }else{
            $("[name='memberCheck']").prop("checked", false);
        }

    });

    // 한개라도 체크박스 풀리면 풀리고 모두 체크가 되면 모두 동의까지 체크되게 만들어줌    
    $("[name='memberCheck']").click(function(){

        var total = $("[name='memberCheck']").length;
        var checked = $("[name='memberCheck']:checked").length;
        // console.log(total);
        // console.log(checked);

        if(total == checked){
            $("#memberCheckAll").prop("checked", true);
        }else{
            $("#memberCheckAll").prop("checked", false);
        }
        
    });

})