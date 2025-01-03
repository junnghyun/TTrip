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
	font-weight: bold;
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
    
    // dayBtn 클릭 이벤트
    $(".dayBtn").click(function() {
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
               
        <h2>${tripBoard.title}</h2>
        <span>경기도 안산시</span>
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
<div class="cont">디테일한 내용
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
                <button class="dayBtn" data-day="1">1일차</button>
        </div>
        <div id="dayContent">
        </div>
    </div>

</div>

<div class="replyBox">
<input type="text" placeholder="소중한 댓글을 남겨주세요" class="inputReply"><br>
<input type="button" value="등록" class="replyBtn" style="margin-left: 1100px; margin-top: 20px;">
</div>

<div class="reply">

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

</div>
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>
