<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">


<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">



    <title>서울지도</title>

    <style>
        .area {
            position: absolute;
            background: #fff;
            border: 1px solid #888;
            border-radius: 3px;
            font-size: 12px;
            top: -5px;
            left: 15px;
            padding:2px;
        }

        .info {
            font-size: 12px;
            padding: 5px;
        }
        .info .title {
            font-weight: bold;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
            integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
            crossorigin="anonymous"></script>

</head>
<body>




    <div id="map" style="width:40%;height:500px;"></div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=955d027ad541e959373216700e779cf3"></script>
    <script>
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
                    '   <div class="title">' + area.name + '</div>' +

                    '</div>';

                infowindow.setContent(content);
                infowindow.setPosition(mouseEvent.latLng);
                infowindow.setMap(map);
            });
        }

    </script>


</body>
</html>