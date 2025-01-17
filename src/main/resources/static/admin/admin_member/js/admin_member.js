
function deleteMember() {
    const userConfirmed = confirm("삭제하시겠습니까?");
    if (userConfirmed) {
        deleteItem(); // 삭제 기능 실행
    }
}


function closeMemverModal() {
    document.getElementById('MemberModal').style.display = 'none';
    
    // Tailwind CSS 제거 
    const tailwindLink = document.getElementById('tailwindCSS');
    if (tailwindLink) {
        document.head.removeChild(tailwindLink);
    }
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    const modal = document.getElementById('.modal-overlay');
    if (event.target === modal) {
        closeMemverModal();
    }
};



function deleteMember(memberId) {
    if (confirm(memberId + '를 삭제하시겠습니까?')) {
        // AJAX를 사용하여 삭제 요청
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'deleteMember.jsp', true);
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function() {
            if (xhr.status === 200) {
                alert('회원이 삭제되었습니다.');
                location.reload();
            } else {
                alert('회원 삭제에 실패했습니다.');
            }
        };
        xhr.send('id=' + memberId);
    }
}