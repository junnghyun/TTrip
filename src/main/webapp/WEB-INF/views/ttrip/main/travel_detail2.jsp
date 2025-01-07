<%@page import="net.minidev.json.JSONArray"%>
<%@page import="net.minidev.json.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    position: relative;
    top: 20px;
}

.btn2 {
    background: url('/ttrip/travel/images/btn_report.png') no-repeat;
    float: right;
    margin-right: 250px;
    width: 40px;
    height: 40px;
    border: none;
    position: relative;
    top: -10px;
}

.top2{
    margin-top: 30px;
}

hr {
    width: 80%;
    border: none;
    border-top: 1px solid #808080;
    margin: 50px auto;
    padding: 0;
}

.middle{
    width: 80%;
    margin: 30px auto;
}

.cont{
    margin-top: 20px;
    font-weight: bold;
}

#map {
    width: 1300px;
    height: 800px;
    margin: 50px auto;
    display: block;
    border: 1px solid #ddd;
}

.detail{
    background-color: #F3F2F2;
    height: 1150px;
    width: 1300px;
    margin: 0px auto;
    padding-bottom: 20px; /* 하단 여백 추가 */
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

.dayBtn.selected {
    filter: brightness(80%);
    transform: scale(1);
    border: 5px solid #567FF2;
}

.dayBtnBox{
    text-align: center;
}

/* 이미지 크기 수정 */
.dayImg {
    width: 400px;  /* 너비 수정 */
    height: 400px; /* 높이 수정 */
    cursor: pointer;
    transition: all 0.3s ease;
    border: 3px solid #567FF2;
    border-radius: 10px;
    object-fit: cover; /* 이미지 비율 유지 */
}

.dayImg.selected {
    filter: brightness(40%);
    transform: scale(1.1);
    border: 3px solid #567FF2;
}

.imgBox{
    text-align: center;
    margin-top: 30px;
    display: flex;
    justify-content: center;
    gap: 200px;
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

/* 댓글 영역 스타일 수정 */
.replyBox{
    width: 1300px;
    height: 150px;
    background-color: #FFFFFF; /* 배경색 흰색으로 변경 */
    margin: 10px auto;
    text-align: center;
    padding: 20px;
    margin-bottom: 50px; /* 하단 여백 조정 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* 약간의 그림자 효과 */
}

.inputReply{
    width: 1150px;
    height: 60px;
    font-size: 15px;
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 10px;
}

.replyBtn{
    background-color: #13294B;
    color: #fff;
    border-radius: 5px;
    width: 60px;
    height: 30px;
    font-size: 15px;
    border: none;
    cursor: pointer;
}

.reply{
    width: 1300px;
    margin: 10px auto;
    border-bottom: 1px solid #808080;
    padding: 15px;
    background-color: #FFFFFF; /* 댓글 배경도 흰색으로 */
}

.replyReportBtn {
    background: url('/ttrip/travel/images/replyReportBtn.png') no-repeat;
    float: right;
    margin-right: 20px;
    width: 40px;
    height: 40px;
    border: none;
    position: relative;
    top: -10px;
}

.userImg{
    width: 50px;
    height: 50px;
    border-radius: 50%;
}

.userId{
    margin-left: 60px;
}

.deleteBtn {
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 4px;
    padding: 5px 10px;
    font-size: 12px;
    cursor: pointer;
    margin-left: 10px;
}

.deleteBtn:hover {
    background-color: #c82333;
}

/* 숙소 정보 스타일 수정 */
.accomInfo {
    margin: 20px auto 0 auto !important; /* 상단 여백만 유지 */
    background-color: #FFFFFF;
    padding: 20px;
    border-radius: 10px;
    width: 90%;
}

.accomInfo h4 {
    margin-bottom: 15px;
    color: #13294B;
}

.accomInfo p {
    margin: 8px 0;
}

.planInfo {
    margin-top: 15px;
    text-align: center;
}

.planInfo h4 {
    color: #13294B;
    margin-bottom: 10px;
}
</style>
<script type="text/javascript">
var contextPath = '${pageContext.request.contextPath}';
// 전역 변수 선언
var map;
var markers = [];
var tripPlansData = ${tripPlansJson};
var accommodationsData = ${accommodationsJson};

$(function() {
    // 초기 버튼 스타일 설정
    $(".btn1").each(function() {
        $(this).css({
            "background": "url('/ttrip/travel/images/btn_good.png') no-repeat",
            "background-size": "contain", 
            "width": "25px", 
            "height": "25px", 
            "border": "none", 
            "cursor": "pointer"          
        });
    });

    // 추천 버튼 클릭 이벤트
    $(".btn1").click(function() {
        const token = localStorage.getItem('token');
        if (!token) {
            alert('로그인이 필요한 서비스입니다.');
            return;
        }

        $.ajax({
            url: '/travel/recommend',
            type: 'POST',
            headers: {
                'Authorization': 'Bearer ' + token
            },
            data: {
                tripBoardId: '${tripBoard.trip_boardID}'
            },
            success: function(response) {
                if (response.success) {
                    if (response.action === 'add') {
                        // 추천 추가 시 UI 업데이트
                        $(".btn1").css({
                            "background": "url('/ttrip/travel/images/btn_good_red.png') no-repeat",
                            "background-size": "contain"
                        });
                    } else {
                        // 추천 취소 시 UI 업데이트
                        $(".btn1").css({
                            "background": "url('/ttrip/travel/images/btn_good.png') no-repeat",
                            "background-size": "contain"
                        });
                    }
                    // 추천 수 업데이트
                    location.reload();
                } else {
                    alert(response.message || '오류가 발생했습니다.');
                }
            },
            error: function() {
                alert('서버 오류가 발생했습니다.');
            }
        });
    });
    
    
    // 게시물 신고버튼 클릭 시 신고 confirm
    $(".btn2").click(function() {
        if (confirm("신고하시겠습니까?")) {
            alert("신고 완료되었습니다.");
        } else {
            alert("취소");
        }
    });
    
    // 댓글 신고버튼 클릭 시 신고 confirm
    $(".replyReportBtn").click(function() {
        if (confirm("신고하시겠습니까?")) {
            alert("신고 완료되었습니다.");
        } else {
            alert("취소");
        }
    });

    // 지도 초기화
    var mapContainer = document.getElementById('map');
    var mapOption = {
        center: new kakao.maps.LatLng(35.95, 128.25),
        level: 13
    };
    map = new kakao.maps.Map(mapContainer, mapOption);

    // 일차 버튼 클릭 이벤트
    $(".dayBtn").click(function() {
        $(".dayBtn").removeClass("selected");
        $(this).addClass("selected");
        const day = $(this).data('day');
        showDayContent(day);
    });

    // 첫 번째 일차 버튼 자동 클릭
    if($(".dayBtn").length > 0) {
        $(".dayBtn:first").addClass("selected").trigger("click");
    }
});

// 일차별 컨텐츠 표시 함수
function showDayContent(day) {
    const dayPlans = tripPlansData.filter(plan => plan.trip_day == day);
    let html = '<div class="imgBox">';
    
    dayPlans.forEach(plan => {
        html += `
            <div class="planItem">
                <img src="${pageContext.request.contextPath}/ttrip/dstnt/images/\${plan.destination_img}" 
                    alt="\${plan.destination_name}" class="dayImg">
                <div class="planInfo mt-3">
                    <h4>\${plan.destination_name}</h4>
                    <p>\${plan.destination_addr}</p>
                    <p class="mt-2">\${plan.destination_detail || ''}</p>
                </div>
            </div>
        `;
    });
    
    html += '</div>';
    
    
    // 해당 일차의 숙소 정보 추가
    const dayAccom = accommodationsData.find(accom => accom.trip_day == day);
    if (dayAccom) {
        html += `
            <div class="accomInfo mt-4 p-4 bg-white rounded">
                <h4 class="mb-3">숙소 정보</h4>
                <p><strong>숙소명:</strong> \${dayAccom.accom_name}</p>
                <p><strong>주소:</strong> \${dayAccom.accom_addr}</p>
                <p><strong>연락처:</strong> \${dayAccom.phone}</p>
            </div>
        `;
    }
    
    $("#dayContent").html(html);
    
    // 지도 마커 업데이트
    updateMapMarkers(dayPlans);
}

// 지도 마커 업데이트 함수
function updateMapMarkers(dayPlans) {
    // 기존 마커 모두 제거
    markers.forEach(marker => marker.setMap(null));
    markers = [];
    
    // 새로운 마커 생성
    var bounds = new kakao.maps.LatLngBounds();
    
    dayPlans.forEach((plan, index) => {
        var markerPosition = new kakao.maps.LatLng(plan.lat, plan.lng);
        var marker = new kakao.maps.Marker({
            position: markerPosition,
            map: map
        });
        
        // 인포윈도우 생성
        var infowindow = new kakao.maps.InfoWindow({
            content: `<div style="padding:5px;">${index + 1}. ${plan.destination_name}</div>`
        });
        
        // 마커 이벤트
        kakao.maps.event.addListener(marker, 'mouseover', function() {
            infowindow.open(map, marker);
        });
        
        kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
        });
        
        bounds.extend(markerPosition);
        markers.push(marker);
    });
    
    // 지도 범위 재설정
    if (markers.length > 0) {
        map.setBounds(bounds);
    }
}

