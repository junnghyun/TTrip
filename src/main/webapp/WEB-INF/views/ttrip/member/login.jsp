<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/member/login/login.css">
    <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<section class="container">
    <div class="form login">
        <div class="form-content">
            <header>Login</header>
            <form id="loginForm">
                <div class="field input-field">
                    <input type="email" placeholder="Email" class="input" required>
                </div>

                <div class="field input-field">
                    <input type="password" placeholder="Password" class="password" required>
                    <i class='bx bx-hide eye-icon'></i>
                </div>

                <div class="form-link">
                    <a href="/find_pw" class="forgot-pass">Forgot password?</a>
                </div>

                <div class="field button-field">
                    <button type="submit">Login</button>
                </div>
            </form>

            <div class="form-link">
                <span>Don't have an account? <a href="/signup" class="link">Signup</a></span>
            </div>

            <div class="line"></div>

            <div class="media-options">
                <a href="/oauth2/authorization/kakao" class="field kakao">
                    <img src="${pageContext.request.contextPath}/ttrip/member/images/Kakao.png" alt="Kakao" class="kakao-img">
                    <span>Login with Kakao</span>
                </a>
            </div>

            <div class="media-options">
                <a href="/oauth2/authorization/naver" class="field naver">
                    <img src="${pageContext.request.contextPath}/ttrip/member/images/Naver.png" alt="Naver" class="naver-img">
                    <span>Login with Naver</span>
                </a>
            </div>
        </div>
    </div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/ttrip/member/login/login.js"></script>
</body>
</html>
