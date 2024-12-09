/**
 * 
 */

// Sales Chart (Box 1)
const salesCtx = document.getElementById('salesChart').getContext('2d');
const salesChart = new Chart(salesCtx, {
    type: 'bar',
    data: {
        labels: ['Region 1', 'Region 2', 'Region 3', 'Region 4', 'Region 5'],
        datasets: [{
            label: '추천 횟수',
            data: [12, 19, 3, 5, 2], // 여기에 실제 데이터를 적용
            backgroundColor: 'rgba(75, 192, 192, 0.2)',
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// People Chart (Box 2)
const peopleCtx = document.getElementById('peopleChart').getContext('2d');
const peopleChart = new Chart(peopleCtx, {
    type: 'bar',
    data: {
        labels: ['월', '화', '수', '목', '금', '토', '일'],
        datasets: [{
            label: '누적 사용자 수',
            data: [200, 400, 300, 500, 450, 600, 700], // 여기에 실제 데이터를 적용
            backgroundColor: 'rgba(153, 102, 255, 0.2)',
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// Orders Chart (Box 3)
const ordersCtx = document.getElementById('ordersChart').getContext('2d');
const ordersChart = new Chart(ordersCtx, {
    type: 'bar',
    data: {
        labels: ['Place A', 'Place B', 'Place C', 'Place D', 'Place E'],
        datasets: [{
            label: '관심 횟수',
            data: [22, 29, 15, 10, 18], // 여기에 실제 데이터를 적용
            backgroundColor: 'rgba(255, 159, 64, 0.2)',
            borderColor: 'rgba(255, 159, 64, 1)',
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// Box 4: 신규 신고 리스트
const reportList = [
    { id: 1, title: '신고 내용 1', date: '2024-12-08', status: '반려', data: '댓글'},
    { id: 2, title: '신고 내용 2', date: '2024-12-07', status: '완료', data: '게시글' },
    { id: 3, title: '신고 내용 3', date: '2024-12-06', status: '미처리', data: '댓글' }
];

const reportContainer = document.querySelector('#box4 .chart-container');
const reportHtml = reportList.map(report => `
    <div class="report-item">
        <div class="report-content">
            <h4>${report.title}</h4>
            <p>신고일: ${report.date} | 상태: ${report.status} | ${report.data}</p>
        </div>
        <div class="report-buttons">
            <button class="btn-check" onclick="handleCheck(${report.id})">확인</button>
            <button class="btn-process" onclick="handleProcess(${report.id})">처리</button>
        </div>
    </div>
    <!-- 모달 창 구조 -->
	<div id="processModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <h2>신고 처리</h2>
	        <p>이 신고를 어떻게 처리하시겠습니까?</p>
	        <div class="modal-buttons">
	            <button class="btn-reject" id="rejectBtn">반려</button>
	            <button class="btn-confirm" id="confirmBtn">처리</button>
	        </div>
	    </div>
	</div>
`).join('');
reportContainer.innerHTML = reportHtml;

// 확인 버튼 이벤트 핸들러
function handleCheck(id) {
    alert('신고 ' + id + ' 확인되었습니다.');
    // 추가로 필요한 로직을 구현할 수 있습니다.
}

// 처리 버튼 이벤트 핸들러
function handleProcess(id) {
    alert('신고 ' + id + ' 처리되었습니다.');
    // 처리 로직을 추가할 수 있습니다.
}


// 모달 창 열기와 닫기 기능

// 모달과 닫기 버튼 요소 찾기
const modal = document.getElementById("processModal");
const closeModal = document.querySelector(".close");

// 처리 버튼 클릭 시 모달 열기
function handleProcess(id) {
    modal.style.display = "flex"; // 모달을 화면에 표시 (flex로 중앙 정렬)
    // 이곳에서 id를 활용하여 특정 신고에 대한 처리를 할 수 있음
    console.log('처리할 신고 ID: ', id);
}

// 모달 창 닫기
closeModal.onclick = function() {
    modal.style.display = "none";
}

// 모달 외부 영역을 클릭하면 모달 닫기
window.onclick = function(event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
}

// 반려 버튼 클릭 이벤트
document.getElementById("rejectBtn").onclick = function() {
    alert("신고가 반려되었습니다.");
    modal.style.display = "none"; // 모달 닫기
    // 여기에 반려 처리 로직 추가 가능
}

// 처리 버튼 클릭 이벤트
document.getElementById("confirmBtn").onclick = function() {
    alert("신고가 처리되었습니다.");
    modal.style.display = "none"; // 모달 닫기
    // 여기에 처리 완료 로직 추가 가능
}
