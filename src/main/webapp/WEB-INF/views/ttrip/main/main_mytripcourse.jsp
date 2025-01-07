<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 여행 코스</title>
<link rel="shortcut icon" href="http://192.168.10.228/jsp_prj/common/images/favicon.ico">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/content.css?v=2023010400142124b5e-3e78-4c2d-9000-9954ac7cb338" />
<link id="tgpr_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/theme/travel100scene/cont.css?v=2024072900142124b5e-3e78-4c2d-9000-9954ac7cb338">
<link id="curation_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/curation.css?v=2023012100142124b5e-3e78-4c2d-9000-9954ac7cb338"/>
<!--  bootstrap CDN 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--  jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
.delete-btn {
   position: absolute;
   top: 10px;
   right: 10px;
   background: none;
   border: none;
   color: #666;
   font-size: 18px;
   cursor: pointer;
   padding: 5px 10px;
   z-index: 10;
}

.delete-btn:hover {
   color: #ff0000;
}

.my_cos li {
   position: relative;
}

.placeholder-img {
    background-color: #f5f5f5;
    min-height: 200px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #999;
    font-size: 14px;
}
</style>

<script type="text/javascript">
$(function(){
    let token = localStorage.getItem("jwt_token");
    if (!token) {
        showLoginRequired();
    } else {
        loadMyTripCourses();
    }

 // 더보기 버튼 클릭 이벤트
    $(document).on('click', '.more button', function(){
        let offset = $(".my_cos li").length;
        const token = localStorage.getItem("jwt_token");
        
        $.ajax({
            url: "/main_mytripcourse/more",
            type: "POST",
            headers: {
                'Authorization': 'Bearer ' + token
            },
            data: JSON.stringify({ offset: offset }),
            contentType: "application/json",
            dataType: "json",
            success: function(data){
                if(data.boardList && data.boardList.length > 0) {
                    data.boardList.forEach(function(board){
                        const boardHtml = createBoardHtml(board);
                        $(".my_cos").append(boardHtml);
                    });
                    
                    if(data.boardList.length < 12) {
                        $(".more").hide();
                    }
                } else {
                    $(".more").hide();
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
                alert("게시글을 더 불러오는데 실패했습니다.");
            }
        });
    });
});

function createBoardHtml(board) {
    return '<li tabindex="0">' +
        '<button type="button" class="delete-btn" onclick="deleteCourse(\'' + board.trip_boardID + '\', this)">×</button>' +
        '<span data-board-id="' + board.trip_boardID + '" class="img course-link">' +
            '<img src="' + (board.firstImageUrl || '/ttrip/main/images/default_image.jpg') + '" ' +
                'alt="여행 이미지" ' +
                'onerror="this.onerror=null; this.src=\'/ttrip/main/images/default_image.jpg\'; this.classList.add(\'placeholder-img\');">' +
            '<span class="profile">' +
                '<img src="/resources/images/common/icon_header_profile2.png" ' +
                     'onerror="this.remove();" ' +
                     'alt="프로필">' +
            '</span>' +
        '</span>' +
        '<div class="cont">' +
            '<span class="day">' + board.trip_period + '</span>' +
            '<a href="javascript:goDetailCourse(\'' + board.trip_boardID + '\');">' + board.title + '</a>' +
            '<span class="area">' + board.region + '</span>' +
            '<div class="date">' +
                '<em>만든날짜</em>' +
                '<span>' + board.formatted_date + '</span>' +
            '</div>' +
            '<div class="rate">' +
                '<div class="grade">' +
                    '<div class="star">' +
                        '<span></span>' +
                    '</div>' +
                    '<span class="total"><em class="blind">추천수</em>' + board.recom_count + '</span>' +
                '</div>' +
                '<span class="comment"><em class="blind">댓글수</em>' + board.comment_count + '</span>' +
            '</div>' +
        '</div>' +
    '</li>';
}

function formatDate(dateStr) {
    if (!dateStr) return '';
    const date = new Date(dateStr);
    if (isNaN(date.getTime())) return '';
    return `${date.getFullYear()}. ${date.getMonth() + 1}. ${date.getDate()}.`;
}

function showLoginRequired() {
    $(".planner_list").html(`
        <div class="planner_list myPannerNoData" style="text-align: center; padding: 50px 0;">
            <div class="no_data">
                <strong style="font-size: 24px; margin-bottom: 20px; display: block;">로그인이 필요한 서비스입니다 😊</strong>
                <p style="font-size: 16px; color: #666; margin-bottom: 30px;">나만의 여행 코스를 관리하려면 로그인해주세요.</p>
                <a href="/login" style="display: inline-block; padding: 12px 30px; background-color: #567FF2; color: white; border-radius: 5px; text-decoration: none; font-weight: bold;">
                    로그인하기
                </a>
            </div>
        </div>
    `);
}

function loadMyTripCourses() {
    const token = localStorage.getItem("jwt_token");
    if(!token) {
        showLoginRequired();
        return;
    }
    
    $.ajax({
        url: '/api/main/mytripcourse',
        type: 'GET',
        headers: {
            'Authorization': 'Bearer ' + token
        },
        success: function(response) {
            console.log("Response:", response); // 디버깅용 로그 추가
            if (response.success) {
                if (response.boards && response.boards.length > 0) {
                    const courseList = $(".my_cos");
                    courseList.empty();
                    
                    console.log("Boards:", response.boards); // 디버깅용 로그 추가
                    
                    response.boards.forEach(function(board) {
                        const dateStr = board.formatted_date || formatDate(board.input_date);
                        board.formatted_date = dateStr;
                        const boardHtml = createBoardHtml(board);
                        courseList.append(boardHtml);
                    });
                    
                    if (response.boards.length >= 12) {
                        if ($(".more").length === 0) {
                            $(".planner_list").append(`
                                <div class="more">
                                    <button><span>더보기</span></button>
                                </div>
                            `);
                        }
                    } else {
                        $(".more").hide();
                    }
                } else {
                    showEmptyMessage();
                }
            } else if (response.message === 'unauthorized') {
                showLoginRequired();
            }
        },
        error: function(xhr) {
            console.error("Error response:", xhr); // 디버깅용 로그 추가
            if(xhr.status === 401) {
                showLoginRequired();
            } else {
                alert('데이터를 불러오는데 실패했습니다.');
            }
        }
    });
}

function showEmptyMessage() {
    $(".planner_list").html(`
        <div class="planner_list myPannerNoData">
            <div class="no_data">
                <strong>아직 제작한 코스가 없어요. 😨</strong>
                <p>맞춤형 여행 코스 추천 받아보세요.</p>
            </div>
        </div>
    `);
}

function deleteCourse(boardId, element) {
    if(confirm('이 코스를 삭제하시겠습니까?')) {
        const token = localStorage.getItem("jwt_token");
        
        $.ajax({
            url: "/deleteCourse",
            type: "POST",
            headers: {
                'Authorization': 'Bearer ' + token
            },
            data: JSON.stringify({ boardId: parseInt(boardId) }),
            contentType: "application/json",
            success: function(response) {
                if(response.success) {
                    $(element).closest('li').remove();
                    alert('삭제되었습니다.');
                    
                    // 목록이 비어있는지 확인
                    if($(".my_cos li").length === 0) {
                        showEmptyMessage();
                    }
                } else {
                    alert('삭제에 실패했습니다.');
                }
            },
            error: function() {
                alert('삭제에 실패했습니다.');
            }
        });
    }
}

function goDetailCourse(tripBoardId) {
    window.location.href = '/travel/detail/' + tripBoardId;
}

function showAiPlannerInfo() {
    alert("AI 기반의 맞춤형 여행 코스 추천 서비스입니다.");
}

function GoCreateCourse(num) {
    window.location.href = "/tm";
}
</script>
<jsp:include page="../common/header.jsp"/>
</head>
<body>
<div id="contents" class="aiplanner" style="width: auto">
   <div class="cockcock_planner">
       <div class="showcase">
           <div class="inr">
               <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_tit.png" class="pc" alt="AI콕콕 플래너 - 당신이 원하는 여행의 시작 1분이면 끝! 나만을 위한 여행 코스 추천. 대한민국구석구석 x Tmap x 한국관광 데이터랩 Data Lab x 공공데이터포털">
               <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_m_tit.jpg" class="mo" alt="AI콕콕 플래너 - 당신이 원하는 여행의 시작 1분이면 끝! 나만을 위한 여행 코스 추천. 대한민국구석구석 x Tmap x 한국관광 데이터랩 Data Lab x 공공데이터포털">
               <div class="map">
                   <span class="spot1"></span>
                   <span class="spot2"></span>
                   <span class="spot3"></span>
               </div>
               <div class="tag">
                   <span>
                       <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/img_planner_tag.png" class="pc" alt="#맞춤형 코스 추천 #마음대로 편집 가능">
                   </span>
                   <button type="button">
                       <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/btn_planner_tag.png" class="pc" alt="#BEST 코스 도전">
                   </button>
                   <div class="tip">
                       <div class="pc">
                           <em>TIP</em>
                           <p>코스를 '공개'하면 BEST코스 도전 가능!<br>'비공개'하면 나만의 코스로 간직할 수 있어요.</p>
                       </div>
                       <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/bg_planner_m_tip.png" class="mo" alt="">
                   </div>
               </div>
               <div class="btn">
					<a href="javascript:GoCreateCourse(1);">
                       <div class="pc">
                           <em>코스만들기</em>
                           <span class="arw_wrap">
                               <span class="left"></span>
                               <span class="right"></span>
                           </span>
                       </div>
                       <img src="${pageContext.request.contextPath}/ttrip/main/images/curation/btn_planner_m_cos.png" class="mo" alt="">
                   </a>
                   <span class="mo">
                       <button type="button" onclick="showAiPlannerInfo();">AI콕콕 플래너란?</button>
                   </span>
               </div>
           </div>
       </div>
       <div class="tab">
           <ul>
               <li class=""><a href="#plannerTab3" class="mo_tab">다른 사용자코스</a></li>
               <li id="my" class="on"><a href="/main_mytripcourse">나의 여행코스</a></li>
               <li id="best" class=""><a href="/">월간Best30</a></li>
               <li id="area" class=""><a href="/main_tripboard">여행게시판</a></li>
           </ul>
       </div>
       <div id="plannerTab2" class="tab_cont active" style="display: block;">
           <h4>나의 여행 코스</h4>
           <div class="planner_list myPlannerList">
    <ul class="my_cos">
        <c:if test="${not empty boards}">
            <c:forEach items="${boards}" var="board">
                <li tabindex="0">
                    <button type="button" class="delete-btn" onclick="deleteCourse('${board.trip_boardID}', this)">×</button>
                    <span onclick="goDetailCourse('${board.trip_boardID}')" class="img">
                        <img src="${not empty board.firstImageUrl ? board.firstImageUrl : pageContext.request.contextPath}/ttrip/main/images/default_image.jpg" 
                             alt="여행 이미지" 
                             onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/ttrip/main/images/default_image.jpg'; this.classList.add('placeholder-img');">
                        <span class="profile">
                            <img src="/resources/images/common/icon_header_profile2.png" 
                                 onerror="this.remove();" 
                                 alt="프로필">
                        </span>
                    </span>
                    <div class="cont">
                        <span class="day">${board.trip_period}</span>
                        <a href="javascript:goDetailCourse('${board.trip_boardID}');">${board.title}</a>
                        <span class="area">${board.region}</span>
                        <div class="date">
                            <em>만든날짜</em>
                            <span><fmt:formatDate value="${board.input_date}" pattern="yyyy. M. d."/></span>
                        </div>
                        <div class="rate">
                            <div class="grade">
                                <div class="star">
                                    <span></span>
                                </div>
                                <span class="total"><em class="blind">추천수</em>${board.recom_count}</span>
                            </div>
                            <span class="comment"><em class="blind">댓글수</em>${board.comment_count}</span>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </c:if>
    </ul>
    <c:if test="${boards.size() >= 12}">
        <div class="more">
            <button><span>더보기</span></button>
        </div>
    </c:if>
</div>
       </div>
   </div>
</div>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>