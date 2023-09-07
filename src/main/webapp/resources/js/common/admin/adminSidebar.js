const searchMember = document.getElementById("searchMember");
const searchMenu = document.getElementById("searchMenu");

searchMember.addEventListener("click", () => {

    searchMenu.classList.toggle("menuHidden")

});

const searchId = document.getElementById("searchId");
const searchPw = document.getElementById("searchPw");
const searchTel = document.getElementById("searchTel");
const searchNickname = document.getElementById("searchNickname");

/* 사진 */
const img = document.createElement("img");
img.setAttribute("src", "../images/admin/sort.png");

/* 아이디 */
searchId.addEventListener("click", () => {
    searchMember.innerHTML="아이디";
    searchMember.append(img);
    searchMenu.classList.add("menuHidden");
});

/* 이메일 */
searchPw.addEventListener("click", () => {
    searchMember.innerHTML="이메일";
    searchMember.append(img);
    searchMenu.classList.add("menuHidden");
});

/* 전화번호 */
searchTel.addEventListener("click", () => {
    searchMember.innerHTML="전화번호";
    searchMember.append(img);
    searchMenu.classList.add("menuHidden");
});

/* 닉네임 */
searchNickname.addEventListener("click", () => {
    searchMember.innerHTML="닉네임";
    searchMember.append(img);
    searchMenu.classList.add("menuHidden");
});