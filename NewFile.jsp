<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>지도</title>
    <style>
        /* 지도를 표시할 요소의 크기를 지정합니다. */
        #map {
            height: 800px;
            width: 100%;
        }
    </style>
    
    <link rel="stylesheet" href="resource/css/styles1.css">
    
</head>
<body>

	<header>
		<div id="top">
		<!-- 다운후 변경 -->
			<jsp:include page="loadFile/top.jsp" /> 
			<jsp:include page="loadFile/menuBar.jsp" />
		</div>
	</header>
	
    <h4>지도</h4>
    <!-- 검색창 추가 -->
    <input type="text" id="locationSearch" placeholder="원하시는 위치를 입력하세요" onkeydown="if(event.keyCode==13){searchLocation()}">
    <button onclick="searchLocation()">검색</button>

    <div id="regionButtons"></div>
    
    <div id="map"></div>
    
    <footer>
		<div id="bottom">
			<jsp:include page="loadFile/bottom.jsp" />
		</div>
	</footer>

    <% 
    CinemaDataAccess cinemaDataAccess = new CinemaDataAccess();
    List<Cinema> cinemaList = cinemaDataAccess.getAllCinemaData();
    for (Cinema cinema : cinemaList) {
    %>
    
    <script>
        // Google Maps API 키
        const apiKey = 'AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U'; // 여기에 본인의 Google Maps API 키를 넣어주세요.
        let map;
        let myLocationMarker;
        let infoWindow;
        let allMarkers = []; // 모든 마커를 저장할 배열
        let circle;

        // 검색 함수 정의
        function searchLocation() {
            const locationSearch = document.getElementById('locationSearch').value.toLowerCase();
            // 검색어가 비어있는 경우, 파란 원 안에 있는 마커만 표시
            if (locationSearch == "") {
                showMarkersInsideCircle(circle, allMarkers);
                return;
            }
        }

        // 모든 마커를 숨기고 원 안에 들어오는 마커만 표시하는 함수
        // 검색 함수 정의
        function searchLocation() {
            const locationSearch = document.getElementById('locationSearch').value.toLowerCase();
            // 검색어가 비어있는 경우, 파란 원 안에 있는 마커만 표시
            if (locationSearch === "") {
                showMarkersInsideCircle(circle, allMarkers);
                return;
            }

            // 사용자가 입력한 검색어를 사용하여 마커 필터링
            for (const marker of allMarkers) {
                const cinemaName = marker.getTitle().toLowerCase();
                if (cinemaName.includes(locationSearch)) {
                    marker.setMap(map);
                } else {
                    marker.setMap(null);
                }
            }
        }

     	// 중복을 제거하고 고유한 지역 값을 가져오는 함수
        function getUniqueRegions(cinemaList) {
            const uniqueRegions = [];
            for (const cinema of cinemaList) {
                const region = cinema.getArea1(); // 지역 값 가져오기, 이 부분을 필요한 필드로 변경
                if (!uniqueRegions.includes(region)) {
                    uniqueRegions.push(region);
                }
            }
            return uniqueRegions;
        }
     	// 검색 함수 정의
        function searchLocationByRegion(region) {
            const locationSearch = region.toLowerCase();
            for (const marker of allMarkers) {
                const cinemaRegion = marker.getRegion(); // 마커의 지역 값 가져오기, 이 부분을 필요한 필드로 변경
                if (cinemaRegion.toLowerCase() === locationSearch) {
                    marker.setMap(map);
                } else {
                    marker.setMap(null);
                }
            }
        }
     
        // 내 위치를 변경할 때마다 마커 표시 업데이트
        function updateMarkersOnLocationChange() {
            google.maps.event.addListener(map, 'dragend', function () {
                showMarkersInsideCircle(circle, allMarkers);
            });
        }

     	// 고유한 지역 값을 가져와서 버튼을 생성하는 함수
        function createRegionButtons(cinemaList) {
            const uniqueRegions = getUniqueRegions(cinemaList);
            const regionButtons = document.getElementById('regionButtons');

            uniqueRegions.forEach(region => {
                const button = document.createElement('button');
                button.textContent = region;
                button.addEventListener('click', () => searchLocationByRegion(region));
                regionButtons.appendChild(button);
            });
        }
     
        // Google Maps 초기화 및 내 위치 설정
        function initMap() {
            // 사용자의 현재 위치를 가져오기
            navigator.geolocation.getCurrentPosition((position) => {
                const lat = position.coords.latitude;
                const lng = position.coords.longitude;

                // Google Maps 초기화
                map = new google.maps.Map(document.getElementById('map'), {
                    center: { lat, lng }, // 사용자의 현재 위치로 설정
                    zoom: 17, // 초기 줌 레벨
                });

                // 내 위치를 파란색 마커로 표시
                myLocationMarker = new google.maps.Marker({
                    position: { lat, lng },
                    map: map,
                    title: '내 위치',
                    icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
                });

                // 10km 반경의 원을 생성합니다.
                circle = new google.maps.Circle({
                    strokeColor: '#0000FF', // 원의 테두리 색상 (파란색)
                    strokeOpacity: 0.3, // 테두리 투명도
                    strokeWeight: 1, // 테두리 두께
                    fillColor: '#0000FF', // 원의 내부 채우기 색상 (파란색)
                    fillOpacity: 0.05, // 내부 채우기 투명도
                    map: map,
                    center: { lat, lng }, // 원의 중심 좌표
                    radius: 10000, // 반지름
                });

                // InfoWindow 객체 생성
                infoWindow = new google.maps.InfoWindow();
                
                const lat = <%= cinema.getlocation_y() %>;
                const lng = <%= cinema.getlocation_x() %>;
                const name = "<%= cinema.getName() %>";
                const Area_1 = "<%= cinema.getArea1() %>";
                const Area_2 = "<%= cinema.getArea2() %>";
                const address = "<%= cinema.getAddress() %>";
                const tel = "<%= cinema.getTel() %>";
                const wep = "<%= cinema.getWep() %>";

                // 마커 생성
                const marker = new google.maps.Marker({
                    position: { lat, lng },
                    map: map,
                    title: name, // 마커 제목 설정
                });

                allMarkers.push(marker); // 모든 마커를 배열에 추가

                // 마커를 클릭했을 때 InfoWindow에 정보를 표시
                marker.addListener('click', () => {
                    let content = `<strong>${name}</strong><br>`;
                    content += `주소: ${address}<br>`;
                    content += `전화번호: ${tel}<br>`;
                    content += `홈페이지: <a href="${wep}" target="_blank">${wep}</a><br>`;

                    const markerPosition = marker.getPosition();
                    const myLocation = myLocationMarker.getPosition();
                    const distance = google.maps.geometry.spherical.computeDistanceBetween(markerPosition, myLocation);
                    const formattedDistance = (distance / 1000).toFixed(2); // 거리를 킬로미터 단위로 표시 (소수점 2자리까지)

                    content += `내 위치와의 거리: ${formattedDistance} km`;

                    infoWindow.setContent(content);
                    infoWindow.open(map, marker);
                });
            });

            // 내 위치를 변경할 때마다 마커 표시 업데이트
            updateMarkersOnLocationChange();
        }
        createRegionButtons(cinemaList);
    </script>

    <!-- Google Maps JavaScript API를 로드 -->
    <script async defer
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U&callback=initMap">
    </script>
    <% } %>
</body>
</html>
