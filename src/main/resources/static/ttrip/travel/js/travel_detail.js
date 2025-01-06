document.addEventListener("DOMContentLoaded", () => {
    const placesData = JSON.parse('<%= placesJson %>');
    const accommodationsData = JSON.parse('<%= accommodationsJson %>');

	const buttons = document.querySelectorAll('.dayBtn');
	    const dayContent = document.getElementById('dayContent');

	    // DOM 요소 확인
	    if (!buttons.length) {
	        console.error("No buttons with class 'dayBtn' found.");
	        return;
	    }
	    if (!dayContent) {
	        console.error("Element with ID 'dayContent' not found.");
	        return;
	    }

    buttons.forEach(button => {
        button.addEventListener('click', () => {
            const day = button.getAttribute('data-day');
            console.log(`Selected Day: ${day}`);

            // JSON 데이터 접근
            const dayPlaces = placesData[day.toString()] || [];
            const dayAccommodations = accommodationsData[day.toString()] || [];

            console.log('Day Places:', dayPlaces);
            console.log('Day Accommodations:', dayAccommodations);

            // HTML 생성
            let contentHtml = `<h3>${day}일차 상세 정보</h3><ul>`;
            if (dayPlaces.length > 0) {
                contentHtml += '<li><strong>여행지:</strong></li>';
                dayPlaces.forEach(place => {
                    if (place.trim()) { // 유효한 데이터만 추가
                        contentHtml += `<li>${place}</li>`;
                    }
                });
            } else {
                contentHtml += `<li>여행지 정보가 없습니다.</li>`;
            }

            if (dayAccommodations.length > 0) {
                contentHtml += '<li><strong>숙소:</strong></li>';
                dayAccommodations.forEach(acc => {
                    if (acc.trim()) { // 유효한 데이터만 추가
                        contentHtml += `<li>${acc}</li>`;
                    }
                });
            } else {
                contentHtml += `<li>숙소 정보가 없습니다.</li>`;
            }
            contentHtml += '</ul>';

            console.log('Generated HTML:', contentHtml);

            // HTML 업데이트
            dayContent.innerHTML = contentHtml;

            // 버튼 스타일 업데이트
            buttons.forEach(btn => btn.classList.remove('selected'));
            button.classList.add('selected');
        });
    });
});
