<%@page import="com.nimbusds.jose.shaded.gson.JsonArray"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.ttrip.tripboard.TripBoardServiceImpl"%>
<%@page import="com.ttrip.tripboard.TripBoardService"%>
<%@page import="com.ttrip.dstnt.domain.DstntDomain"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Arrays"%>
<%@page import="net.minidev.json.JSONArray"%>
<%@page import="net.minidev.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 경로 상세 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!-- 카카오 지도 API 스크립트 추가 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f4b38fb42b57cde2b0919f29b1e7215"></script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');

.top{
	width: 80%;
	text-align: center;
	font-weight: bold;
	margin: 30px auto;
}

.top h2{
	font-size: 50px;
}

.btn1{
	margin-left: 250px;
}

.goodFrm{
    position: relative; /* 위치 조정을 위한 relative */
	top: 20px;
}

.btn2 {
    background: url('/ttrip/travel/images/btn_report.png') no-repeat;
    float: right;
    margin-right: 250px;
    width: 40px;
    height: 40px;
    border: none;
    position: relative; /* 위치 조정을 위한 relative */
    top: -10px; /* 위로 이동 */
}

.top2{
	margin-top: 30px;
}


hr {
    width: 80%; /* 너비를 부모 요소의 100%로 설정 */
    border: none; /* 기본 선 제거 */
    border-top: 1px solid #808080; /* 선 스타일 설정 */
    margin: 50px auto; /* 상하 간격 설정 */
    padding: 0; /* 여백 제거 */
}

.middle{
	width: 80%;
	margin: 30px auto; /* 상하 간격 설정 */
}

.cont{
	margin-top: 20px;
	font-family: "Jua", sans-serif;
	font-size: 25px;
}

#map {
    width: 1300px;
    height: 800px;
    margin: 50px auto; /* 수평 가운데 정렬 */
    display: block; /* 가운데 정렬을 위해 블록 요소로 설정 */
    border: 1px solid #ddd; /* 시각적 확인용 테두리 (필요시 제거) */
}

.detail{
	background-color: #F3F2F2;
	height: 1150px;
	width: 1300px;
	margin: 0px auto;
}

.dayBtn{
	border: 5px solid #567FF2;
	border-radius: 10px;
	background-color: #fff;
	width: 250px;
	height: 50px;
	margin-top: 50px;
	font-size: 22px;
	font-weight: bold;
}

/* 선택된 이미지 스타일 */
.dayBtn.selected {
    filter: brightness(80%); /* 이미지 밝기 조절 */
    transform: scale(1); /* 약간 확대 효과 */
    border: 5px solid #567FF2;
    
}

.dayBtnBox{
	text-align: center;
}

/* 기본 이미지 스타일 */
.dayImg {
    width: 150px;
    height: 150px;
    cursor: pointer; /* 클릭 가능한 커서 */
    transition: all 0.3s ease; /* 애니메이션 효과 */
    border: 3px solid #567FF2;
    border-radius: 10px;
}

/* 선택된 이미지 스타일 */
.dayImg.selected {
    filter: brightness(40%); /* 이미지 밝기 조절 */
    transform: scale(1.1); /* 약간 확대 효과 */
    border: 3px solid #567FF2;
    
}

.imgBox{
	text-align: center;
	margin-top: 30px;
	display: flex; /* Flexbox 사용 */
	justify-content: center; /* 가로 가운데 정렬 */
	gap:200px;
}

.imgDetail{
	background-color: #fff;
	width: 70%;
	margin: 20px auto;
	height: 800px;
	text-align: center;
	padding: 50px;
	border: 5px solid #567FF2;
	border-radius: 10px;
}

.detailImg{
	width: 400px;
	height: 500px;
	margin-top: 50px;
}

.replyBox{
	width: 1300px;
	height: 150px;
	background-color: #F3F2F2;
	margin: 10px auto;
	text-align: center;
	padding: 20px;
	margin-bottom: 100px;
}

.inputReply{
	width: 1150px;
	height: 60px;
	font-size: 15px;
}

.replyBtn{
	background-color: #13294B;
	color: #fff;
	border-radius: 5px;
	width: 60px;
	height: 30px;
	font-size: 15px;
}

.reply{
	width: 1300px;
	margin: 10px auto;
	border-bottom: 1px solid #808080;
	padding: 15px;
}

.replyReportBtn {
    background: url('/ttrip/travel/images/replyReportBtn.png') no-repeat;
    float: right;
    margin-right: 20px;
    width: 40px;
    height: 40px;
    border: none;
    position: relative; /* 위치 조정을 위한 relative */
    top: -10px; /* 위로 이동 */
}

.replyGoodBtn{
	background: url('/ttrip/travel/images/reply_good_btn.png') no-repeat;
	width: 30px;
    position: relative;
    top: 10px;
}