//댓글 작성
function addComment() {
    const token = localStorage.getItem('token');
    if (!token) {
        alert('로그인이 필요한 서비스입니다.');
        return;
    }

    const detail = $(".inputReply").val().trim();
    if (!detail) {
        alert('댓글 내용을 입력해주세요.');
        return;
    }

    $.ajax({
        url: '/travel/comment/add',
        type: 'POST',
        headers: {
            'Authorization': 'Bearer ' + token
        },
        data: {
            tripBoardId: '${tripBoard.trip_boardID}',
            detail: detail
        },
        success: function(response) {
            if (response.success) {
                // 입력 필드 초기화
                $(".inputReply").val('');
                // 댓글 목록 갱신
                updateComments(response.comments);
            } else {
                alert(response.message || '댓글 작성에 실패했습니다.');
            }
        },
        error: function() {
            alert('서버 오류가 발생했습니다.');
        }
    });
}

// 댓글 삭제
function deleteComment(commentId) {
    const token = localStorage.getItem('token');
    if (!token) {
        alert('로그인이 필요한 서비스입니다.');
        return;
    }

    if (!confirm('댓글을 삭제하시겠습니까?')) {
        return;
    }

    $.ajax({
        url: '/travel/comment/delete',
        type: 'POST',
        headers: {
            'Authorization': 'Bearer ' + token
        },
        data: {
            commentId: commentId,
            tripBoardId: '${tripBoard.trip_boardID}'
        },
        success: function(response) {
            if (response.success) {
                // 댓글 목록 갱신
                updateComments(response.comments);
            } else {
                alert(response.message || '댓글 삭제에 실패했습니다.');
            }
        },
        error: function() {
            alert('서버 오류가 발생했습니다.');
        }
    });
}


