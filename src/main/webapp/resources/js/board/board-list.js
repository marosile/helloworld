
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

/* var intersectionObserver = new IntersectionObserver(function(entries) {
  // If intersectionRatio is 0, the target is out of view
  // and we do not need to do anything.
  if (entries[0].intersectionRatio <= 0) return;

  loadItems(10);
  console.log('Loaded new items');
});
// start observing
intersectionObserver.observe(document.querySelector('.scrollerFooter'));

const io = new IntersectionObserver((entries, observer) => {
entries.forEach(entry => {
  if (!entry.isIntersecting) return; 
  //entry가 interscting 중이 아니라면 함수를 실행하지 않습니다.
  if (page._scrollchk) return;
  //현재 page가 불러오는 중임을 나타내는 flag를 통해 불러오는 중이면 함수를 실행하지 않습니다.
  observer.observe(document.getElementById('sentinel'));
  //observer를 등록합니다.
  page._page += 1;
  //불러올 페이지를 추가합니다.
  page.list.search();
  //페이지를 불러오는 함수를 호출합니다.
});
});

io.observe(document.getElementById('sentinel'));

$.ajax({
url: url,
data: param,
method: "GET",
dataType: "json",
success: function (result) {
  console.log(result);
},
error: function (err) {
  console.log(err);
},
beforeSend: function () {
  _scrollchk = true; 
  //데이터가 로드 중임을 나타내는 flag입니다.
  document.getElementById('list').appendChild(skeleton.show());
  //skeleton을 그리는 함수를 이용해 DOM에 추가해줍니다.
  $(".loading").show();
  //loading animation을 가진 요소를 보여줍니다.
},
complete: function () {
  _scrollchk = false;
  //데이터가 로드 중임을 나타내는 flag입니다.
  $(".loading").hide();
  skeleton.hide();
  //loading animation 요소와 skeleton을 지우는 함수를 이용해 DOM에서 지워줍니다.
}
});

if (_total === 0) {
$('#sentinel').hide();
//검색된 아이템이 없을 경우 관찰중인 요소를 숨긴다.
}
else {
if (_total <= _page*20){
  $('#sentinel').hide();
  //검색된 아이템이 20개 이하일 경우 관찰중인 요소를 숨긴다.
}
else {
   $('#sentinel').show();
  //관찰중인 요소를 보여준다.
}
}

if (sessionStorage.getItem("page")) {
  var pageNum = Number.parseInt(sessionStorage.getItem("page"));
  _page = pageNum ;
  list.search();
}

window.addEventListener('pageshow', function (event) {
if (event.persisted || window.performance && window.performance.navigation.type == 2) {
   //
}
});

if (sessionStorage.getItem("page")) {
  var pageNum = Number.parseInt(sessionStorage.getItem("page"));
  _page = pageNum ;
  list.search();
} */

// 페이지 시작 시에 로드할 초기 페이지 번호를 설정합니다.
let currentPage = 1;

// 스크롤 이벤트를 감지합니다.
window.addEventListener("scroll", () => {
  // 스크롤바의 위치와 문서의 높이를 비교하여 페이지 하단에 도달했는지 확인합니다.
  if (window.innerHeight + window.scrollY >= document.body.offsetHeight) {
    // 새로운 페이지를 로드하기 위한 AJAX 요청을 보냅니다.
    loadMorePosts();
  }
});

// 새로운 게시물을 로드하는 함수입니다.
function loadMorePosts() {
  // AJAX 요청을 보내서 서버에서 새로운 게시물을 가져오는 코드를 작성합니다.
  // 서버에서 가져온 데이터를 HTML로 렌더링하고 페이지에 추가합니다.
  // 페이지 번호를 증가시킵니다.
  currentPage++;
}