.userImg{
	width: 50px;
    height: 50px;
	border-radius: 50%;
}

.userId{
	margin-left: 60px;
}

/* 전체 컨테이너 스타일 */
#dayContent {
    margin-top: 20px;
    font-family: jua;
}

/* 각 일차 정보 섹션 스타일 */
.dayDetail {
    border: 1px solid #ddd;
    border-radius: 10px;
    padding: 20px;
    margin: 20px auto;
    max-width: 900px;
    background-color: #f9f9f9;
}

/* 일차 제목 스타일 */
.dayTitle {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
}

/* 여행지와 숙소를 가로로 정렬하는 컨테이너 */
.detailContainer {
    display: flex;
    justify-content: space-between;
    gap: 20px;
}

/* 여행지 및 숙소 섹션 스타일 */
.placesSection,
.accommodationsSection {
    flex: 1; /* 동일한 너비로 확장 */
    text-align: center;
}

/* 섹션 제목 스타일 */
.placesSection h4,
.accommodationsSection h4 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 15px;
}

/* 리스트 컨테이너를 가로 정렬 */
.placesList,
.accommodationsList {
    display: flex;
    /* flex-wrap: wrap; /* 항목이 많을 경우 다음 줄로 넘김 */ 
    justify-content: center; /* 항목을 가운데 정렬 */
    gap: 8px; /* 항목 간 간격 */
}

/* 리스트 아이템 스타일 */
.placeItem,
.accommodationItem {
    background-color: #567FF2;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 20px;
    font-weight: bold;
    min-width: 100px; /* 최소 너비 설정 */
    text-align: center;
    width: 250px;
}

/* 비어 있을 때의 메시지 스타일 */
.emptyMessage {
    color: #808080;
    font-size: 14px;
    font-style: italic;
    margin-top: 10px;
}

.dynamicDiv {
    display: flex;
    flex-direction: column;
    align-items: center; /* 가로 방향 가운데 정렬 */
    justify-content: center; /* 세로 방향 가운데 정렬 */
    margin: 10px 0;
    padding: 20px;
    background-color: #fff;
    border: 1px solid #00796b;
    border-radius: 10px; /* 테두리 둥글게 */
    text-align: center; /* 텍스트 가운데 정렬 */
}
.dynamicDiv img {
    max-width: 100%; /* 이미지 크기 제한 */
    height: auto;
    margin-top: 10px; /* 텍스트와 이미지 간격 */
    border-radius: 5px; /* 이미지 모서리 둥글게 */
}

</style>

<script type="text/javascript">
$(function() {
    // 초기 버튼 스타일 설정
    $(".btn1, .replyGoodBtn").each(function() {
        $(this).css({
            "background": "url('/ttrip/travel/images/btn_good.png') no-repeat",
            "background-size": "contain", "width": "25px", "height": "25px", "border": "none", "cursor": "pointer"          
        });
    });

    // 게시물 좋아요 버튼 클릭 이벤트
    $(".btn1").click(function() {
        const currentBackground = $(this).css("background-image");
        if (currentBackground.includes("btn_good.png")) {
            // 빨간 하트로 변경
            $(this).css({
                "background": "url('/ttrip/travel/images/btn_good_red.png') no-repeat",
                "background-size": "contain", "width": "25px", "height": "25px"
            });
        } else {
            // 원래 이미지로 복구
            $(this).css({
                "background": "url('/ttrip/travel/images/btn_good.png') no-repeat",
                "background-size": "contain", "width": "25px", "height": "25px"
            });
        }
    });
    
    // 댓글 좋아요 버튼 클릭 이벤트
    $(".replyGoodBtn").click(function() {
        const currentBackground = $(this).css("background-image");
        if (currentBackground.includes("btn_good.png")) {
            $(this).css({
                "background": "url('/ttrip/travel/images/btn_good_red.png') no-repeat",
                "background-size": "contain", 
                "width": "25px", 
                "height": "25px"
            });
        } else {
            $(this).css({
                "background": "url('/ttrip/travel/images/btn_good.png') no-repeat",
                "background-size": "contain", 
                "width": "25px", 
                "height": "25px"
            });
        }
    });
    
    // 게시물 신고버튼 클릭 시 신고 confirm
    $(".btn2").click(function() {
        if (confirm("신고하시겠습니까?")) { // 확인 팝업
           alert("신고 완료되었습니다.");
        }else{
        	alert("취소");
        }
    });
    
 	// 댓글 신고버튼 클릭 시 신고 confirm
    $(".replyReportBtn").click(function() {
        if (confirm("신고하시겠습니까?")) { // 확인 팝업
           alert("신고 완료되었습니다.");
        }else{
        	alert("취소");
        }
    });
    
    // dayImg 클릭 이벤트
    $(".dayImg").click(function() {
        // 모든 이미지를 초기화
        $(".dayImg").removeClass("selected");

        // 현재 클릭된 이미지에 'selected' 클래스 추가
        $(this).addClass("selected");
    });

    
});
</script>

