<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         info=""
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>제작된 코스 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <!-- 카카오 지도 API 스크립트 추가 -->
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f4b38fb42b57cde2b0919f29b1e7215"></script>
            
    <style type="text/css">

	@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

        body {
            margin: 0;
            padding: 0;
            height: 80%; /* 부모 요소의 높이 지정 */
        }

        #wrap {
            display: flex; /* Flexbox 레이아웃 적용 */
            width: 100%; /* 가로 폭 100% */
            height: 60%;
        }

        .left {
            width: 50%; /* 기본 폭 */
            overflow: auto;
            resize: horizontal; /* 사용자가 크기를 조정할 수 있도록 설정 */
            border-right: 2px solid #567FF2; /* 구분선 추가 */
            min-width: 500px; /* 최소 너비 설정 */
            max-width: 1330px;
        }

        .right {
            flex: 1; /* 남은 공간을 차지하도록 설정 */
            background-color: #d0d0d0;
            overflow: auto;
            border-left: 2px solid #567FF2; /* 구분선 추가 */
        }
        .resizer {
			background-color: #cbd5e0;
			cursor: ew-resize;
			height: 100%;
			width: 2px;
		}
		
		.leftTitle{
			margin-top: 20px;
			margin-left: 15px;
		}
		
		.journyTitle{
			font-size: 30px;
			font-weight: bold;
			color: #567FF2;
			font-family: "Jua", sans-serif;
		}
		
        .detail {
            padding: 10px;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        .btnBox {
            margin-left: 1500px;
            margin-top: 20px;
        }

        .trip-plan {
            display: flex;
            flex-direction: row; /* 일차를 가로로 정렬 */
            gap: 30px; /* 각 일차(day) 사이 간격 */
            padding: 10px;
            overflow-x: auto; /* 가로 스크롤 허용 */
            height: 67vh;
            margin-top: 20px;
        }

        .day {
            display: flex;
            flex-direction: column; /* 각 일정은 세로로 정렬 */
            gap: 20px; /* 일정 간 간격 */
            padding: 20px;
            background-color: #BACCFA;
            border: 3px solid #567FF2;
            border-radius: 10px;
            min-width: 300px; /* 각 일차의 최소 너비 */
        }

        .day-header {
            display: flex;
            justify-content: space-between; /* "n일차"와 날짜를 양쪽 끝에 배치 */
            align-items: center; /* 세로로 중앙 정렬 */
        }

        .day-header h3 {
            margin: 0; /* 여백 제거 */
            font-size: 23px;
            color: #567FF2;
            font-family: jua;
        }

        .day-header .date {
            font-size: 14px;
            color: #666;
        }

        .schedules {
            display: flex;
            flex-direction: column; /* 일정은 세로로 정렬 */
            gap: 15px; /* 일정 간 간격 */
        }

        .schedule {
            position: relative; /* 상대 위치 지정 */
            display: flex;
            align-items: center;
            gap: 15px;
            border: 1px solid #ddd;
            padding: 15px;
            border-radius: 5px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-family: jua;
        }

        /* 동그라미 번호 스타일 추가 */
        .schedule-number {
            position: absolute; /* 절대 위치 지정 */
            top: -10px; /* 상단 여백 */
            left: -10px; /* 좌측 여백 */
            width: 32px; /* 동그라미 크기 */
            height: 32px; /* 동그라미 크기 */
            background-color: #333; /* 배경색 */
            color: #fff; /* 글자색 */
            border-radius: 50%; /* 동그라미 모양 */
            display: flex;
            justify-content: center; /* 중앙 정렬 */
            align-items: center; /* 중앙 정렬 */
            font-size: 12px; /* 글자 크기 */
        }

        /* 1일차 빨간색 */
        .day:nth-child(1) .schedule-number {
            background-color: red;
        }

        /* 2일차 주황색 */
        .day:nth-child(2) .schedule-number {
            background-color: orange;
        }

        /* 3일차 노란색 */
        .day:nth-child(3) .schedule-number {
            background-color: #E6E600;
            color: #000; /* 글자색 */
        }

        /* 4일차 파란색 */
        .day:nth-child(4) .schedule-number {
            background-color: blue;
        }

        .schedule .description {
            flex: 1;
            font-size: 16px;
            color: #333;
        }

        .schedule .schedule-img {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 10px;
        }

		.date{
			font-family: jua;
			color: #567FF2;
		}

        input {
            font-size: 15px;
            border: 3px solid #567FF2;
            border-radius: 15px;
            outline: none;
            padding-left: 10px;
            background-color: #BACCFA;
        }
		
		#courseName{
			width: 220px;
			height: 40px;
			margin-left: 10px;
			color: #567FF2;
			font-family: "Jua", sans-serif;
			font-weight: bold;
		}
		
		input::placeholder {
 	 		color: #fff;
 	 		font-weight: normal;
		}
		
		.detail{
			margin-left: 50px;
		}
		
