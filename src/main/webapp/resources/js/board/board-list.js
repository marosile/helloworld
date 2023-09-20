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


// 검색창 이전 검색 기록을 남겨 놓기
const boardSearch = document.querySelector("#boardSearch");
const searchInput = document.querySelector("#searchInput");
const searchQuery = document.querySelector("#searchQuery");
const options = document.querySelectorAll("#searchKey > option");

// 즉시 실행
(()=>{

    const params = new URL(location.href).searchParams; //쿼리스트링 값 

    const searchKeyword = params.get("searchKeyword"); 
    
    if(searchKeyword != null){ 
        
        searchInput.value = searchKeyword;
    
    }

})();

// 검색어 입력 없이 제출된 경우
boardSearch.addEventListener("submit", e=>{
    
    if(searchQuery.value.trim().length == 0){ // 검색어 미입력 시
        
        e.preventDefault(); // submit 이벤트 제거
        alert("검색어를 입력해주세요.");
        location.href = location.pathname // 쿼리스트링 제외한 주소 /localhost/board/1 2 3 


    }

})

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
    
    const recentSortButton = document.getElementById("recentSortButton");
    const readCountSortButton = document.getElementById("readCountSortButton");

    let isRecentSort = true; // 초기값

    /** 최신순 정렬 클릭 이벤트 핸들러 */
    recentSortButton.addEventListener("click", () => {
        page = 2; // 페이지 번호 초기화
        isRecentSort = true;
        // 조회순 눌렀다가 최신순 누르면 redirect해서 화면이 올라가가지구 ajax로 가져오기
        fetch("readCountListBack?boardCode=" + boardCode)
        .then(resp => {
            if (!resp.ok) {
                throw new Error('HTTP 응답 실패');
            }
            return resp.json(); // Return the parsed JSON data
        })
        .then(rList => {

            // 게시글들 비우기
            document.getElementById("post").innerHTML='';

            // 최신순 10개 가져오기 (mapper rownum)
            rList.forEach( rList => { 

            var postAppends = 
                            '<a href="/board/'+ rList.boardCode+ '/'+ rList.boardNo+'">' +
                                '<div class="posts">' +  
                                           '<div class="postFirstpart">' +
                                                '<img src="/resources/images/logo.svg" class="writerImages">' +
                                                '<div class="firstPartRight">' +
                                                        '<div>' + rList.memberId + '</div>' +
                                                            '<div>'+ 
                                                            '<span id="minute">' + rList.createDate + '</span>' +
                                                        '</div>' +
                                                    '</div>' +
                                                '</div>' +

                                                '<div class="postSecondPart">' +"rList.boardContent(임시)" + '</div>' +
                                                '<div class="postThirdPart" style="max-height:100px>' + "rList.boardContent(임시)" + '</div>' +
                                                '<div class="postFourthPart">' + "#react #recoil #next.js" + '</div>' +
                                                '<div class="postFifthPart">' + 
                                                    '<div class="replyCount">' + "댓글 8" + '</div>' +
                                                    '<div class="inquiryCount">' + "조회수" + rList.readCount+ '</div>' +
                                                '</div>' +

                                '</div>' + // 임시
                                '</a>';
                                            
                        $('#post').append(postAppends); 
                    });
        })
        .catch(err => console.log(err));

    });

    /** 조회순 정렬 클릭 이벤트 핸들러 */
    readCountSortButton.addEventListener("click", () => {
        page = 2; // 페이지 번호 초기화    
        isRecentSort = false;

    fetch("readCountList?boardCode=" + boardCode)
        .then(resp => {
            if (!resp.ok) {
                throw new Error('HTTP 응답 실패');
            }
            return resp.json(); // Return the parsed JSON data
        })
        .then(rList => {

            // 게시글들 비우기
            document.getElementById("post").innerHTML='';

            // 조회순으로 10개 가져오기 (mapper rownum)
            rList.forEach( rList => { 
            var postAppends = 
                            '<a href="/board/'+ rList.boardCode+ '/'+ rList.boardNo+'">' +
                                '<div class="posts">' +  
                                           '<div class="postFirstpart">' +
                                                '<img src="/resources/images/logo.svg" class="writerImages">' +
                                                '<div class="firstPartRight">' +
                                                        '<div>' + rList.memberId + '</div>' +
                                                            '<div>'+ 
                                                            '<span id="minute">' + rList.createDate + '</span>' +
                                                        '</div>' +
                                                    '</div>' +
                                                '</div>' +

                                                '<div class="postSecondPart">' + rList.boardTitle + '</div>' +
                                                '<div class="postThirdPart" style="max-height:100px>' + "rList.boardContent(임시)" + '</div>' +
                                                '<div class="postFourthPart">' + "#react #recoil #next.js" + '</div>' +
                                                '<div class="postFiftPart">' + 
                                                    '<div class="replyCount">' + "댓글 8" + '</div>' +
                                                    '<div class="inquiryCount">' + "조회수" + rList.readCount+ '</div>' +
                                                '</div>' +

                                '</div>' + // 임시
                                '</a>';
                                            
                        $('#post').append(postAppends); 
                    });
        })
        .catch(err => console.log(err));
});


    /** 게시글 무한스크롤 */
    function loadMoreData() {

        if (!isLoading) {
            
            isLoading = true;

            showLoadingModal();

            const url = isRecentSort
            ? "loadPosts?page=" + page + "&boardCode=" + boardCode
            : "loadPostsByReadCount?page=" + page + "&boardCode=" + boardCode; 
          
            fetch(url, { // fetch('loadPosts?page=' + page + '&boardCode=' + boardCode,{
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

                        var tagNames = whatever.tagList.filter(tag => tag.tagName !== null) // null이 아닌 태그만 필터링
                        .map(tag => '#' + tag.tagName) // 각 태그에 #을 추가
                        .join(', '); // 쉼표와 공백으로 구분된 문자열로 합침

                        //tagList 배열에서 각 요소(태그 객체)의 tagName 속성만 추출하여 새로운 배열을 생성.

                        /*  
                            [
                                { tagName: 'react' },
                                { tagName: 'recoil' },    --------------- >>>>>>>  "#react, #recoil, #next.js"
                                { tagName: 'next.js' }
                            ]
                        */

                        var postAppends = '<div class="posts">' +  
                                           '<div class="postFirstpart">' +
                                                '<img src="/resources/images/logo.svg" class="writerImages">' +
                                                '<div class="firstPartRight">' +
                                                        '<div>' + whatever.memberId + '</div>' +
                                                            '<div>'+ whatever.memberNickname +
                                                            '<span id="minute">' + whatever.createDate + '</span>' +
                                                        '</div>' +
                                                    '</div>' +
                                                '</div>' +

                                                '<div class="postSecondPart">' + whatever.boardTitle + '</div>' +
                                                '<div class="postThirdPart">' + "whatever.boardContent(임시)" + '</div>' +
                                                '<div class="postFourthPart">' + tagNames + '</div>' +
                                                '<div class="postFifthPart">' + 
                                                    '<div class="replyCount">' + "댓글 5" + '</div>' +
                                                    '<div class="inquiryCount">' + "조회 7" + '</div>' +
                                                '</div>' +

                                            '</div>'; 
                                            
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
        
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