</head>
<body>
<%@include file ="../common/header.jsp" %>
<div id="wrap">
    <div class="top">
	<%
	
        String courseName = request.getParameter("courseName");
        String comment = request.getParameter("comment");
        int totalDays = Integer.parseInt(request.getParameter("totalDays"));
        String region = request.getParameter("region");
        
        Map<Integer, List<String>> placesMap = new HashMap<>();
        Map<Integer, List<String>> accommodationsMap = new HashMap<>();

        for (int i = 1; i <= totalDays; i++) {
            String[] places = request.getParameterValues("day" + i + "_places");
            String[] accommodations = request.getParameterValues("day" + i + "_accommodations");

            if (places != null) {
                placesMap.put(i, Arrays.asList(places));
            }
            if (accommodations != null) {
                accommodationsMap.put(i, Arrays.asList(accommodations));
            }
        }

        request.setAttribute("placesMap", placesMap);
        request.setAttribute("accommodationsMap", accommodationsMap);
    %>
    
        <h2 style="font-family: Jua, sans-serif;"><%= courseName != null ? courseName : "코스 이름 없음" %></h2>
        <span style="font-family: Jua, sans-serif; font-size: 25px;"><%=region %></span>
     <%-- <%
    // 두 번째 JSP에서 전달된 데이터 받기
    String destinationsJson = request.getParameter("destinations");

    if (destinationsJson != null && !destinationsJson.isEmpty()) {
        try {
            // JSON 배열에서 양쪽 대괄호 제거
            destinationsJson = destinationsJson.trim();
            if (destinationsJson.startsWith("[") && destinationsJson.endsWith("]")) {
                destinationsJson = destinationsJson.substring(1, destinationsJson.length() - 1);
            }

            // 각 JSON 객체를 분리 (},{ 기준으로 분리)
            String[] destinationItems = destinationsJson.split("\\},\\{");

            for (int i = 0; i < destinationItems.length; i++) {
                String item = destinationItems[i];

                // 첫 번째와 마지막 객체의 중괄호 처리
                if (i == 0) item = item.startsWith("{") ? item.substring(1) : item;
                if (i == destinationItems.length - 1) item = item.endsWith("}") ? item.substring(0, item.length() - 1) : item;

                // "name":"값"과 "detail":"값"을 추출
                String name = null, detail = null;
                if (item.contains("\"name\":\"")) {
                    name = item.split("\"name\":\"")[1].split("\",")[0];
                }
                if (item.contains("\"detail\":\"")) {
                    detail = item.split("\"detail\":\"")[1].split("\"")[0];
                }

                // 출력
                out.println("Name: " + (name != null ? name : "N/A") + "<br>");
                out.println("Detail: " + (detail != null ? detail : "N/A") + "<br><br>");
            }
        } catch (Exception e) {
            out.println("Error parsing JSON data: " + e.getMessage());
        }
    } else {
        out.println("No destinations received.");
    }
%> --%>
        
    </div>

    <div class="top2">
        <form name="goodFrm" class="goodFrm">
            <input type="button" class="btn1">
            <span style="color: #808080">30</span>
        </form>
        <form name="reportFrm">
            <input type="button" class="btn2">
        </form>
    </div>

<hr>

<div class="middle">
<div class="cont"><%= comment %>
</div>

<!-- 지도 영역 -->
<div id="map"></div>
<script src="${pageContext.request.contextPath}/ttrip/travel/js/travel-plan2.js"></script>
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
    var markerPosition  = new kakao.maps.LatLng(lat, lng); 
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });
    marker.setMap(map);
}

</script>
<div class="detail">
    <div class="dayBtnBox">
        <% for (int i = 1; i <= totalDays; i++) { %>
    <button class="dayBtn" style="font-family: Jua, sans-serif;" id="dayBtn" data-day="<%=i %>"><%= i %>일차</button>
    
<% } %>

</div>
  <!-- 일정 표시 영역 -->
