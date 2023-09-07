
// 신청
const sub = document.getElementById("sub");
sub.addEventListener("click", () => {

        if(confirm("기업 담당자 지원서를 등록하시겠습니까?")){
            
            alert("기업 담당자 지원 신청이 완료되었습니다.                                     승인 여부는 1~2일 내 지원하신 휴대폰 번호로 알려드립니다.");
    
            location.href = "allNoticeList";

        }else{

        }


})


// 
const goToList = document.getElementById("go-to-list");

goToList.addEventListener("click", () => {

    if(confirm("정말 취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){

        alert("작성 취소");

        location.href = "allNoticeList";
   
    }else{

    }

})
