<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">

<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 댓글 단 글</title>
</head>
<body>
    <div>
        <jsp:include page="../common/header.jsp"/>
    </div>
    
    <div class="mypage-container">
        <nav class="side-menu">
            <a href="mypage_course" class="menu-item">여행 코스</a>
            <a href="mypage_myboard" class="menu-item ">내가 쓴 글</a>
            <a href="mypage_comment" class="menu-item active">댓글 단 글</a>
            <a href="mypage_recommend" class="menu-item">추천한 글</a>
            <a href="mypage_report" class="menu-item">신고한 글</a>
        </nav>

        <div class="content-area">
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

            <section class="content-section">
			    <ul class="content-list">
			        <li class="content-item">
			            <span class="category-badge category-free">자유</span>
			            <div class="content-info">
			                <div class="title-wrapper">
			                    <a href="#" class="post-link">
			                        <span class="content-title">제주도 맛집 추천해주실 분!</span>
			                        <p class="comment-text">제주 참치직판장 맛있어요! 현지인이 추천하는 맛집입니다.</p>
			                    </a>
			                </div>
			                <span class="content-date">2024.03.07</span>
			            </div>
			        </li>
			        <li class="content-item">
			            <span class="category-badge category-question">질문</span>
			            <div class="content-info">
			                <div class="title-wrapper">
			                    <a href="#" class="post-link">
			                        <span class="content-title">당일치기 할 만한 곳 추천요!</span>
			                        <p class="comment-text">남산 타워 초조~</p>
			                    </a>
			                </div>
			                <span class="content-date">2024.03.05</span>
			            </div>
			        </li>
			        <li class="content-item">
			            <span class="category-badge category-course">코스</span>
			            <div class="content-info">
			                <div class="title-wrapper">
			                    <a href="#" class="post-link">
			                        <span class="content-title">제주 참치직판장 맛있어요!</span>
			                        <p class="comment-text">제주 참치직판장 진짜 맛집이에요. 가성비도 좋고 신선해요!</p>
			                    </a>
			                </div>
			                <span class="content-date">2024.03.04</span>
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