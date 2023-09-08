// 카테고리 - 역할 클릭 했을때 
const categoryBtn = document.querySelector('.P-body-category-btn');
const selectBoxRole = document.querySelector('.P-selectBox-role');

categoryBtn.addEventListener("click", () => {

    selectBoxRole.classList.toggle("menuHidden")

});

selectBoxRole.addEventListener("click", (e) => {

    if (e.target.nodeName === "BUTTON") {
        categoryBtn.innerHTML = e.target.innerHTML;
        selectBoxRole.classList.add("menuHidden")
    }

});





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
    }


})


/* 지도 */
var mapContainer = document.getElementById('map'), // 지도를 표시할 div

    mapOption = {
        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };

//지도를 미리 생성
var map = new daum.maps.Map(mapContainer, mapOption);
//주소-좌표 변환 객체를 생성
var geocoder = new daum.maps.services.Geocoder();
//마커를 미리 생성
var marker = new daum.maps.Marker({
    position: new daum.maps.LatLng(37.537187, 127.005476),
    map: map
});


function sample5_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            var addr = data.address; // 최종 주소 변수

            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("P-body-location-input").value = addr;
            // 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function (results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.y, result.x);
                    // 지도를 보여준다.
                    mapContainer.style.display = "block";
                   
                    map.relayout();
                    // 지도 중심을 변경한다.
                    map.setCenter(coords);
                    // 마커를 결과값으로 받은 위치로 옮긴다.
                    marker.setPosition(coords)
                }
            });
        }
    }).open();
}