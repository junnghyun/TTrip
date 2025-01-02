<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">
<head>
    <meta charset="UTF-8">
    <title>마이페이지 - 신고한 글</title>
	<style>
        .content-section {
            min-height: 515px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding-bottom: 0;
        }
        
        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 0px;
            padding: 10px 0;
        }

        .report-status {
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
        }

        .status-completed {
            background-color: #E8F5E9;
            color: #2E7D32;
        }

        .status-processing {
            background-color: #FFF3E0;
            color: #E65100;
        }
        
        .category-badge {
            padding: 4px 8px;
            border-radius: 4px;
            font-size: 12px;
            font-weight: 600;
            margin-right: 8px;
        }
        
        .content-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }
        
        .content-item {
            display: flex;
            align-items: center;
            padding: 16px;
            border-bottom: 1px solid #eee;
            transition: background-color 0.2s;
        }
        
        .content-info {
            flex: 1;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .content-title {
            color: #333;
            text-decoration: none;
            font-weight: 500;
        }

        .no-content {
            text-align: center;
            padding: 40px;
            color: #666;
            font-size: 16px;
        }

        .category-자유 { background-color: #E3F2FD; color: #1976D2; }
        .category-질문 { background-color: #E8F5E9; color: #388E3C; }
        .category-추천 { background-color: #FFF3E0; color: #F57C00; }
        .category-코스 { background-color: #F3E5F5; color: #7B1FA2; }
    </style>
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
       <div class="content-area">
            <section class="profile-section">
                <div class="profile-header">
                    <div class="profile-info">
                        <h1 class="profile-name">${nick}</h1>
                        <div class="profile-actions">
                            <a href="edit_member" class="profile-button edit-button" style="text-decoration: none">정보수정</a>
                            <a href="delete_member" class="profile-button delete-button" style="text-decoration: none">회원탈퇴</a>
                        </div>
                    </div>
                </div>
            </section>

            <section class="content-section">
                <ul class="content-list">
                    <c:choose>
                        <c:when test="${empty reports}">
                            <li class="no-content">
                                <p>신고한 게시글이 없습니다.</p>
                            </li>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${reports}" var="report">
                                <li class="content-item">
                                    <span class="category-badge category-${report.category}">${report.category}</span>
                                    <div class="content-info">
                                        <div class="title-wrapper">
                                            <a href="/board/detail/${report.boardID}" class="content-title">${report.title}</a>
                                        </div>
                                        <span class="report-status ${report.report_status == 'C' ? 'status-completed' : 'status-processing'}">
                                            ${report.report_status_text}
                                        </span>
                                    </div>
                                </li>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </ul>
                
                <c:if test="${totalPages > 1}">
                    <div class="pagination">
                        <c:if test="${startPage > 1}">
                            <a href="?page=${startPage-5}" class="page-arrow">
                                <i class="material-icons">chevron_left</i>
                            </a>
                        </c:if>
                        
                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                            <a href="?page=${i}" class="page-item ${currentPage == i ? 'active' : ''}">${i}</a>
                        </c:forEach>
                        
                        <c:if test="${endPage < totalPages}">
                            <a href="?page=${startPage+5}" class="page-arrow">
                                <i class="material-icons">chevron_right</i>
                            </a>
                        </c:if>
                    </div>
                </c:if>
            </section>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/common/authCheck.js"></script>
</body>
</html>