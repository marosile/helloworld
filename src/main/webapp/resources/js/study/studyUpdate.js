// 카테고리 - 역할 클릭 했을때
const categoryBtn = document.querySelector('.P-body-category-btn');
const selectBoxRole = document.querySelector('.P-selectBox-role');

categoryBtn.addEventListener("click", () => {
    selectBoxRole.classList.toggle("menuHidden")
});

selectBoxRole.addEventListener("click", (e) => {
    if (e.target.nodeName === "BUTTON") {
        const selectedRole = e.target.innerHTML; // 클릭한 버튼의 내용(예: "프론트앤드")을 가져옴
        categoryBtn.innerHTML = selectedRole;
        selectBoxRole.classList.add("menuHidden")

        // selectedRole 값을 해당 요소의 value 속성에 설정
        document.getElementById("selectedRole").value = selectedRole;
    }
});



/*
// 카테고리 - 목적 클릭 했을때
const purposeBtn = document.querySelector('.P-body-purpose-btn');
const selectBoxPurpose = document.querySelector('.P-selectBox-purpose');

purposeBtn.addEventListener("click", () => {

    selectBoxPurpose.classList.toggle("menuHidden")

})

selectBoxPurpose.addEventListener("click", (e) => {

    if (e.target.nodeName == "BUTTON") {
        purposeBtn.innerHTML = e.target.innerHTML;
        selectBoxPurpose.classList.add("menuHidden")
    }
})
*/



// 카테고리 - 인원 클릭 했을때
const countBtn = document.querySelector('.P-body-count-btn'); /* 큰 버튼 */
const selectBoxCount = document.querySelector('.P-selectBox-count'); /* 숨겨진 버튼 */
const minusBtn = document.getElementById("P-minusBtn"); /* +버튼 */
const count = document.getElementById("count"); /* 숫자 작성 */
const plusBtn = document.getElementById("P-plusBtn"); /* -버튼 */
const personBtn = document.getElementById("P-personBtn"); /* 완료버튼 */

countBtn.addEventListener("click", () => {
    selectBoxCount.classList.toggle("menuHidden")



})

let count1 = 1

minusBtn.addEventListener("click", () => {


    if (count1 > 1) {
        count1--

    }
    count.innerText = count1;
})

plusBtn.addEventListener("click", () => {

    count1++
    count.innerText = count1;

})

personBtn.addEventListener("click", (e) => {

    if (e.target.nodeName == "BUTTON") {
        selectBoxCount.classList.add("menuHidden")
        countBtn.innerText = "인원 : " + count1

        document.getElementById('countInput').value = count1;
    }


})
// 작성취소
// 작성하기
const BtnDelete = document.getElementById("BtnDelete");

BtnDelete.addEventListener("click", () => {

    if(confirm("작성취소하시겠습니까? 작성한 내용은 저장되지 않습니다.")){
        location.href="/study/main";
    }
})


// 지도에 폴리곤으로 표시할 영역데이터 배열입니다
var areas = [];

/* 1. JSON 파일을 읽어들여 areas 배열을 채워넣는 작업 */

// 1) getJSON도 ajax 메소드와 같이 async(비동기) 방식으로 동작하는데, 순차실행을 위해 이걸 강제로 sync 방식으로 동작하도록 함.
$.ajaxSetup({
    async : false
});

// 2) getJSON 메소드를 이용해 JSON 파일을 파싱함
$.getJSON("/resources/seoul_gson.json", function(geojson) {
    var units = geojson.features; // 파일에서 key값이 "features"인 것의 value를 통으로 가져옴(이것은 여러지역에 대한 정보를 모두 담고있음)
    $.each(units, function(index, unit) { // 1개 지역씩 꺼내서 사용함. val은 그 1개 지역에 대한 정보를 담음
        var coordinates = []; //좌표 저장할 배열
        var name = ''; // 지역 이름

        coordinates = unit.geometry.coordinates; // 1개 지역의 영역을 구성하는 도형의 모든 좌표 배열을 가져옴
        name = unit.properties.SIG_KOR_NM; // 1개 지역의 이름을 가져옴

        var ob = new Object();
        ob.name = name;
        ob.path = [];

        $.each(coordinates[0], function(index, coordinate) { // []로 한번 더 감싸져 있어서 index 0번의 것을 꺼내야 배열을 접근가능.
            ob.path
                .push(new kakao.maps.LatLng(coordinate[1],
                    coordinate[0]));

        });

        areas[index] = ob;
    });//each
});//getJSON

/* 2. 지도 띄우기 */

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption),
    customOverlay = new kakao.maps.CustomOverlay({}),
    infowindow = new kakao.maps.InfoWindow({removable: true});

// 지도에 영역데이터를 폴리곤으로 표시합니다
for (var i = 0, len = areas.length; i < len; i++) {
    displayArea(areas[i]);
}

// 다각형을 생상하고 이벤트를 등록하는 함수입니다
function displayArea(area) {

    // 다각형을 생성합니다
    var polygon = new kakao.maps.Polygon({
        map: map, // 다각형을 표시할 지도 객체
        path: area.path,
        strokeWeight: 2,
        strokeColor: '#004c80',
        strokeOpacity: 0.8,
        fillColor: '#fff',
        fillOpacity: 0.7
    });

    // 다각형에 mouseover 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 변경합니다
    // 지역명을 표시하는 커스텀오버레이를 지도위에 표시합니다
    kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent) {
        polygon.setOptions({fillColor: '#09f'});

        customOverlay.setContent('<div class="area">' + area.name + '</div>');

        customOverlay.setPosition(mouseEvent.latLng);
        customOverlay.setMap(map);
    });

    // 다각형에 mousemove 이벤트를 등록하고 이벤트가 발생하면 커스텀 오버레이의 위치를 변경합니다
    kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {

        customOverlay.setPosition(mouseEvent.latLng);
    });

    // 다각형에 mouseout 이벤트를 등록하고 이벤트가 발생하면 폴리곤의 채움색을 원래색으로 변경합니다
    // 커스텀 오버레이를 지도에서 제거합니다
    kakao.maps.event.addListener(polygon, 'mouseout', function() {
        polygon.setOptions({fillColor: '#fff'});
        customOverlay.setMap(null);
    });

    // 다각형에 click 이벤트를 등록하고 이벤트가 발생하면 다각형의 이름과 면적을 인포윈도우에 표시합니다
    kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
        var content = '<div class="info">' +
            '   <div class="title" name="location">' + area.name + '</div>' +

            '</div>';

        infowindow.setContent(content);
        infowindow.setPosition(mouseEvent.latLng);
        infowindow.setMap(map);


        const location= document.getElementsByClassName('title')[0].innerHTML
        console.log(location)

        const mapVal = document.getElementById("mapVal");

        mapVal.value = location;


    });

}




const BtnDelet = document.getElementById("BtnDelet");

if(BtnDelet!=null){

    BtnDelet.addEventListener("click",() =>{
        if(confirm("정말 수정 취소하시겠습니까? "))
            location.href = location.pathname.replace("boardNo")+"/delete"
    })
}