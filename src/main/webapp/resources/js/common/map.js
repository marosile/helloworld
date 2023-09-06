function getCurrentPosBtn() {
    if (navigator.geolocation) {
        // 위치 정보를 가져옵니다.
        navigator.geolocation.getCurrentPosition(function (position) {
            var latitude = position.coords.latitude; // 위도
            var longitude = position.coords.longitude; // 경도

            // TODO: 위도와 경도를 이용하여 주소를 가져오는 함수 호출
            getAddressFromCoords(latitude, longitude);
        });
    } else {
        alert("브라우저가 Geolocation을 지원하지 않습니다.");
    }
}

function getAddressFromCoords(latitude, longitude) {
    var geocoder = new kakao.maps.services.Geocoder();
    geocoder.coord2Address(longitude, latitude, function (result, status) {
        if (status === kakao.maps.services.Status.OK) {
            var address = result[0].address.address_name;

            // 주소를 화면에 표시하거나 다른 작업을 수행하세요.
            alert("현재 위치의 주소: " + address);
        } else {
            alert("주소를 가져오는데 실패했습니다.");
        }
    });
}