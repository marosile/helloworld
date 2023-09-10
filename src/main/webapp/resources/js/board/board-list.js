
// 스위퍼
var mySwiper = new Swiper('.swiper-container', {
    slidesPerView: 3, // 한 화면에 보여질 슬라이드 개수
    slidesPerGroup: 2,    // 한 번에 그룹으로 넘어갈 슬라이드 개수
    spaceBetween: 10,     // 슬라이드 사이의 간격
    navigation: {
        nextEl: '.swiper-button-next', // 다음 버튼 클래스
        prevEl: '.swiper-button-prev', // 이전 버튼 클래스
    },
    
});


const postSecondPart = document.getElementsByClassName("postSecondPart");
const postThirdPart = document.getElementsByClassName("postThirdPart");



// 각각의 상세페이지로
for (let i = 0; i < postSecondPart.length; i++) {
    postSecondPart[i].addEventListener("click", () => {
   
    location.href = "detail";
  });
}

for (let i = 0; i < postThirdPart.length; i++) {
    postThirdPart[i].addEventListener("click", () => {
   
    location.href = "detail";
  });
}


// 작성하기 버튼
const boardInsert = document.getElementById("boardInsert");

boardInsert.addEventListener("click", () => {

    location.href = "/board2/write";

})

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// 무한스크롤

var page = 2; // 처음 ajax 넘길 page 번호

    var isLoading = false;

    /** 게시글 10개 불러올때 모달창 띄우기 */
    function showLoadingModal() {

        $('body').css('overflow', 'hidden'); // 모달 띄울 때 스크롤 막기

        $('#loadingModal').css('display', 'block'); 

        setTimeout( () => { hideLoadingModal(); }, 1000); // 1초동안 띄우기
    }
    
    /** 모달창 닫기 */
    function hideLoadingModal() {

        $('body').css('overflow', 'auto'); // 스크롤 허용

        $('#loadingModal').css('display', 'none');

    }

    /** 게시글 무한스크롤 */
    function loadMoreData() {

        if (!isLoading) {
            
            isLoading = true;

            showLoadingModal();
            
            fetch('loadPosts?page=' + page, {
                method: 'GET',
                headers: {'Content-Type': 'application/json'}
                // data : x
            })

            .then(response => {  // 응답 객체를 필요한 형태로 파싱하여 리턴

                if (!response.ok) { throw new Error('HTTP 응답 실패'); } 
                // response.ok 값은 HTTP 응답 코드가 200에서 299 사이인 경우에 true를 반환하고, 그 외의 경우에는 false를 반환한다.
                // 그 외의 경우는 예를 들어 404 ("Not Found")나 500 ("Internal Server Error") 등등...

                return response.json(); // .then(resp => resp.json())
            })

            .then(data => { // js 객체

                if (data.length > 0) { // 데이터 확인

                    console.log(data);
                    //(10) [{…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}, {…}]
                    //  1 : {boardNo: 11, boardTitle: '11번째 게시글', boardContent: '11번째 게시글 내용 입니다.', boardCreateDate: null, boardUpdateDate: null, …}
                    //  2 : {boardNo: 12, boardTitle: '12번째 게시글', boardContent: '12번째 게시글 내용 입니다.', boardCreateDate: null, boardUpdateDate: null, …}
                    //  3 : {boardNo: 13, boardTitle: '13번째 게시글', boardContent: '13번째 게시글 내용 입니다.', boardCreateDate: null, boardUpdateDate: null, …}

                    data.forEach( whatever => { // function(whatever) => {}

                        var postAppends = '<div class="posts">' +  
                                                '<div>' + whatever.boardTitle + '</div>' +
                                                '<div>' + whatever.boardContent + '</div>' +
                                            '</div>'; // 임시
                                            
                        $('#post').append(postAppends); 

                    });
                    page++; // 11~20, 21~30 구분을 위함 (controller)
                }

                isLoading = false;
                /* hideLoadingModal();  */
            
            })
            .catch(function(error) {
                console.error('Fetch 에러', error);
                isLoading = false;
            });
        }
    }


/** 스크롤 할 때마다 실행되는 함수 */
$(window).scroll(function() { 
    if ($(window).scrollTop() + $(window).height() >= $(document).height() - 100) {
        // 스크롤이 페이지 하단에 도달하면 추가 데이터 로드
        loadMoreData();
    }
});

/* 
    $(window).scrollTop(): 현재 스크롤 위치(초기값 0, 내릴수록 증가)
    $(window).height() : 현재 보이는 뷰포트(화면)의 높이를 (고정값)
    $(document).height() : 문서 전체의 높이(고정값)

    $(window).scrollTop() + $(window).height() >= $(document).height() - 100 
    -> 스크롤이 문서 하단에서 100px 이상 위에 있을 때(거의 다 내려왔을 때) 추가 데이터를 로드

    만약 전체 HTML 문서의 높이가 3000px이고 현재 뷰포트의 높이가 1500px이라면, 스크롤 위치가 0에서부터 시작하며, 
    스크롤을 아래로 내릴수록 스크롤 위치 값이 증가하게 됩니다. 끝까지 스크롤을 내리면 스크롤 위치는 HTML 문서의 높이인 3000과 같아집니다.
*/
        
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////