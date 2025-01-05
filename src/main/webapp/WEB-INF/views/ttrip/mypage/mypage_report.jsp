<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 신고한 글</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link href="${pageContext.request.contextPath}/ttrip/mypage/css/mypage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
</head>
<body>
    <div>
        <jsp:include page="../common/header.jsp"/>
    </div>
    <div class="mypage-container">
        <nav class="side-menu">
            <a href="mypage_course" class="menu-item">여행 코스</a>
            <a href="mypage_myboard" class="menu-item">내가 쓴 글</a>
            <a href="mypage_comment" class="menu-item">댓글 단 글</a>
            <a href="mypage_recommend" class="menu-item">추천한 글</a>
            <a href="mypage_report" class="menu-item active">신고한 글</a>
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

            <section class="content-section">
                <ul class="content-list" id="report-list">
                    <!-- Reports will be loaded here dynamically -->
                </ul>
                
                <div class="pagination" id="pagination">
                    <!-- Pagination will be loaded here dynamically -->
                </div>
            </section>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            loadReports(1);
        });

        function loadReports(page) {
            var token = localStorage.getItem("jwt_token");
            
            $.ajax({
                url: '/user/api/mypage_report',
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
                    console.error('Error fetching reports:', error);
                    alert('신고 내역을 불러오는데 실패했습니다.');
                }
            });
        }

        function updateUI(data) {
            // Update nickname
            $('#profile-nickname').text(data.nick);
            
            // Update reports list
            var reportList = $('#report-list');
            reportList.empty();
            
            if (!data.reports || data.reports.length === 0) {
                reportList.append('<li class="no-content"><p>신고한 게시글이 없습니다.</p></li>');
            } else {
                data.reports.forEach(function(report) {
                    var reportHtml = `
                        <li class="content-item">
                            <span class="category-badge category-\${report.category}">\${report.category}</span>
                            <div class="content-info">
                                <div class="title-wrapper">
                                    <a href="/board/detail/\${report.boardID}" class="content-title">\${report.title}</a>
                                </div>
                                <span class="report-status \${report.report_status === 'C' ? 'status-completed' : 'status-processing'}">
                                    \${report.report_status_text}
                                </span>
                            </div>
                        </li>
                    `;
                    reportList.append(reportHtml);
                });
            }
            
            // Update pagination
            updatePagination(data);
        }

        function updatePagination(data) {
            var pagination = $('#pagination');
            pagination.empty();
            
            if (data.totalPages > 1) {
                var paginationHtml = '';
                
                if (data.startPage > 1) {
                    paginationHtml += `
                        <a href="javascript:void(0)" onclick="loadReports(${data.startPage-5})" class="page-arrow">
                            <i class="material-icons">chevron_left</i>
                        </a>
                    `;
                }
                
                for (var i = data.startPage; i <= data.endPage; i++) {
                    paginationHtml += `
                        <a href="javascript:void(0)" onclick="loadReports(${i})" 
                           class="page-item ${data.currentPage == i ? 'active' : ''}">${i}</a>
                    `;
                }
                
                if (data.endPage < data.totalPages) {
                    paginationHtml += `
                        <a href="javascript:void(0)" onclick="loadReports(${data.startPage+5})" class="page-arrow">
                            <i class="material-icons">chevron_right</i>
                        </a>
                    `;
                }
                
                pagination.html(paginationHtml);
            }
        }
    </script>
    <script src="${pageContext.request.contextPath}/common/authCheck.js"></script>
</body>
</html>