// 조회방법 처음 버튼 요소
const searchMember = document.getElementById("searchMember");

// key 있는 ul태그
const searchMenu = document.getElementById("searchMenu");

// form 태그
const searchMemberMenu = document.getElementById("searchMemberMenu");

// 검색 input 태그
const searchInput = document.getElementById("searchInput");

// searchMember.addEventListener("click", () => {

//     searchMenu.classList.toggle("menuHidden")

// });

const searchId = document.getElementById("searchId");
const searchId1 = document.getElementById("searchId1");
const searchEmail = document.getElementById("searchEmail");
const searchEmail1 = document.getElementById("searchEmail1");
const searchTel = document.getElementById("searchTel");
const searchTel1 = document.getElementById("searchTel1");
const searchNickname = document.getElementById("searchNickname");
const searchNickname1 = document.getElementById("searchNickname1");

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



// 도전간다
searchId.addEventListener("click", ()=>{
    searchId1.selected = true;
    console.log("아이디 버튼 클릭 됨?")
})
searchEmail.addEventListener("click", () => {
    searchEmail1.selected = true;
    console.log("이메일 버튼 클릭 됨?")
})

searchTel.addEventListener("click", () => {
    searchTel1.selected = true;
    console.log("전화번호 버튼 클릭 됨?")
})

searchNickname.addEventListener("click", () => {
    searchNickname1.selected = true;
    console.log("닉네임 버튼 클릭 됨?")
})





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


/* 관리자 회원 탈퇴 */
$(document).ready(function () {

    // 탈퇴 버튼 클릭 시
    $("#searchMemberBtn").click((e) => {

        if(confirm("정말 삭제 하시겠습니까?")){

            // 체크된 체크박스 요소를 선택한다.
            var checkedCheckboxes = $('input[name="memberCheck"]:checked');

            // 체크된 체크박스 요소의 memberId 값을 얻어옵니다.
            var memberIds = [];

            checkedCheckboxes.each(function () {
                var memberId = $(this).closest('tr').find('td:eq(2)').text();
                memberIds.push(memberId);
            });


            // memberId 배열을 출력합니다.
            console.log("선택된 memberId 목록: " + memberIds);



            $.ajax({
                type : 'post',
                url : '/admin/adminMember/deleteMember',
                data : { "memberIdList" : memberIds },
                traditional : true,
                // contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                dataType : 'json',
                success : function(result){

                    if(result > 0){

                        location.reload(true);
                        alert("삭제 완료");
                    }else{
                        alert("삭제 실패");
                    }



                },
                error : function(err){
                    console.log(err);
                }

            })

            //e.preventDefault();
            //$("[name='memberCheck']:checked").parent().parent().remove();
        };
        e.preventDefault();
        //location.reload(true);

    });



});


// 검색어 입력 없이 제출된 경우
searchMemberMenu.addEventListener("submit", e=> {

    if(searchInput.value.trim().length == 0){ // 검색어 미입력 시
        e.preventDefault(); // form 기본 이벤트 제거

        location.href = location.pathname // 해당 게시판 1페이지로 이동

        // location.pathname = 쿼리스트링을 제외한 실제 주소

    }

})