<div id="dayContent">
    <%
    for (int i = 1; i <= totalDays; i++) {
        List<String> places = placesMap.get(i);
        List<String> accommodations = accommodationsMap.get(i);
    %>
        <div class="dayDetail" data-day="<%= i %>" style="display: none; font-family: jua;">
            <h3 class="dayTitle" style="font-family: Jua, sans-serif;"><%= i %>일차 상세 정보</h3>
            <div class="detailContainer">
                <div class="placesSection">
                    <h4 style="font-family: Jua, sans-serif;">여행지</h4>
                    <% if (places != null && !places.isEmpty()) { %>
                        <div class="placesList">
                            <% for (String place : places) { %>
                                <div class="placeItem" style="font-family: jua;" onclick="addDynamicDiv('<%=place %>')"><%= place %></div>
                            <% } %>
                        </div>
                    <% } else { %>
                        <p class="emptyMessage">등록된 여행지가 없습니다.</p>
                    <% } %>
                </div>
                <% if (i != totalDays) { %> <!-- 마지막 일차가 아닌 경우에만 숙소 출력 -->
                <div class="accommodationsSection">
                    <h4 style="font-family: Jua, sans-serif;">숙소</h4>
                    <% if (accommodations != null && !accommodations.isEmpty()) { %>
                        <div class="accommodationsList">
                            <% for (String accommodation : accommodations) { %>
                                <div class="accommodationItem" style="font-family: Jua, sans-serif;" onclick="addDynamicDiv('<%=accommodation %>')"><%= accommodation %></div>
                            <% } %>
                        </div>
                    <% } else { %>
                        <p class="emptyMessage">등록된 숙소가 없습니다.</p>
                    <% } %>
                </div>
                <% } %>
                
            </div>
        </div>
    <%
    }
    %>
</div>
    <!-- 동적 <div>가 추가될 컨테이너 -->
    <div id="dynamicContainer"></div>
</div>
</div>
<%-- <%
    // 데이터를 수신
    String destinationsJson = request.getParameter("destinations");

    // 디버깅용 로그
    System.out.println("Received destinationsJson in travel_detail.jsp: " + destinationsJson);

    // 브라우저에 응답
    response.getWriter().write("Received destinations successfully: " + destinationsJson);
%>
 <pre><%= destinationsJson %></pre> --%>
    
<script type="text/javascript">
$(document).ready(function () {
	console.log("DOM 로드 완료");
    // 'dayBtn' 클래스 버튼 클릭 이벤트
    $(".dayBtn").on("click", function () {
        const day = $(this).data("day"); // 현재 버튼의 data-day 값 가져오기
        console.log("클릭된 day:", day); // 디버깅용 로그

        // 모든 버튼에서 선택 효과 제거
        $(".dayBtn").removeClass("selected");

        // 현재 클릭된 버튼에 'selected' 클래스 추가
        $(this).addClass("selected");

        // 모든 일차 데이터를 숨기고 선택된 데이터만 표시
         $("#dayContent > div").hide();
         console.log($("#dayContent > div"));
        const target = $("#dayContent > div[data-day='"+day+"']");
        console.log($("#dayContent > div[data-day='"+day+"']")); // 해당 요소가 선택되는지 확인
	    if (target.length > 0) {
	        target.css("display", "block");
	    } else {
	        console.error("해당 데이터를 찾을 수 없습니다:", day);
	    }

    }); 
    
    $("#dayContent > div").each(function() {
        console.log($(this).data("day")); // 각 요소의 data-day 값 출력
    });

    
});

function addDynamicDiv(place) {
    // 하단 영역 선택
    const container = document.getElementById('dynamicContainer');

    // 기존 내용 초기화
    container.innerHTML = '';

    // 새 div 생성
    const newDiv = document.createElement('div');
    newDiv.className = 'dynamicDiv';
    newDiv.innerHTML = '<h2><strong>' + place + '</strong></h2>' + '<img src="ttrip/dstnt/images/'+place+'.jpg">';

    // 하단에 추가
    container.appendChild(newDiv);
}



</script>

</div>

<div class="replyBox">
<input type="text" placeholder="소중한 댓글을 남겨주세요" class="inputReply"><br>
<input type="button" value="등록" class="replyBtn" style="margin-left: 1100px; margin-top: 20px;">
</div>

<!-- <div class="reply">

<img alt="회원" src="/ttrip/travel/images/user.jpg" class="userImg">
<span>대부도 서울서 가까워서 가족끼리 바람쐬러 가기 좋아요.</span><br>
<span class="userId">바*렛 | 2024.12.2</span>
<input type="button" class="replyReportBtn">
<input type="button" class="replyGoodBtn">

</div>

<div class="reply">

<img alt="회원" src="/ttrip/travel/images/user.jpg" class="userImg">
<span>대부도에 복합문화시설은 가족들이랑 같이 방문하기 좋더라구요. 아이들 체험 기회도 많고 미술관도 즐거워하네요.</span><br>
<span class="userId">에* | 2024.11.30</span>
<input type="button" class="replyReportBtn">
<input type="button" class="replyGoodBtn">

</div> -->

<jsp:include page="../common/footer.jsp" />
</body>

</html>
