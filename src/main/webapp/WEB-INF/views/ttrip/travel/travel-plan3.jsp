<%@page import="com.ttrip.accom.AccomDomain"%>
<%@page import="java.util.List"%>
<%@page import="com.ttrip.dstnt.domain.DstntDomain"%>
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
<%
    // travel-plan2.jsp에서 전달된 지역 정보
    String region = request.getParameter("region");
    if (region == null || region.isEmpty()) {
        region = "선택된 지역 없음"; // 기본값
    }
 	// Controller에서 전달받은 여행지와 숙소 데이터
    List<DstntDomain> destinations = (List<DstntDomain>) request.getAttribute("destinations"); 
 	List<AccomDomain> accommodations = (List<AccomDomain>) request.getAttribute("accommodations"); 
%>
<!-- 사이드바 영역 -->
<div class="sidebar">
    <h2 id="travel-name"><%= region %></h2>
    <div id="selection-summary">
        <h3>선택한 기간</h3>
        <p id="selected-range"></p>
    </div>

    <div class="tab-menu">
        <button class="tab-link active" onclick="openTab(event, 'location')">장소 선택</button>
        <button class="tab-link" onclick="openTab(event, 'accommodation')">숙소 설정</button>
    </div>
<form id="courseDetail" method="get">
	<input type="hidden" value="<%= region %>" name="region"/>
    <div id="location" class="tab-content active">
        <div class="location-selection">
            <h2>장소 선택</h2>
            <input type="text" placeholder="장소를 검색하세요">
            <ul class="location-list">
                <% if (destinations != null && !destinations.isEmpty()) { %>
                    <% for (DstntDomain dstnt : destinations) { %>
                        <li>
                            <img src="<%= dstnt.getImg() %>" alt="<%= dstnt.getName() %>">
                            <div>
                                <h3><%= dstnt.getName() %></h3>
                                <p><%= dstnt.getDetail() %></p>
                            </div>
                            <button type="button" onclick="addPlaceToDayPrompt('<%= dstnt.getName() %>', '<%= dstnt.getImg() %>')">+</button>
                        </li>
                    <% } %>
                <% } else { %>
                    <p>해당 지역에 등록된 여행지가 없습니다.</p>
                <% } %>
            </ul>
        </div>
    </div>

    <div id="accommodation" class="tab-content">
        <div class="accommodation-selection">
            <h2>숙소 설정</h2>
            <input type="text" placeholder="숙소를 검색하세요">
            <ul class="accommodation-list">
                <% if (accommodations != null && !accommodations.isEmpty()) { %>
                    <% for (AccomDomain accom : accommodations) { %>
                        <li>
                            <div>
                                <h3><%= accom.getName() %></h3>
                                <p><%= accom.getAddr() %></p>
                            </div>
                            <button type="button" onclick="addAccommodationToDayPrompt('<%= accom.getName() %>', 'accommodation.jpg')">+</button>
                        </li>
                    <% } %>
                <% } else { %>
                    <p>해당 지역에 등록된 숙소가 없습니다.</p>
                <% } %>
            </ul>
        </div>
    </div>
    <input type="hidden" name="selectedRange" id="hiddenSelectedRange">
    <input type="hidden" name="selectedDay" id="hiddenSelectedDay">
    <input type="hidden" name="selectedDates" id="hiddenSelectedDates">
    <button type="submit">결과 보기</button>

</form>
    <button id="finalize-button">최종 선택 완료</button>
    
</div>
<div class="main-content">
    <!-- 오른쪽 일정 리스트 -->
    <div class="day-plan-sidebar">
        <!-- 일차별 계획이 동적으로 생성됨 -->
    </div>
    <div class="resize-handle"></div>
</div>

<script>
    // 장소 추가
    function addPlaceToDayPrompt(name, img) {
        const planSidebar = document.querySelector('.day-plan-sidebar');
        const dayDiv = document.createElement('div');
        dayDiv.className = 'day-plan-item';
        dayDiv.innerHTML = `
            <div>
                <img src="${img}" alt="${name}" style="width: 50px; height: 50px;" />
                <span>${name}</span>
                <button type="button" onclick="removeItem(this, '${name}')">X</button>
            </div>`;
        planSidebar.appendChild(dayDiv);

        // 지도에 마커 추가 (선택된 장소)
        addMarkerByName(name);
    }

    // 숙소 추가
    function addAccommodationToDayPrompt(name, img) {
        const planSidebar = document.querySelector('.day-plan-sidebar');
        const accomDiv = document.createElement('div');
        accomDiv.className = 'day-plan-item';
        accomDiv.innerHTML = `
            <div>
                <img src="${img}" alt="${name}" style="width: 50px; height: 50px;" />
                <span>${name} (숙소)</span>
                <button type="button" onclick="removeItem(this, '${name}')">X</button>
            </div>`;
        planSidebar.appendChild(accomDiv);
    }

    // 항목 삭제
    function removeItem(button, name) {
        if (confirm(`${name}을(를) 삭제하시겠습니까?`)) {
            button.parentElement.parentElement.remove();
        }
    }
</script>

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