// 댓글 목록 업데이트
function updateComments(comments) {
    let html = '';
    comments.forEach(function(comment) {
        const date = new Date(comment.input_date);
        const formattedDate = `${date.getFullYear()}.${date.getMonth() + 1}.${date.getDate()}`;
        const currentUserNick = '${currentUserNick}';
        
        html += `
            <div class="reply">
                <img alt="회원" src="/ttrip/travel/images/user.jpg" class="userImg">
                <span>${comment.detail}</span>
                <br>
                <span class="userId">${comment.nick} | ${formattedDate}</span>
                <input type="button" class="replyReportBtn">`;
                
        if(comment.nick === currentUserNick) {
            html += `<button class="deleteBtn" onclick="deleteComment(${comment.trip_commentID})">삭제</button>`;
        }
        
        html += '</div>';
    });
    
    $("#commentList").html(html);
}
</script>
</head>
<body>
<%@include file ="../common/header.jsp" %>

<div id="wrap">
    <div class="top">
        <h2>${tripBoard.title}</h2>
        <span>${tripBoard.region}</span>
    </div>

    <div class="top2">
        <form name="goodFrm" class="goodFrm">
            <input type="button" class="btn1" style="background: url('/ttrip/travel/images/${hasRecommended ? 'btn_good_red.png' : 'btn_good.png'}') no-repeat; background-size: contain;">
            <span style="color: #808080">${tripBoard.recom_count}</span>
        </form>
        <form name="reportFrm">
            <input type="button" class="btn2">
        </form>
    </div>

    <hr>

    <div class="middle">
        <div id="map"></div>

        <div class="detail">
            <div class="dayBtnBox">
                <c:forEach items="${tripPlans}" var="plan" varStatus="status">
                    <c:if test="${status.index == 0 || tripPlans[status.index-1].trip_day != plan.trip_day}">
                        <button class="dayBtn" data-day="${plan.trip_day}">${plan.trip_day}일차</button>
                    </c:if>
                </c:forEach>
            </div>
            <div id="dayContent">
                <!-- 일차별 컨텐츠가 동적으로 표시됨 -->
            </div>
        </div>
    </div>
    <!-- 댓글 작성 영역 -->
<div class="replyBox">
    <input type="text" placeholder="소중한 댓글을 남겨주세요" class="inputReply">
    <input type="button" value="등록" class="replyBtn" onclick="addComment()" style="margin-left: 1100px; margin-top: 20px;">
</div>

<!-- 댓글 목록 영역 -->
<div id="commentList">
    <c:forEach items="${comments}" var="comment">
        <div class="reply">
		    <img alt="회원" src="/ttrip/travel/images/user.jpg" class="userImg">
		    <span>${comment.detail}</span>
		    <br>
		    <span class="userId">${comment.nick} | 
		        <fmt:formatDate value="${comment.input_date}" pattern="yyyy.MM.dd"/>
		    </span>
		    <input type="button" class="replyReportBtn">
		    <!-- 추천 관련 버튼과 카운트 제거됨 -->
		    <c:if test="${comment.nick eq currentUserNick}">
		        <button class="deleteBtn" onclick="deleteComment(${comment.trip_commentID})">삭제</button>
		    </c:if>
		</div>
    </c:forEach>
</div>
    
</div>

<jsp:include page="../common/footer.jsp" />
</body>
</html>