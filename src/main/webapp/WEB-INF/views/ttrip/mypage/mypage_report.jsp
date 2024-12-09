<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 신고한 글</title>
<script type="text/javascript">
$(function(){

});//ready
</script>
</head>
<body>
    <div>
        <jsp:include page="../common/header.jsp"/>
    </div>
    
    <div class="mypage-container">
        <!-- 왼쪽 사이드 메뉴 -->
        <nav class="side-menu">
            <a href="mypage_course" class="menu-item">여행 코스</a>
            <a href="mypage_myboard" class="menu-item">내가 쓴 글</a>
            <a href="mypage_comment" class="menu-item">댓글 단 글</a>
            <a href="mypage_recommend" class="menu-item">추천한 글</a>
            <a href="mypage_report" class="menu-item active">신고한 글</a>
        </nav>

        <!-- 오른쪽 컨텐츠 영역 -->
       <!-- 오른쪽 컨텐츠 영역 -->
        <div class="content-area">
            <!-- 프로필 섹션 -->
            <section class="profile-section">
                <div class="profile-header">
                    <div class="profile-info">
                        <h1 class="profile-name">회원이름/닉네임</h1>
                        <div class="profile-actions">
   							<a href="edit_member" class="profile-button edit-button" style="text-decoration: none">정보수정</a>
                            <a href="delete_member" class="profile-button delete-button"style="text-decoration: none">회원탈퇴</a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- 컨텐츠 섹션 -->
            <section class="content-section">
                <ul class="content-list">
                    <li class="content-item">
                        <span class="category-badge category-free">자유</span>
                        <div class="content-info">
                            <div class="title-wrapper">
                                <a href="#" class="content-title">제주도 맛집 추천해주실 분!</a>
                            </div>
                            <span class="report-status status-completed">처리완료</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-free">자유</span>
                        <div class="content-info">
                            <div class="title-wrapper">
                                <a href="#" class="content-title">당일치기 할 만한 곳 추천요!</a>
                            </div>
                            <span class="report-status status-completed">처리완료</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-free">자유</span>
                        <div class="content-info">
                            <div class="title-wrapper">
                                <a href="#" class="content-title">대전에 핫플있을까요?</a>
                            </div>
                            <span class="report-status status-completed">처리완료</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-free">자유</span>
                        <div class="content-info">
                            <div class="title-wrapper">
                                <a href="#" class="content-title">성수는 피크닉으로 유명한가?</a>
                            </div>
                            <span class="report-status status-completed">처리완료</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-free">자유</span>
                        <div class="content-info">
                            <div class="title-wrapper">
                                <a href="#" class="content-title">연남동 꼭 가야할 곳 투어!</a>
                            </div>
                            <span class="report-status status-processing">대기중</span>
                        </div>
                    </li>
                </ul>
                <div class="pagination">
				    <a href="#" class="page-item active">1</a>
				    <a href="#" class="page-item">2</a>
				    <a href="#" class="page-item ">3</a>
				    <a href="#" class="page-item">4</a>
				    <a href="#" class="page-item">5</a>
				    <a href="#" class="page-arrow">
				        <i class="material-icons">chevron_right</i>
				    </a>
				</div>
            </section>
        </div>
    </div>
</body>
</html>