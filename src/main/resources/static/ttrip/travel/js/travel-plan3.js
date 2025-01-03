let selectedDay = null; // 사용자가 선택한 일차를 저장할 변수
let currentListener = null; // 현재 추가된 일차 선택 이벤트 리스너를 추적

const selectedDates = JSON.parse(localStorage.getItem("selectedDates"));
const selectedRange = document.getElementById("selected-range");
if (!selectedRange) {
    console.error("Element with ID 'selected-range' not found in the DOM.");
}



if (selectedDates) {
	
    const startDate = new Date(selectedDates.startDate);
    const endDate = new Date(selectedDates.endDate);
	
    selectedRange.textContent = `${formatDate(startDate)} ~ ${formatDate(endDate)}`;

    const dayPlanSidebar = document.querySelector('.day-plan-sidebar');
    let currentDate = new Date(startDate);
    let dayCounter = 1;

    // 날짜 범위에 따라 일차를 동적으로 생성
    while (currentDate <= endDate) {
        const dayPlanDiv = document.createElement("div");
        dayPlanDiv.className = "day-plan";
        dayPlanDiv.id = `day${dayCounter}`;

        dayPlanDiv.innerHTML = `
      <span id="daycont"><h2>${dayCounter}일차</h2></span>
      <ul class="place-list"></ul>
      <ul class="accommodation-list" style="display: none;"></ul> <!-- 숙소 리스트는 처음엔 숨김 -->
    `;

        dayPlanSidebar.appendChild(dayPlanDiv);
        currentDate.setDate(currentDate.getDate() + 1);
        dayCounter++;
    }
	
    // 페이지 로드 시 장소 리스트가 먼저 보이도록 설정
    showPlaces();
}
// 날짜 포맷 함수
function formatDate(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    return `${year}.${month}.${day}`;
}

// 기존 일차 선택 리스너 제거 함수
function removeCurrentListener() {
    const dayOptions = document.querySelectorAll(".day-plan h2");

    // 현재 이벤트 리스너가 있을 경우 제거
    if (currentListener) {
        dayOptions.forEach(option => {
            option.removeEventListener("click", currentListener);
        });
    }
}

// 장소 추가 시 일차를 선택하도록 유도
function addPlaceToDayPrompt(placeName, imageUrl) {
    alert("일차를 선택해주세요.");

    // 기존의 일차 선택 이벤트 리스너를 제거
    removeCurrentListener();

    const dayOptions = document.querySelectorAll(".day-plan h2");

    // 새로운 이벤트 리스너 정의
    currentListener = function () {
        const dayNumber = this.textContent.replace("일차", "").trim();
        selectedDay = parseInt(dayNumber);

        if (selectedDay) {
            addPlaceToDay(selectedDay, placeName, imageUrl);
        }

        // 일차를 선택한 후 더 이상 같은 이벤트 리스너가 실행되지 않도록 제거
        removeCurrentListener();
    };

    // 새로운 일차 선택 이벤트 리스너 추가
    dayOptions.forEach((option) => {
        option.addEventListener("click", currentListener);
    });
}

// 숙소 추가 시 일차를 선택하도록 유도
function addAccommodationToDayPrompt(accommodationName, imageUrl) {
    alert("일차를 선택해주세요.");

    // 기존의 일차 선택 이벤트 리스너를 제거
    removeCurrentListener();

    const dayOptions = document.querySelectorAll(".day-plan h2");

    // 새로운 이벤트 리스너 정의
    currentListener = function () {
        const dayNumber = this.textContent.replace("일차", "").trim();
        selectedDay = parseInt(dayNumber);

        if (selectedDay) {
            addAccommodationToDay(selectedDay, accommodationName, imageUrl);
        }

        // 일차를 선택한 후 더 이상 같은 이벤트 리스너가 실행되지 않도록 제거
        removeCurrentListener();
    };

    // 새로운 일차 선택 이벤트 리스너 추가
    dayOptions.forEach((option) => {
        option.addEventListener("click", currentListener);
    });
}

// 장소를 선택한 일차에 추가
function addPlaceToDay(day, placeName, imageUrl) {
    const dayPlan = document.getElementById("day" + day).getElementsByClassName("place-list")[0];

    if (dayPlan.getElementsByTagName("li").length >= 2) {
        alert("하루에 최대 2개의 장소만 추가할 수 있습니다.");
        return;
    }

    const li = document.createElement("li");
    li.innerHTML = `
        <img src="${imageUrl}" alt="장소 이미지">
        <div>
            <h3>${placeName}</h3>
            <p>방문 예정</p>
        </div>
        <button class="delete-btn" onclick="removePlaceFromDay(this)">삭제</button>
    `;
    dayPlan.appendChild(li);
	console.log(dayPlan)
}

