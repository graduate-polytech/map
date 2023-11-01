<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="DB.*" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
    <meta charset="UTF-8">
    <title>지도</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <!-- Bootstrap 5 JavaScript 링크 추가 -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
  	rel="stylesheet">
  	<link rel="stylesheet" href="resource/css/styles1.css">
    <style>
        #map {
            height: 800px;
            width: 100%;
        }
        .info-window {
            width: 80px;
        }
        .info-window h1 {
            font-size: 10px;
            margin: 5px 0;
        }
        .info-window p {
        	font-size: 8px;
            margin: 5px 0;
        }
        .info-window a {
            text-decoration: none;
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
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCFWttU33_ZQvbz5cU1vdkdtcyPL2Tr53U&callback=initMap&libraries=geometry"></script>
</header>

<div style="display: flex;
    width: 20%;
    margin-left: 10%;
    align-items: center;">
    <input type="text" id="markerSearch" placeholder="Google 지도 검색" style="width: 75%;" onkeydown="if(event.keyCode==13){Search()}">
    <button onclick="Search()" style="width: 25%;">검색</button>
</div>

<div id="map" style="width: 80%;  margin: 0 auto;"></div>
<footer>
    <div id="bottom">
        <jsp:include page="loadFile/bottom.jsp" />
    </div>
</footer>
<%
CinemaDataAccess2 cinemaDataAccess2 = CinemaDataAccess2.createInstance();
%>
    <script>
    window.onload = function () {
        getCurrentLocation(initMap);
    };
    var markers = [];
	var map;
	var NameList = <%
	List<Cinema2> NameList = cinemaDataAccess2.getAllCinema2Data();
	out.print("[");
	for (int i = 0; i < NameList.size(); i++) {
    	if (i > 0) {
        	out.print(",");
    	}
    	out.print("\"" + NameList.get(i).getName() + "\"");
	}
	out.print("]");
	%>;

	var AddressList = <%
	List<Cinema7> AddressList = cinemaDataAccess2.getAllCinema7Data();
	out.print("[");
	for (int i = 0; i < AddressList.size(); i++) {
    	if (i > 0) {
        	out.print(",");
    	}
    	out.print("\"" + AddressList.get(i).getAddress() + "\"");
	}
	out.print("]");
	%>;

	var Area_1List= <%
	List<Cinema3> Area_1List = cinemaDataAccess2.getAllCinema3Data();
	out.print("[");
	for (int i = 0; i < Area_1List.size(); i++) {
    	if (i > 0) {
        	out.print(",");
    	}
    	out.print("\"" + Area_1List.get(i).getArea1() + "\"");
	}
	out.print("]");
	%>;

	var Area_2List= <%
	List<Cinema4> Area_2List = cinemaDataAccess2.getAllCinema4Data();
	out.print("[");
	for (int i = 0; i < Area_2List.size(); i++) {
    	if (i > 0) {
        	out.print(",");
    	}
    	out.print("\"" + Area_2List.get(i).getArea2() + "\"");
	}
	out.print("]");
	%>;
	
	
	function getCurrentLocation(callback) {
    	if (navigator.geolocation) {
        	navigator.geolocation.getCurrentPosition(function (position) {
            	var userLocation = {
                	lat: position.coords.latitude,
                	lng: position.coords.longitude
            	};
            	callback(userLocation);
        	});
    	} else {
        	console.error("브라우저에서 Geolocation을 지원하지 않습니다.");
        	// 기본 위치 또는 기타 대체 로직을 사용할 수 있습니다.
    	}
	}
	function initMap(userLocation) {
		var infoWindow = new google.maps.InfoWindow();
		// userCircle 변수를 initMap 함수 내에서 초기화
	
    	var userCircle = new google.maps.Circle({
        	center: userLocation,
        	radius: 5000
    	});
    	var cinema5List = <%
        	List<Cinema5> X_List = new CinemaDataAccess2().getAllCinema5Data();
        	out.print("[");
        	for (int i = 0; i < X_List.size(); i++) {
            	if (i > 0) {
                	out.print(",");
            	}
            	out.print(X_List.get(i).getLocation_x());
        	}
        out.print("]");
    	%>;
    
    	var cinema6List = <%
        	List<Cinema6> Y_List = new CinemaDataAccess2().getAllCinema6Data();
    
        	out.print("[");
        	for (int i = 0; i < Y_List.size(); i++) {
            	if (i > 0) {
                	out.print(",");
            	}
            	out.print(Y_List.get(i).getLocation_y());
        	}
        out.print("]");
    	%>;
    	var TelList = <%
    	List<Cinema8> TelList = cinemaDataAccess2.getAllCinema8Data();
    	out.print("[");
    	for (int i = 0; i < TelList.size(); i++) {
        	if (i > 0) {
            	out.print(",");
        	}
        	out.print("\"" + TelList.get(i).getTel() + "\"");
    	}
    	out.print("]");
		%>;

		var WepList = <%
    		List<Cinema9> WepList = cinemaDataAccess2.getAllCinema9Data();
    		out.print("[");
    	for (int i = 0; i < WepList.size(); i++) {
        	if (i > 0) {
            	out.print(",");
        	}
        	out.print("\"" + WepList.get(i).getWep() + "\"");
    	}
    	out.print("]");
		%>;
		// 변환된 좌표 데이터를 초기화합니다.
    	var locations = []; //좌표
    	var locationsinfo = [];// 좌표의 정보
    	var userCircle;
    	for (var i = 0; i < cinema5List.length; i++) {
        	var location = { x: parseFloat(cinema5List[i]), y: parseFloat(cinema6List[i]) };
        	var locationinfo = 
        		{
        		name : NameList[i],
        		area1 : Area_1List[i],
        		area2 : Area_2List[i],
        		x: parseFloat(cinema5List[i]), y: parseFloat(cinema6List[i]),
        		address : AddressList[i],
        		tel : TelList[i],
        		wep : WepList[i]
        		};//좌표 정보
        	locations.push(location);
        	locationsinfo.push(locationinfo);
    	}

    	map = new google.maps.Map(document.getElementById('map'), {
        	center: userLocation,
        	zoom: 14 // 초기 줌 레벨
    	});
    	var userMarker = new google.maps.Marker({
        	position: userLocation,
        	map: map,
        	icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png' // 파란색 아이콘 URL
    	});
    	// 마커 표시
    	for (var i = 0; i < locations.length; i++) {
        	var marker = new google.maps.Marker({
            	position: { lng: locations[i].x, lat: locations[i].y },
            	map: map
        	});
        	marker.set("name", locationsinfo[i].name || '');
        	marker.set("address", locationsinfo[i].address || '');
        	marker.set("tel", locationsinfo[i].tel || '');
        	marker.set("wep", locationsinfo[i].wep || '');
        
     		// 마커를 클릭했을 때 이벤트 핸들러를 추가합니다.
        	marker.addListener('click', function () {
            	// 현재 마커의 정보를 가져옵니다.
            	var name = this.get("name") || '';
        		var address = this.get("address") || '';
        		var tel = this.get("tel") || '';
        		var wep = this.get("wep") || '';
        	
        		var markerPosition = this.getPosition();
            	var userMarkerPosition = userMarker.getPosition();
            	var distance = google.maps.geometry.spherical.computeDistanceBetween(markerPosition, userMarkerPosition);

        		var content = '<h1>' + name + '</h1>' + '<p>주소: ' + address + '</p>';
            	if (tel) {
                	content += '<p>전화번호: ' + tel + '</p>';
            	}
            	if (wep) {
                	content += '<p>웹사이트: <a href="' + wep + '" target="_blank">' + wep + '</a></p>';
            	}
            	content += '<p>현재 나와의 거리: ' + (distance / 1000).toFixed(2) + ' km</p>';
            	// InfoWindow에 정보를 표시합니다.
            	infoWindow.setContent(content);
            	// InfoWindow를 현재 클릭한 마커의 위치에 열고 표시합니다.
            	infoWindow.open(map, this);
        	});
        	markers.push(marker);
     		// 이 함수를 호출하여 원 밖의 마커를 숨깁니다.
        	hideMarkersOutsideRadius(markers, userCircle);
    	}
    	userCircle = new google.maps.Circle({
        	strokeColor: 'blue',
        	strokeOpacity: 0.1,
        	strokeWeight: 2,
        	fillColor: 'blue',
        	fillOpacity: 0.1,
        	map: map,
        	center: userLocation,
        	radius: 5000
    	});
	}
	initMap();
	function hideMarkersOutsideRadius(markers, userCircle) {
    	var userCircleCenter = userCircle.getCenter();
    	var userCircleRadius = userCircle.getRadius();

    	for (var i = 0; i < markers.length; i++) {
        	var marker = markers[i];
        	var markerPosition = marker.getPosition();

        	var distance = google.maps.geometry.spherical.computeDistanceBetween(markerPosition, userCircleCenter);

        	// 만약 마커와 유저 위치 간의 거리가 원의 반경보다 크다면 해당 마커를 숨깁니다.
        	if (distance > userCircleRadius) {
            	marker.setVisible(false);
        	} else {
            	marker.setVisible(true);
        	}
    	}
	}
	function Search() {
	    var searchKeyword = document.getElementById("markerSearch").value.toLowerCase();
	    for (var i = 0; i < markers.length; i++) {
	        var marker = markers[i];
	        var markerName = marker.get("name") || '';
	        var markerArea1 = marker.get("area1") || '';
	        var markerArea2 = marker.get("area2") || '';
	        var markerAddress = marker.get("address") || '';

	        // 검색어가 마커의 이름, 지역 1, 지역 2, 또는 주소에 포함되면 해당 마커 표시
	        if (markerName.toLowerCase().includes(searchKeyword) || 
	            markerArea1.toLowerCase().includes(searchKeyword) || 
	            markerArea2.toLowerCase().includes(searchKeyword) || 
	            markerAddress.toLowerCase().includes(searchKeyword)) {
	            marker.setVisible(true);
	        } else {
	            marker.setVisible(false);
	        }
	    }
	}
	function clearSearch() {
	    document.getElementById("markerSearch").value = "";
	    Search();
	}
	function filterMarkers(area) {
	    for (var i = 0; i < markers.length; i++) {
	        var marker = markers[i];
	        var markerArea1 = marker.get("area1") || '';
	        if (markerArea1 === area) {
	            marker.setVisible(true);
	        } else {
	            marker.setVisible(false);
	        }
	    }
	}

</script>
</body>
</html>