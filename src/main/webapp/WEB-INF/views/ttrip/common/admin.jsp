<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <header class="header fixed">
        <div class="user-info">
        	<form action="<%= request.getContextPath() %>/model2_project/admin/logout" method="post">
		        <button type="submit" class="logout-btn">로그아웃</button>
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
                    <li><a href="../admin_dashboard/admin_dashboard.jsp">대시보드</a></li>
                  <!--   <li><a href="../admin_orders/admin_orders.jsp">주문관리</a></li> -->
                    <li><a href="../admin_member/admin_member.jsp">회원관리</a></li>
                    <li><a href="../admin_boardlist/admin_boardlist.jsp">게시판관리</a></li>
                    <li><a href="../admin_travel/admin_travel.jsp">여행지 관리</a></li>
                    <li><a href="../admin_lodging/admin_lodging.jsp">숙소 관리</a></li>
                    <li><a href="../admin_report/admin_report.jsp">신고 관리</a></li>
                </ul>
                </div>
            </div>
        </div>