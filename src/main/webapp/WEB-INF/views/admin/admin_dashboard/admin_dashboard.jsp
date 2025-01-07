<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 대시보드</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/common/css/admin.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/admin_dashboard/css/admin_dashboard.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
	.chart-container {
	    height: 400px;
	    margin: 20px;
	    padding: 10px;
	}
	.report-table {
	    width: 100%;
	    border-collapse: collapse;
	    margin-top: 20px;
	}
	
	.report-table th, 
	.report-table td {
	    padding: 12px;
	    text-align: center;
	    border: 1px solid #ddd;
	}
	
	.report-table th {
	    background-color: #f5f5f5;
	    font-weight: bold;
	}
	
	.report-table tr:hover {
	    background-color: #f9f9f9;
	}
	.table-container {
    position: relative;
    height: auto !important;
    min-height: 100px !important;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
    // 지역 추천 순위 차트
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/dashboard/getRegionData',
        type: 'GET',
        success: function(data) {
            const regionCtx = document.getElementById('regionChart').getContext('2d');
            new Chart(regionCtx, {
                type: 'bar',
                data: {
                    labels: data.map(item => item.region),
                    datasets: [{
                        label: '추천 수',
                        data: data.map(item => item.recomCount),
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgb(54, 162, 235)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1,
                                precision: 0
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });

    // 가장 많이간 여행지 차트
    $.ajax({
	    url: '${pageContext.request.contextPath}/admin/dashboard/getTopVisitedPlaces',
	    type: 'GET',
	    dataType: 'json',
	    success: function(data) {
	        const ordersCtx = document.getElementById('ordersChart').getContext('2d');
	        new Chart(ordersCtx, {
                type: 'bar',
                data: {
                    labels: data.map(item => item.dstntName),
                    datasets: [{
                        label: '방문 횟수',
                        data: data.map(item => item.visitCount),
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgb(75, 192, 192)',
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1,
                                precision: 0
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });
    
    
    $.ajax({
        url: '${pageContext.request.contextPath}/admin/dashboard/getWeeklyLoginUsers',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            const peopleCtx = document.getElementById('peopleChart').getContext('2d');
            new Chart(peopleCtx, {
                type: 'line',
                data: {
                    labels: data.map(item => item.loginDate),
                    datasets: [{
                        label: '일일 접속자 수',
                        data: data.map(item => item.userCount),
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgb(75, 192, 192)',
                        borderWidth: 2,
                        tension: 0.1
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                stepSize: 1,
                                precision: 0
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top'
                        }
                    }
                }
            });
        },
        error: function(xhr, status, error) {
            console.error('Error:', error);
        }
    });

    
    
    	<!-- 신규 현황 -->
    	$.ajax({
    	    url: '${pageContext.request.contextPath}/admin/dashboard/getPendingReports',
    	    type: 'GET',
    	    dataType: 'json',
    	    success: function(data) {
    	        // 데이터 정렬 및 준비
    	        const boardTypes = ['자유', '질문', '추천', '여행지 코스'];
    	        const chartData = boardTypes.map(type => {
    	            const found = data.find(item => item.boardType === type);
    	            return found ? found.pendingCount : 0;
    	        });

    	        const reportsCtx = document.getElementById('reportsChart').getContext('2d');
    	        new Chart(reportsCtx, {
    	            type: 'bar',
    	            data: {
    	                labels: boardTypes,
    	                datasets: [{
    	                    label: '미처리 신고 건수',
    	                    data: chartData,
    	                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
    	                    borderColor: 'rgb(255, 99, 132)',
    	                    borderWidth: 1
    	                }]
    	            },
    	            options: {
    	                responsive: true,
    	                maintainAspectRatio: false,
    	                scales: {
    	                    y: {
    	                        beginAtZero: true,
    	                        ticks: {
    	                            stepSize: 1,
    	                            precision: 0
    	                        }
    	                    }
    	                },
    	                plugins: {
    	                    legend: {
    	                        display: true,
    	                        position: 'top'
    	                    }
    	                }
    	            }
    	        });
    	    },
    	    error: function(xhr, status, error) {
    	        console.error('Error:', error);
    	    }
    	});
});
</script>

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

           <div class="dashboard-item" id="box4">
			    <h2>게시판 별 미처리 신고 현황</h2>
			    <div class="chart-container">
			        <canvas id="reportsChart"></canvas>
			    </div>
			</div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/admin/common/js/admin.js"></script>
    
</body>
</html>
