<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 로그인</title>
    <style>
        :root {
            --bg-color: #f0f0f0;
            --container-bg-color: white;
            --text-color: #333;
            --input-border-color: #ddd;
            --button-bg-color: #007bff;
            --button-hover-bg-color: #0056b3;
        }

        .dark-mode {
            --bg-color: #333;
            --container-bg-color: #444;
            --text-color: #f0f0f0;
            --input-border-color: #555;
            --button-bg-color: #0056b3;
            --button-hover-bg-color: #003d82;
        }

        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: var(--bg-color);
            color: var(--text-color);
            transition: background-color 0.3s, color 0.3s;
        }
        .login-container {
            background-color: var(--container-bg-color);
            padding: 3rem;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0,0,0,0.1);
            width: 400px;
            max-width: 90%;
        }
        h1 {
            text-align: center;
            margin-bottom: 2rem;
            font-size: 2rem;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        input {
            margin: 15px 0;
            padding: 15px;
            border: 2px solid var(--input-border-color);
            border-radius: 8px;
            background-color: var(--container-bg-color);
            color: var(--text-color);
            font-size: 1rem;
        }
        button {
            background-color: var(--button-bg-color);
            color: white;
            border: none;
            padding: 15px;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 20px;
            font-size: 1.1rem;
            transition: background-color 0.3s;
        }
        button:hover {
            background-color: var(--button-hover-bg-color);
        }
        #toggleMode {
            position: absolute;
            top: 20px;
            right: 20px;
            background-color: transparent;
            border: 2px solid var(--text-color);
            color: var(--text-color);
            padding: 10px 15px;
            font-size: 0.9rem;
            cursor: pointer;
        }
        .error-message {
            color: #dc3545;
            text-align: center;
            margin-top: 10px;
            display: none;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<button id="toggleMode">라이트/다크 모드</button>
<div class="login-container">
    <h1>관리자 로그인</h1>
    <form id="loginForm">
        <input type="text" id="id" name="id" placeholder="관리자 아이디" required>
        <input type="password" id="password" name="password" placeholder="비밀번호" required>
        <button type="submit">로그인</button>
    </form>
    <p id="errorMessage" class="error-message"></p>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // 다크모드 관리
        const toggleModeButton = document.getElementById('toggleMode');
        toggleModeButton.addEventListener('click', function() {
            document.body.classList.toggle('dark-mode');
            if (document.body.classList.contains('dark-mode')) {
                localStorage.setItem('mode', 'dark');
            } else {
                localStorage.setItem('mode', 'light');
            }
        });

        // 저장된 다크모드 설정 적용
        if (localStorage.getItem('mode') === 'dark') {
            document.body.classList.add('dark-mode');
        }

        // 로그인 폼 제출 처리
        const loginForm = document.getElementById('loginForm');
        const errorMessage = document.getElementById('errorMessage');

        loginForm.addEventListener('submit', function(e) {
            e.preventDefault();

            const formData = {
                id: document.getElementById('id').value,
                password: document.getElementById('password').value
            };

            console.log('Form data:', formData); // 폼 데이터 확인

            $.ajax({
                url: '/api/admin/login',  // 관리자 로그인 API 엔드포인트
                type: 'POST',
                data: JSON.stringify(formData),  // 로그인 정보
                contentType: 'application/json; charset=utf-8',  // 요청 타입
                dataType: 'json',  // 응답 데이터 타입
                success: function(response) {
                    if (response && response.status === 'success') {
                        // 토큰을 로컬스토리지에 저장
                        localStorage.setItem('jwt_token', response.token);
                        console.log('Token received:', response.token);

                        // 관리자 대시보드로 리다이렉션
                        const token = localStorage.getItem('jwt_token');
                        window.location.href = '/admin/dashboard';
                        if (token) {
                            fetch('/admin/dashboard', {
                                method: 'GET',
                                headers: {
                                    'Authorization': 'Bearer ' + token // 토큰을 Authorization 헤더로 전송
                                }
                            })
                                .then(response => {
                                    if (!response.ok) {
                                        throw new Error('Failed to fetch dashboard');
                                    }
                                    return response.json(); // Only parse as JSON if the response is valid
                                })
                                .then(data => {
                                    // 대시보드 처리
                                    console.log(data);
                                })
                                .catch(error => {
                                    console.error('Error:', error);
                                });
                        } else {
                            // 토큰이 없으면 로그인 페이지로 리다이렉트
                            window.location.href = '/login';
                        }
                    } else {
                        // 로그인 실패 시 메시지 표시
                        errorMessage.textContent = response.message || '로그인에 실패했습니다.';
                        errorMessage.style.display = 'block';
                    }
                },
                error: function(error) {
                    // AJAX 요청 실패 시 에러 메시지 표시
                    console.log('Login error:', error);
                    errorMessage.textContent = '서버 연결에 실패했습니다.';
                    errorMessage.style.display = 'block';
                }
            });
        });
    });
</script>
</body>
</html>
