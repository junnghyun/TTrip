$(document).ready(function() {

    const token = localStorage.getItem('jwt_token');
    if (token) {
        // 이미 로그인된 상태라면 다른 페이지로 리디렉션
        window.location.href = "/";  // 예: 홈 페이지로 이동
    }

    // Password visibility toggle
    $('.eye-icon').click(function() {
        const passwordField = $(this).siblings('.password');
        const type = passwordField.attr('type') === 'password' ? 'text' : 'password';
        passwordField.attr('type', type);
        $(this).toggleClass('bx-hide bx-show');
    });

    // Login form submission
    $('#loginForm').submit(function(event) {
        event.preventDefault();

        const email = $('.input[type="email"]').val();
        const password = $('.password').val();

        // Login request
        $.ajax({
            url: "/api/login",
            type: "POST",
            data: JSON.stringify({ email: email, password: password }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                if (response.status === 'success') {
                    console.log('Token received:', response.token);
                    localStorage.setItem('jwt_token', response.token);
                    // 토큰 저장 확인
                    console.log('Stored token:', localStorage.getItem('jwt_token'));

                    // 보호된 리소스 접근 테스트
                    accessProtectedResource();

                    alert('Login successful!');
                    window.location.href = "/";
                } else {
                    alert('Login failed: ' + response.message);
                }
            },
            error: function(error) {
                console.log('Login error:', error);
                alert('Error during login process');
            }
        });
    });

    // Function to access protected resource
    function accessProtectedResource() {
        $.ajax({
            url: "/user/tr2",
            type: "GET",
            beforeSend: function(xhr) {
                const token = localStorage.getItem('jwt_token');
                console.log('Using token for request:', token);
                if (token) {
                    xhr.setRequestHeader('Authorization', 'Bearer ' + token);
                } else {
                    console.log("No token found in localStorage");
                }
            },
            success: function(response) {
                console.log('Protected resource accessed successfully:', response);
            },
            error: function(error) {
                console.log('Error accessing protected resource:', error);
                if (error.status === 403) {
                    alert('접근 권한이 없습니다.');
                } else {
                    alert('Error accessing protected resource: ' + error.statusText);
                }
            }
        });
    }
});
