<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Token Display</title>
    <!-- jQuery 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/common/authCheck.js"></script>
    <style>
        .token-container {
            margin: 20px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            max-width: 800px;
        }
        .token-header {
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: bold;
        }
        .token-display {
            display: flex;
            gap: 10px;
            align-items: center;
        }
        .token-content {
            flex: 1;
            padding: 10px;
            background-color: #f5f5f5;
            border-radius: 4px;
            overflow-x: auto;
            word-break: break-all;
            margin: 0;
            font-family: monospace;
        }
        .copy-button {
            padding: 8px 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .copy-button:hover {
            background-color: #0056b3;
        }
        .token-status {
            margin-top: 10px;
            font-size: 14px;
        }
        .status-valid {
            color: green;
        }
        .status-expired {
            color: red;
        }
        .status-unknown {
            color: orange;
        }
    </style>
</head>
<body>
<div class="token-container">
    <div class="token-header">현재 저장된 Authorization Token:</div>
    <div class="token-display">
        <pre id="tokenContent" class="token-content">토큰 로딩 중...</pre>
        <button id="copyToken" class="copy-button">복사</button>
    </div>
    <div id="tokenStatus" class="token-status"></div>
</div>

<script>
    $(document).ready(function() {
        function displayToken() {
            const token = localStorage.getItem('jwt_token');
            const tokenContent = $('#tokenContent');
            const tokenStatus = $('#tokenStatus');

            if (token) {
                tokenContent.text('Bearer ' + token);

                // JWT 토큰 파싱하여 만료 시간 확인
                try {
                    const payload = JSON.parse(atob(token.split('.')[1]));
                    const expirationDate = new Date(payload.exp * 1000);
                    const now = new Date();

                    if (expirationDate > now) {
                        const timeLeft = Math.floor((expirationDate - now) / 1000 / 60);
                        tokenStatus.html(`<span class="status-valid">유효한 토큰 (만료까지 약 ${timeLeft}분 남음)</span>`);
                    } else {
                        tokenStatus.html('<span class="status-expired">만료된 토큰</span>');
                    }
                } catch (e) {
                    tokenStatus.html('<span class="status-unknown">토큰 정보를 확인할 수 없음</span>');
                    console.error('JWT 토큰 파싱 오류:', e);
                    // 유효하지 않은 토큰이면 로그인을 유도하는 처리
                    window.location.href = '/login';  // 로그인 페이지로 리디렉션
                }
            } else {
                tokenContent.text('저장된 토큰이 없습니다.');
                tokenStatus.html('<span class="status-expired">인증되지 않은 상태</span>');
                // 토큰이 없으면 로그인 페이지로 리디렉션
                window.location.href = '/login';  // 로그인 페이지로 리디렉션
            }
        }

        // 복사 버튼 기능
        $('#copyToken').click(function() {
            const token = localStorage.getItem('jwt_token');
            if (token) {
                navigator.clipboard.writeText('Bearer ' + token)
                    .then(() => {
                        alert('토큰이 클립보드에 복사되었습니다.');
                    })
                    .catch(err => {
                        console.error('클립보드 복사 실패:', err);
                        alert('클립보드 복사에 실패했습니다.');
                    });
            }
        });

        // 초기 토큰 표시
        displayToken();

        // 5초마다 토큰 상태 업데이트
        setInterval(displayToken, 5000);
    });
</script>
</body>
</html>
