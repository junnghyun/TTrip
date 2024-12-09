<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
</head>
<div>
<jsp:include page="../common/header.jsp"/>
</div>
<body>
    <div class="mypage-container">
        <!-- 왼쪽 사이드 메뉴 -->
        <nav class="side-menu">
            <a href="mypage_course" class="menu-item">여행 코스</a>
            <a href="mypage_myboard" class="menu-item active">내가 쓴 글</a>
            <a href="mypage_comment" class="menu-item">댓글 단 글</a>
            <a href="mypage_recommend" class="menu-item">추천한 글</a>
            <a href="mypage_report" class="menu-item">신고한 글</a>
        </nav>

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
                    <!-- <li class="content-item">
                        <span class="category-badge category-course">코스</span>
                        <div class="content-info">
                            <a href="#" class="content-title">제주도 3박4일 여행코스 공유합니다</a>
                            <span class="content-date">2024.03.07</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-question">질문</span>
                        <div class="content-info">
                            <a href="#" class="content-title">제주도 맛집 추천해주실 분!</a>
                            <span class="content-date">2024.03.05</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-course">코스</span>
                        <div class="content-info">
                            <a href="#" class="content-title">서울 당일치기 데이트 코스</a>
                            <span class="content-date">2024.03.04</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-free">자유</span>
                        <div class="content-info">
                            <a href="#" class="content-title">최근에 피크닉으로 유명해진 노들섬..</a>
                            <span class="content-date">2024.03.02</span>
                        </div>
                    </li>
                    <li class="content-item">
                        <span class="category-badge category-recommend">추천</span>
                        <div class="content-info">
                            <a href="#" class="content-title">연남동 꼭 가야할 곳 소품샵 투어!</a>
                            <span class="content-date">2024.03.01</span>
                        </div>
                    </li> --><li>작성된글이없습니다.</li>
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