</style>
<script type="text/javascript">
$(function() {
    $(".backBtn").click(function() {
        if (confirm("작성한 내용은 저장되지 않습니다. 뒤로 가시겠습니까?")) { // 확인 팝업
            window.history.back(); // 올바른 뒤로 가기 메서드 호출
        } else {
            alert("취소");
        }
    });
    
    $(".confirmBtn").click(function() {
        if (confirm("코스를 게시하시겠습니까?")) { // 확인 팝업
            alert("게시 완료되었습니다.");
            $("#travelDetail").submit();
        } else {
            alert("취소");
        }
    });
    
});
    
</script>
    
</head>
<body>
<%	String region = request.getParameter("region"); 
	String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    %>
<form id="travelDetail" action="/td" method="post">
<div id="wrap">
    <div class="left">
    <div class="leftTitle">
        <span class="journyTitle"><%=region %></span>
        <span style="color: #567FF2; font-family: jua" id="selected-range"><%= startDate %> ~ <%= endDate %></span>
    </div>
    <div>
        <input type="text" placeholder="제작된 코스의 제목을 입력해주세요." id="courseName" name="courseName">
    </div>
<div class="trip-plan">
        <%
            // 모든 파라미터 이름을 가져옴
            java.util.Enumeration<String> parameterNames = request.getParameterNames();
            java.util.Map<String, String> dayData = new java.util.HashMap<>();
            int totalDays = 0; // 총 일차 계산용
            
            while (parameterNames.hasMoreElements()) {
                String paramName = parameterNames.nextElement();
                String paramValue = request.getParameter(paramName);

                // dayX_places 또는 dayX_accommodations 형태의 데이터만 처리
                if (paramName.matches("day\\d+_(places|accommodations)")) {
                    dayData.put(paramName, paramValue);

                    // 최대 일차 계산
                    int currentDay = Integer.parseInt(paramName.replaceAll("\\D", ""));
                    totalDays = Math.max(totalDays, currentDay);
                }
            }
			
        	 // 날짜 계산용 SimpleDateFormat 및 Calendar 설정
            java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
            java.util.Calendar calendar = java.util.Calendar.getInstance();

            // startDate를 Calendar 객체로 변환
            java.util.Date parsedStartDate = sdf.parse(startDate);
            calendar.setTime(parsedStartDate);
            
            // 일차별 데이터를 출력
            for (int i = 1; i <= totalDays; i++) {
                String placesKey = "day" + i + "_places";
                String accommodationsKey = "day" + i + "_accommodations";

                if (!dayData.containsKey(placesKey) && !dayData.containsKey(accommodationsKey)) {
                    continue; // 데이터가 없으면 건너뜀
                }
                // 현재 날짜를 포맷팅
                String currentDayDate = sdf.format(calendar.getTime());
        %>
        <div class="day">
            <div class="day-header">
                <h3><%= i %>일차</h3>
                <span class="date"><%= currentDayDate %></span>
            </div>
            <div class="schedules">
                <% 
                    // 장소 출력
                    if (dayData.containsKey(placesKey)) {
                        String[] places = dayData.get(placesKey).split(",");
                        for (String place : places) {
                %>
                <div class="schedule">
                    <div class="schedule-number">여행지</div>
                    <span class="description"><%= place.replaceAll("(방문 예정|숙소 예약|삭제)", "").trim() %></span>
                </div>
                <input type="hidden" name="day<%= i %>_places" value="<%= place.replaceAll("(방문 예정|숙소 예약|삭제)", "").trim() %>">
                <% 
                        }
                    }

                    // 숙소 출력 (마지막 날은 출력 제외)
                    if (i != totalDays && dayData.containsKey(accommodationsKey)) {
                        String[] accommodations = dayData.get(accommodationsKey).split(",");
                        for (String accommodation : accommodations) {
                %>
                <div class="schedule">
                    <div class="schedule-number">숙소</div>
                    <span class="description"><%= accommodation.replaceAll("(방문 예정|숙소 예약|삭제)", "").trim() %></span>
                </div>
                <input type="hidden" name="day<%= i %>_accommodations" value="<%= accommodation.replaceAll("(방문 예정|숙소 예약|삭제)", "").trim() %>">
                <% 
                        }
                    } 
                %>
            </div>
        </div>
        <% // 날짜를 하루 증가
        calendar.add(java.util.Calendar.DATE, 1);
        } %>
        <input type="hidden" name="totalDays" value="<%= totalDays %>">
    </div>
   
</div>

	<div class="resizer" id="dragMe"></div>

    <div class="right">
        <div id="map" style="width: 100%; height: 82vh; float: right;"></div>

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
    </div>
</div>
<div class="detail">
    <h3 class="detailTitle" style="padding-top: 20px; font-family: jua; color: #567FF2">상세 내용</h3>
    <input type="text" name="comment" placeholder="코스에 대한 상세 내용을 입력해주세요." style="width: 1700px; height: 150px"><br>
    <div class="btnBox">
    	<input type="button" value="뒤로" class="backBtn"
               style="background-color: #ff0000; color: #fff; border-radius: 7px; width: 90px; height: 40px; border: none;">
    	<input type="button" value="저장하기" class="confirmBtn"
               style="background-color: #333; color: #fff; border-radius: 7px; width: 90px; height: 40px; border: none;">
	</div>
</div>
</form>
</body>
</html>
