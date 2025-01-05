//  <script src="${pageContext.request.contextPath}/common/authCheck.js"></script>

$(document).ready(function () {
    // 권한이 필요한 페이지에서 토큰 체크
    function checkAuthAndRedirect() {
        const token = localStorage.getItem('jwt_token');

        // 모든 AJAX 요청에 JWT 토큰을 헤더에 추가
        $.ajaxSetup({
            beforeSend: function (xhr) {
                const token = localStorage.getItem('jwt_token');
                if (token) {
                    xhr.setRequestHeader('Authorization', 'Bearer ' + token);
                }
            }
        });

        // 토큰 유효성 검증
        $.ajax({
            url: '/api/validate-token',
            type: 'GET',
            success: function (response) {
                console.log('Token validation response:', response); // 디버깅용
                if (typeof response === 'string') {
                    response = JSON.parse(response);
                }
                if (response.status !== 'valid') {
                    localStorage.removeItem('jwt_token');
                    alert('세션이 만료되었습니다. 다시 로그인해주세요.');
                    window.location.href = '/login';
                }
            },
            error: function (xhr, status, error) {
                console.error('Token validation error:', error); // 디버깅용
                localStorage.removeItem('jwt_token');
                alert('인증에 실패했습니다. 다시 로그인해주세요.');
                window.location.href = '/login';
            }
        });
    }

    // 현재 페이지 URL이 보호된 경로인지 확인
    const protectedPaths = ['/user/', '/admin/']; // 보호된 페이지 경로
    const currentPath = window.location.pathname;

    if (protectedPaths.some(path => currentPath.startsWith(path))) {
        checkAuthAndRedirect();
    }
});