// 숙소를 선택한 일차에 추가
function addAccommodationToDay(day, accommodationName, imageUrl) {
    const dayPlan = document.getElementById("day" + day).getElementsByClassName("accommodation-list")[0];

    if (dayPlan.getElementsByTagName("li").length > 0) {
        alert("하루에 숙소는 하나만 추가할 수 있습니다.");
        return;
    }

    const li = document.createElement("li");
    li.innerHTML = `
        <div>
            <h3>${accommodationName}</h3>
            <p>숙소 예약</p>
        </div>
        <button class="delete-btn" onclick="removePlaceFromDay(this)">삭제</button>
    `;
    dayPlan.appendChild(li);
	console.log(dayPlan)
}

// 일정에서 장소/숙소를 삭제하는 함수
function removePlaceFromDay(button) {
    const li = button.closest('li');
    li.remove();
}

// 탭 전환 기능
function openTab(evt, tabName) {
    var tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tab-content");
    for (var i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tab-link");
    for (var i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";

    // 탭에 따라 리스트 표시
    if (tabName === 'location') {
        showPlaces();
    } else if (tabName === 'accommodation') {
        showAccommodations();
    }
}

function showPlaces() {
    var days = document.getElementsByClassName('day-plan');
    var totalDays = days.length;

    // 모든 일차에서 장소 리스트는 보이고, 숙소 리스트는 숨기도록 설정
    for (var i = 0; i < totalDays; i++) {
        var dayPlan = days[i];
        var placeList = dayPlan.getElementsByClassName('place-list')[0];
        var accommodationList = dayPlan.getElementsByClassName('accommodation-list')[0];
        var dayHeader = dayPlan.querySelector('h2');  // 일차 제목

        placeList.style.display = 'block';  // 장소 리스트 보이기
        accommodationList.style.display = 'none';  // 숙소 리스트 숨기기
        dayHeader.style.display = 'block';  // 일차 제목 보이기
    }

    // 마지막 일차는 보이도록 설정
    var lastDay = days[totalDays - 1];
    lastDay.style.display = 'block';  // 마지막 일차 div는 보이게
}

function showAccommodations() {
    var days = document.getElementsByClassName('day-plan');
    var totalDays = days.length;

    // 마지막 일차를 제외한 모든 일차에서 장소와 숙소 리스트를 표시
    for (var i = 0; i < totalDays - 1; i++) {
        var dayPlan = days[i];
        var placeList = dayPlan.getElementsByClassName('place-list')[0];
        var accommodationList = dayPlan.getElementsByClassName('accommodation-list')[0];
        var dayHeader = dayPlan.querySelector('h2');  // 일차 제목

        placeList.style.display = 'none';  // 장소 리스트 표시
        accommodationList.style.display = 'block';  // 숙소 리스트 표시
        dayHeader.style.display = 'block';  // 일차 제목 표시
    }

    // 마지막 일차는 숙소 리스트를 숨기고, 해당 일차 div를 숨김
    var lastDay = days[totalDays - 1];
    var lastDayAccommodationList = lastDay.getElementsByClassName('accommodation-list')[0];
    var lastDayHeader = lastDay.querySelector('h2');  // 일차 제목

    // 마지막 일차의 숙소 리스트를 숨김
    lastDayAccommodationList.style.display = 'none';
    // 마지막 일차의 전체 div를 숨김
    lastDay.style.display = 'none';
}


const finalizeButton = document.getElementById("finalize-button");
if (finalizeButton) {
    finalizeButton.addEventListener("click", function () {
        const form = document.createElement("form");
        form.method = "POST";
        form.action = "/tc";

		// region 값을 폼에 추가
		const region = document.querySelector("input[name='region']").value;
		form.innerHTML += `<input type="hidden" name="region" value="${region}">`;
		
        // 모든 일차 데이터 수집
        const dayPlans = document.querySelectorAll(".day-plan");
        dayPlans.forEach((dayPlan, index) => {
            const dayCounter = index + 1; // 일차 번호 (1일부터 시작)

            // 장소 리스트 수집
            const placeList = dayPlan.querySelectorAll(".place-list li");
            const places = Array.from(placeList).map(item => item.textContent.trim());

            // 숙소 리스트 수집
            const accommodationList = dayPlan.querySelectorAll(".accommodation-list li");
            const accommodations = Array.from(accommodationList).map(item => item.textContent.trim());

            // 수집된 데이터를 form에 추가
            form.innerHTML += `
                <input type="hidden" name="day${dayCounter}_places" value="${places.join(",")}">
                <input type="hidden" name="day${dayCounter}_accommodations" value="${accommodations.join(",")}">
				<input type="hidden" name="startDate" value="${selectedDates.startDate}">
				<input type="hidden" name="endDate" value="${selectedDates.endDate}">
            `;
        });

        console.log("Form HTML:", form.innerHTML); // 폼 데이터 확인
        document.body.appendChild(form);
        form.submit(); // 폼 제출
    });
} else {
    console.error("Finalize button not found!");
}

	

