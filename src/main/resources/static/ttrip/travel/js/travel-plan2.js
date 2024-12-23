// script.js
$(document).ready(function() {
    function addAuthHeader(xhr) {
        const token = localStorage.getItem('jwt_token');
        if (token) {
            xhr.setRequestHeader('Authorization', 'Bearer ' + token);
        }
    }
});

const startDateInput = document.getElementById("start-date");
const endDateInput = document.getElementById("end-date");
const timeSelection = document.getElementById("time-selection");
const completeButton = document.getElementById("complete-button");

startDateInput.addEventListener("change", handleDateChange);
endDateInput.addEventListener("change", handleDateChange);

function handleDateChange() {
    const startDate = new Date(startDateInput.value);
    const endDate = new Date(endDateInput.value);

    if (startDateInput.value) {
        const maxEndDate = new Date(startDate);
        maxEndDate.setDate(maxEndDate.getDate() + 3);
        endDateInput.min = startDateInput.value;
        endDateInput.max = maxEndDate.toISOString().split("T")[0];
    }

    if (endDateInput.value) {
        const minStartDate = new Date(endDate);
        minStartDate.setDate(minStartDate.getDate() - 3);
        startDateInput.min = minStartDate.toISOString().split("T")[0];
        startDateInput.max = endDateInput.value;
    }

    if (startDateInput.value && endDateInput.value) {
        displayTimeSelection(startDate, endDate);
    }
}

function displayTimeSelection(startDate, endDate) {
    timeSelection.innerHTML = ""; // 기존 내용 초기화
    let currentDate = new Date(startDate);

    while (currentDate <= endDate) {
        const dateStr = `${currentDate.getMonth() + 1}월 ${currentDate.getDate()}일`;

        const timeBlock = document.createElement("div");
        timeBlock.className = "time-block";

        timeBlock.innerHTML = `
      <span>${dateStr}</span>
      <div class="time-input">
        <input type="text" id="trip_text" placeholder="일정의 제목을 입력해주세요.">
      </div>
    `;

        timeSelection.appendChild(timeBlock);
        currentDate.setDate(currentDate.getDate() + 1); // 하루씩 증가
    }

    completeButton.classList.remove("hidden");
}

// "시간 설정 완료" 버튼 클릭 시 페이지 이동
completeButton.addEventListener("click", () => {
    const selectedDates = {
        startDate: startDateInput.value,
        endDate: endDateInput.value,
    };

    // 날짜 범위를 localStorage에 저장
    localStorage.setItem("selectedDates", JSON.stringify(selectedDates));
    window.location.href = "/tr3";
});
