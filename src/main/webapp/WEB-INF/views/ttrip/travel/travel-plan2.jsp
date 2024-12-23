<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Custom Date and Time Picker</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ttrip/travel/css/travel-plan2.css">
    <!-- 카카오 지도 API 스크립트 추가 -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f4b38fb42b57cde2b0919f29b1e7215"></script>
</head>
<body>
<%
    // 전달된 지역 정보를 가져옵니다.
    String regionId = request.getParameter("regionId");
    if (regionId == null || regionId.isEmpty()) {
        regionId = "선택된 지역 없음"; // 기본값
    }
%>
<div class="sidebar">
    <strong id="trip_grand"><%= regionId %></strong>

    <div class="date-picker-container">
        <input type="date" id="start-date" class="date-input">
        ~
        <input type="date" id="end-date" class="date-input">
    </div>

    <div class="time-selection" id="time-selection">
        <!-- 시간이 선택되면 표시될 영역 -->
    </div>
	<form action="tr3" method="GET">
        <!-- 지역 값을 Hidden Field로 전달 -->
        <input type="hidden" name="regionId" value="<%= regionId %>">
    <button id="complete-button" class="hidden">시간 설정 완료</button>
    </form>
</div>

<!-- 메인 콘텐츠 영역 -->
<div id="map" style="width: 80%; height: 100vh; float: right;"></div>

<script src="${pageContext.request.contextPath}/ttrip/travel/js/travel-plan2.js"></script>
<script src="${pageContext.request.contextPath}/ttrip/common/Authorization.js"></script>
<script>
    // 카카오 지도 API 초기화
    var mapContainer = document.getElementById('map'); // 지도를 표시할 div
    var mapOption = {
        center: new kakao.maps.LatLng(37.5665, 126.9780), // 지도의 중심좌표 (서울 시청 좌표)
        level: 3 // 지도의 확대 레벨
    };

    // 지도 생성
    var map = new kakao.maps.Map(mapContainer, mapOption);

    // 지도에 마커를 표시하는 함수
    function addMarker(lat, lng) {
        var markerPosition = new kakao.maps.LatLng(lat, lng);
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);
    }
</script>
</body>
</html>
