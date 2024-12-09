<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이페이지</title>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">
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
                        <h1 class="profile-name">회원이름/닉네임</h1>
                        <div class="profile-actions">
   							<a href="edit_member" class="profile-button edit-button" style="text-decoration: none">정보수정</a>
                            <a href="delete_member" class="profile-button delete-button"style="text-decoration: none">회원탈퇴</a>
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-section">
                <div class="course-grid">
                    <!-- 코스 카드 1 -->
                    <div class="course-card">
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ff2c7736-ff11-4a4f-8f81-2b84704d2e64" alt="제주도 여행코스" class="course-image" onclick="location.href='#'">
                        <div class="course-info">
                            <div class="course-tag">당일여행</div>
                            <a href="#" class="course-title">제주도 여행코스</a>
                            <div class="course-location">제주</div>
                            <div class="course-date">만든날짜 | 2024. 5. 26.</div>
                            <div class="course-stats">
                                <div class="stat-item">
                                    <i class="material-icons stat-icon">favorite</i>
                                    <span>6</span>
                                </div>
                                <div class="stat-item">
                                    <i class="material-icons stat-icon comment">chat</i>
                                    <span>6</span>
                                </div>
                            </div>
                        </div>
                    </div>
					<div class="course-card">
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=ff2c7736-ff11-4a4f-8f81-2b84704d2e64" alt="제주도 여행코스" class="course-image" onclick="location.href='#'">
                        <div class="course-info">
                            <div class="course-tag">당일여행</div>
                            <a href="#" class="course-title">제주도 여행코스</a>
                            <div class="course-location">제주</div>
                            <div class="course-date">만든날짜 | 2024. 5. 26.</div>
                            <div class="course-stats">
                                <div class="stat-item">
                                    <i class="material-icons stat-icon">favorite</i>
                                    <span>6</span>
                                </div>
                                <div class="stat-item">
                                    <i class="material-icons stat-icon comment">chat</i>
                                    <span>6</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 코스 카드 2 -->
                    <div class="course-card">
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=36c2513c-b9eb-4593-b0bb-3c2f2a5a77b1" alt="전북 여행코스" class="course-image" onclick="location.href='#'">
                        <div class="course-info">
                            <div class="course-tag">1박2일</div>
                            <a href="#" class="course-title">전북 고창군 여행코스</a>
                            <div class="course-location">전북 고창군</div>
                            <div class="course-date">만든날짜 | 2024. 2. 21.</div>
                            <div class="course-stats">
                                <div class="stat-item">
                                    <i class="material-icons stat-icon">favorite</i>
                                    <span>56</span>
                                </div>
                                <div class="stat-item">
                                    <i class="material-icons stat-icon comment">chat</i>
                                    <span>40</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="course-card">
                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=36c2513c-b9eb-4593-b0bb-3c2f2a5a77b1" alt="전북 여행코스" class="course-image" onclick="location.href='#'">
                        <div class="course-info">
                            <div class="course-tag">1박2일</div>
                            <a href="#" class="course-title">전북 고창군 여행코스</a>
                            <div class="course-location">전북 고창군</div>
                            <div class="course-date">만든날짜 | 2024. 2. 21.</div>
                            <div class="course-stats">
                                <div class="stat-item">
                                    <i class="material-icons stat-icon">favorite</i>
                                    <span>56</span>
                                </div>
                                <div class="stat-item">
                                    <i class="material-icons stat-icon comment">chat</i>
                                    <span>40</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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