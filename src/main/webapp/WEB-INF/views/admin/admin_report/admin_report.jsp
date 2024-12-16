<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 신고 관리</title>
<link rel="stylesheet" type="text/css" href="../common/css/admin.css?after">
<link rel="stylesheet" type="text/css" href="css/admin_ad.css?after">
<link rel="stylesheet" href="../common/css/main.min.css">
<script src="js/admin_ad.js" defer></script>
</head>
<body>
<jsp:include page="../common/admin.jsp" />
<div class="common_admin">
<h1>신고 관리</h1>
</div>
<div class="ad-summary">
   
</div>
<div class="order-management">
<div class="ad-filter">
    <input type="text" placeholder="신고자 닉네임 검색" class="search-bar">
    <button class="search-btn">검색</button>
    <div class="add-ad-btn">
    <button class="kbc-button kbc-button-xxs" onclick="filterReports('글')" >글</button>
    <button class="kbc-button kbc-button-xxs" onclick="filterReports('댓글')">댓글</button>
    </div> 
     <div class="filter-buttons">
            <button class="kbc-button kbc-button-sm" onclick="filterByStatus('처리 중')">처리 중</button>
            <button class="kbc-button kbc-button-sm" onclick="filterByStatus('처리 완료')">처리 완료</button>
        </div>
</div>
			
<table class="ad-table">
    <thead>
        <tr>
            <th>신고일</th>
            <th style="width: 150px;">신고자</th>
            <th style="width: 180px;">신고글</th>
            <th>상태</th>
            <th>처리일</th>
            <th style="width: 150px;">관리</th>
        </tr>
    </thead>
     <tbody id="reportTableBody">
        <tr>
                <td>2024-12-01</td>
                <td>user1</td>
                <td>신고글 내용 1</td>
                <td>
                    <div class="status-select">
                      <label><input type="radio" name="status1" value="블라인드"> 블라인드</label>
                        <label><input type="radio" name="status1" value="반려"> 반려</label>
                        <label><input type="radio" name="status1" value="대기중" checked> 대기중</label>
                    </div>
                </td>
                <td>2024-12-03</td>
                <td>
                 <div class="action-buttons">
                        <button class="action-btn" onclick="chkAsComplete()">확인</button>
                        <button class="action-btn" onclick="markAsComplete()">처리</button>
                    </div>
                </td>
            </tr>
            <tr>
                <td>2024-12-02</td>
                <td>user2</td>
                <td>신고댓글 내용 2</td>
                <td>
                    <div class="status-select">
                        <label><input type="radio" name="status2" value="블라인드"> 블라인드</label>
                        <label><input type="radio" name="status2" value="반려"> 반려</label>
                        <label><input type="radio" name="status2" value="대기중" checked> 대기중</label>
                    </div>
                </td>
                <td>2024-12-04</td>
                <td>
                    <div class="action-buttons">
                        <button class="action-btn" onclick="chkAsComplete()">확인</button>
                        <button class="action-btn" onclick="markAsComplete()">처리</button>
                    </div>
                </td>
            </tr>
        </tbody>
    </table>
</div>
<script>
    // 신고 상태 필터링
    function filterByStatus(status) {
        const rows = document.querySelectorAll("#reportTableBody tr");
        rows.forEach(row => {
            const statusCell = row.querySelector(".status-select input:checked").value;
            row.style.display = statusCell === status ? "" : "none";
        });
    }

    // 글/댓글 필터링
    function filterReports(type) {
        const rows = document.querySelectorAll("#reportTableBody tr");
        rows.forEach(row => {
            const contentCell = row.cells[2].innerText;
            row.style.display = contentCell.includes(type) ? "" : "none";
        });
    }

    // 가상 처리 버튼 동작
    function markAsComplete() {
        alert("처리가 완료되었습니다.");
    }
</script>
</body>
</html>
       