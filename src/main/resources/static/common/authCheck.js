$(document).ready(function() {
    // 권한이 필요한 페이지에서 토큰 체크
    function checkAuthAndRedirect() {
        const token = localStorage.getItem('jwt_token');
        if (!token) {
            alert('로그인이 필요한 서비스입니다.');
            window.location.href = '/login'; // 로그인 페이지로 리디렉션
            return;
        }

        // 모든 AJAX 요청에 JWT 토큰을 헤더에 추가
        $.ajaxSetup({
            beforeSend: function(xhr) {
                const token = localStorage.getItem('jwt_token');
                if (token) {
                    xhr.setRequestHeader('Authorization', 'Bearer ' + token);
                }
            }
        });


        // 토큰 유효성 검증
        $.ajax({
            url: '/api/validate-token', // 토큰을 검증하는 서버 API
            type: 'GET',
            success: function(response) {
                if (response.status !== 'valid') {
                    localStorage.removeItem('jwt_token');
                    alert('세션이 만료되었습니다. 다시 로그인해주세요.');
                    window.location.href = '/login'; // 로그인 페이지로 리디렉션
                }
            },
            error: function() {
                localStorage.removeItem('jwt_token');
                alert('인증에 실패했습니다. 다시 로그인해주세요.');
                window.location.href = '/login'; // 로그인 페이지로 리디렉션
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
