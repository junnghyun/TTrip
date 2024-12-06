<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place and Accommodation Selector</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/ttrip/travel/css/travel-plan3.css">
    <!-- 카카오 지도 API 스크립트 추가 -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f4b38fb42b57cde2b0919f29b1e7215"></script>
</head>
<body>
<!-- 사이드바 영역 -->
<div class="sidebar">
    <h2 id="travel-name">인천</h2>
    <div id="selection-summary">
        <h3>선택한 기간</h3>
        <p id="selected-range"></p>
    </div>

    <div class="tab-menu">
        <button class="tab-link active" onclick="openTab(event, 'location')">장소 선택</button>
        <button class="tab-link" onclick="openTab(event, 'accommodation')">숙소 설정</button>
    </div>

    <div id="location" class="tab-content active">
        <div class="location-selection">
            <h2>장소 선택</h2>
            <input type="text" placeholder="장소를 검색하세요">
            <ul class="location-list">
                <li>
                    <img src="example1.jpg" alt="장소 이미지">
                    <div>
                        <h3>인천 차이나타운</h3>
                        <p>문화거리 | 차이나타운 거리</p>
                    </div>
                    <button onclick="addPlaceToDayPrompt('인천 차이나타운', 'example1.jpg')">+</button>
                </li>
                <li>
                    <img src="example2.jpg" alt="장소 이미지">
                    <div>
                        <h3>월미공원</h3>
                        <p>역사적인 장소 | 월미산 정상</p>
                    </div>
                    <button onclick="addPlaceToDayPrompt('월미공원', 'example2.jpg')">+</button>
                </li>
            </ul>
        </div>
    </div>

    <div id="accommodation" class="tab-content">
        <div class="accommodation-selection">
            <h2>숙소 설정</h2>
            <input type="text" placeholder="숙소를 검색하세요">
            <ul class="accommodation-list">
                <li>
                    <div>
                        <h3>네스트 호텔</h3>
                        <p>인천 영종도 | 바다 전망</p>
                    </div>
                    <button onclick="addAccommodationToDayPrompt('네스트 호텔', 'hotel1.jpg')">+</button>
                </li>
                <li>
                    <div>
                        <h3>파라다이스시티</h3>
                        <p>럭셔리 호텔 | 엔터테인먼트</p>
                    </div>
                    <button onclick="addAccommodationToDayPrompt('파라다이스시티', 'hotel2.jpg')">+</button>
                </li>
            </ul>
        </div>
    </div>

    <button id="finalize-button">최종 선택 완료</button>
</div>
<div class="main-content">
    <!-- 오른쪽 일정 리스트 -->
    <div class="day-plan-sidebar">
        <!-- 일차별 계획이 동적으로 생성됨 -->
    </div>
    <div class="resize-handle"></div>
</div>

<!-- 메인 콘텐츠 영역 -->
<div id="map" style="width: 70%; height: 100vh; float: right;"></div>

<script src="${pageContext.request.contextPath}/ttrip/travel/js/travel-plan3.js"></script>
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
