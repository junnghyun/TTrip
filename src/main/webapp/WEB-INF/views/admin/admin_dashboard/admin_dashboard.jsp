<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 대시보드</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/common/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/admin_dashboard/css/admin_dashboard.css">

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="${pageContext.request.contextPath}admin/admin_dashboard/js/admin_dashboard.js" defer></script>
    <style>
	.chart-container {
	    height: 400px;
	    margin: 20px;
	    padding: 10px;
	}
	
</style>
</head>

<body>
   <jsp:include page="../common/admin.jsp" />
    <div class="common_admin">
        <h1>대시보드</h1>
        <div class="dashboard-grid">
            <!-- 지역 추천 순위 차트 -->
            <div class="dashboard-item" id="box1">
	    <h2>여행 코스 지역 추천 순위</h2>
	    <div class="chart-container">
	        <canvas id="regionChart"></canvas>
	    </div>
	</div>
	
	
	

           <!-- 누적 사용자 차트 -->
           <div class="dashboard-item" id="box2">
		    <h2>누적 사용자</h2>
		    <div class="chart-container">
                   <canvas id="peopleChart"></canvas>
               </div>
		</div>

            <!-- 가장 많이간 여행지 차트 -->
            <div class="dashboard-item" id="box3">
                <h2>가장 많이간 여행지 순위</h2> 
                <div class="chart-container">
                    <canvas id="ordersChart"></canvas>
                </div>
            </div>

            <!-- 신규 신고 차트 -->
            <div class="dashboard-item" id="box4">
                <h2>신규 신고</h2>
                <div class="chart-container">
                </div>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/admin/common/js/admin.js"></script>
    
</body>
</html>
