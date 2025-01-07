<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 여행 코스</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/content.css" />
<link id="tgpr_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/theme/travel100scene/cont.css">
<link id="curation_css" rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/main/css/curation.css"/>
<link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.mypage-container {
   max-width: 1200px;
   margin: 50px auto;
   display: flex; 
   gap: 30px;
   padding: 0 20px;
   height: 700px;
}

.content-area {
   flex: 1;
   max-width: 920px;
}

#contents.aiplanner {
   width: 100% !important;
}

.planner_list ul {
    display: flex; 
    flex-wrap: wrap;
    gap: 24px;
    justify-content: flex-start;
}

/* 이미지 크기 조절 스타일 */
.planner_list .img {
    width: 180px !important;
    height: 125px !important;
    overflow: hidden;
}

.planner_list .img img {
    width: 180px !important;
    height: 125px !important;
    object-fit: cover;
}

/* 카드 전체 크기 조절 */
.planner_list li {
    width: 180px !important;
    margin-right: auto;
    flex: 0 0 auto;
}

/* 컨텐츠 영역 조절 */
.planner_list .cont {
    width: 200px !important;
}

/* 페이지네이션 위치 조정 */
.pagination {
   margin: 30px 0;
}

/* 사이드메뉴 */
.side-menu {
    width: 250px;
    background: #567FF2;
    border-radius: 12px;
    padding: 20px 0;
    height: 100%;
    
}

.profile-name {
   font-family: 'Noto Sans KR', sans-serif;
}
</style>
</head>
<body>
    <div>
        <jsp:include page="../common/header.jsp"/>
    </div>
    
    <div class="mypage-container">
        <nav class="side-menu">
            <a href="mypage_course" class="menu-item active">여행 코스</a>
            <a href="mypage_myboard" class="menu-item">내가 쓴 글</a>
            <a href="mypage_comment" class="menu-item">댓글 단 글</a>
            <a href="mypage_recommend" class="menu-item">추천한 글</a>
            <a href="mypage_report" class="menu-item">신고한 글</a>
        </nav>

        <div class="content-area">
            <section class="profile-section">
                <div class="profile-header">
                    <div class="profile-info">
                        <h1 class="profile-name" id="profile-nickname"></h1>
                        <div class="profile-actions">
                            <a href="edit_member" class="profile-button edit-button" style="text-decoration: none">정보수정</a>
                            <a href="delete_member" class="profile-button delete-button" style="text-decoration: none">회원탈퇴</a>
                        </div>
                    </div>
                </div>
            </section>

            <div id="contents" class="aiplanner">
                <div class="cockcock_planner">
                    <div id="plannerTab4" class="tab_cont active">
                        <div class="planner_list bestPlannerList">
                            <ul id="course-list" style="width: 800px; margin-left: 0px;">
                                <!-- Courses will be loaded here dynamically -->
                            </ul>
                        </div>
                        
                        <div class="pagination" id="pagination" style="width: 900px">
                            <!-- Pagination will be loaded here dynamically -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            loadCourses(1);
        });

        function loadCourses(page) {
            var token = localStorage.getItem("jwt_token");
            
            $.ajax({
                url: '/user/api/mypage_course',
                type: 'GET',
                headers: {
                    'Authorization': 'Bearer ' + token
                },
                data: {
                    page: page
                },
                success: function(response) {
                    updateUI(response);
                },
                error: function(error) {
                    console.error('Error fetching courses:', error);
                    alert('여행 코스 정보를 불러오는데 실패했습니다.');
                }
            });
        }

        function updateUI(data) {
            // Update nickname
            $('#profile-nickname').text(data.nick);
            
            // Update courses list
            var courseList = $('#course-list');
            courseList.empty();
            
            if (!data.courses || data.courses.length === 0) {
                courseList.append('<li class="no-courses"><p>작성한 여행 코스가 없습니다.</p></li>');
            } else {
                data.courses.forEach(function(course) {
                    var courseHtml = `
                        <li style="margin-bottom: 0px; margin-left: 70px">
                            <span onclick="goDetailCourse('\${course.trip_boardID}')" class="img">
                                <img src="\${course.firstImageUrl || '/path/to/default/image.jpg'}" alt="">
                                <span class="profile">
                                    <img src="/resources/images/common/icon_header_profile2.png" onerror="this.remove();" alt="프로필">
                                </span>
                            </span>
                            <div class="cont" style="margin-top: 0px;padding-top: 0px">
                                <a href="javascript:goDetailCourse('\${course.trip_boardID}');" 
                                   style="font-size: 16px; margin-top: 5px;margin-bottom: 2px">\${course.title}</a>
                                <span class="area" style="font-size: 14px">\${course.region}</span>
                                <div class="date" style="font-size: 12px; margin-bottom: 2px; margin-top: 2px">
                                    <em>만든날짜</em>
                                    <span>\${course.formatted_date}</span>
                                </div>
                                <div class="rate">
                                    <div class="grade">
                                        <div class="star">
                                            <span></span>
                                        </div>
                                        <span class="total"><em class="blind">추천수</em>\${course.recom_count}</span>
                                    </div>
                                    <span class="comment"><em class="blind">댓글수</em>\${course.comment_count}</span>
                                </div>
                            </div>
                        </li>
                    `;
                    courseList.append(courseHtml);
                });
            }
            
            // Update pagination
            updatePagination(data);
        }

        function updatePagination(data) {
            var pagination = $('#pagination');
            pagination.empty();
            
            if (data.totalPages > 1) {
                for (var i = 1; i <= data.totalPages; i++) {
                    pagination.append(
                        '<a href="javascript:void(0)" onclick="loadCourses(' + i + ')" ' +
                        'class="page-item ' + (data.currentPage == i ? 'active' : '') + '">' + i + '</a>'
                    );
                }
            }
        }

        function goDetailCourse(boardId) {
            window.location.href = `/board/detail/${boardId}`;
        }
    </script>
    <script src="${pageContext.request.contextPath}/common/authCheck.js"></script>
</body>
</html>