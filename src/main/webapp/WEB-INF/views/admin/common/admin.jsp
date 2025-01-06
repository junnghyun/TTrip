<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/common/authCheck.js"></script>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Logout button click event listener
        const logoutButton = document.getElementById('logout-btn');

        // If logout button exists
        if (logoutButton) {
            logoutButton.addEventListener('click', function(event) {
                event.preventDefault(); // Prevent form submission
                localStorage.removeItem('jwt_token'); // JWT 토큰 삭제
                // Optionally, you can redirect to the login page or another page
                window.location.href = '/admin/login'; // Redirect to login page
            });
        }
    });
</script>
    <header class="header fixed">
        <div class="user-info">
        	<form action="admin/logout" method="post">
		        <button type="submit" class="logout-btn" id="logout-btn">로그아웃</button>
		    </form>
            <span>admin 관리자님</span>
        </div>
    </header>
        <div class="sidebar" id="sidebar">
            <span class="toggle-btn" id="toggle-btn" onclick="toggleSidebar()">&times;</span>
            <div class="sidebar-content fixed">
                <h2>관리자 메뉴</h2>
                <div class="admin-text">
                <ul>
                    <li><a href="/admin/dashboard">대시보드</a></li>
                    <li><a href="/admin/member">회원관리</a></li>
                    <li><a href="/admin/board">게시판관리</a></li>
                    <li><a href="/admin/dstnt/dstnt_manage">여행지관리</a></li>
                    <li><a href="/admin/exit">신고관리</a></li>
                </ul>
                </div>
            </div>
        </div>