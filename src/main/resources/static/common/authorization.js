// main.js 또는 공통 js 파일 생성
$(document).ready(function() {
    // 페이지 로드 시 토큰 확인
    const token = localStorage.getItem('jwt_token');
    if (token) {
        // 토큰 유효성 검증을 위한 API 호출
        $.ajax({
            url: "/api/validate-token",  // 토큰 검증 엔드포인트 필요
            type: "GET",
            beforeSend: function(xhr) {
                xhr.setRequestHeader('Authorization', 'Bearer ' + token);
            },
            success: function(response) {
                console.log('Token is valid');
            },
            error: function(error) {
                console.log('Token validation failed');
                localStorage.removeItem('jwt_token');
                window.location.href = "/login";  // 로그인 페이지로 리다이렉트
            }
        });
    }
});