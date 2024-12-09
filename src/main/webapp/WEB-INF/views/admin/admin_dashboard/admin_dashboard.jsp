<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 대시보드</title>
    <link rel="stylesheet" type="text/css" href="../common/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_dashboard.css">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="${pageContext.request.contextPath}/js/admin_dashboard.js" defer></script>
</head>
<body>
   
    <div class="common_admin">
        <h1>대시보드</h1>
        <div class="dashboard-grid">
            <!-- 매출 분석 차트 -->
            <div class="dashboard-item" id="box1">
                <h2>여행 코스 지역 추천 순위</h2>
                <div class="chart-container">
                    <canvas id="salesChart"></canvas>
                </div>
            </div>

            <!-- 매출 요약 -->
            <div class="dashboard-item" id="box2">
			    <h2>누적 사용자</h2>
			    <div class="chart-container">
                    <canvas id="peopleChart"></canvas>
                </div>
			</div>


            <!-- 인기 제품 차트 -->
            <div class="dashboard-item" id="box3">
                <h2>여행지 관심 순위</h2> 
                <div class="chart-container">
                    <canvas id="ordersChart"></canvas>
                </div>
            </div>

            <!-- 누적 사용자 차트 -->
            <div class="dashboard-item" id="box4">
                <h2>신규 신고</h2>
                <div class="chart-container">
                </div>
            </div>
        </div>
    </div>

    <script src="../common/js/admin.js"></script>
    
</body>
</html>
