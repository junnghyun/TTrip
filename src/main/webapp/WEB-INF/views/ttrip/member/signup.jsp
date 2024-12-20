<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Signup</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/member/login/login.css">
  <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
<section class="container">
  <div class="form signup">
    <div class="form-content">
      <header>Signup</header>
      <form id="signupForm">
        <div class="field input-field">
          <input type="email" placeholder="Email" class="input" required>
        </div>

        <div class="field input-field">
          <input type="password" placeholder="Create password" class="password" required>
          <i class='bx bx-hide eye-icon'></i>
        </div>

        <div class="field input-field">
          <input type="password" placeholder="Confirm password" class="password" required>
          <i class='bx bx-hide eye-icon'></i>
        </div>

        <div class="field button-field">
          <button type="submit">Signup</button>
        </div>
      </form>

      <div class="form-link">
        <span>Already have an account? <a href="/login" class="link">Login</a></span>
      </div>

      <div class="line"></div>

      <div class="media-options">
        <a href="#" class="field kakao">
          <img src="${pageContext.request.contextPath}/ttrip/member/images/kakao_logo.png" alt="Kakao" class="kakao-img">
          <span>Signup with Kakao</span>
        </a>
      </div>

      <div class="media-options">
        <a href="#" class="field naver">
          <img src="${pageContext.request.contextPath}/ttrip/member/images/naver_logo.png" alt="Naver" class="naver-img">
          <span>Signup with Naver</span>
        </a>
      </div>
    </div>
  </div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/ttrip/member/login/signup.js"></script>
</body>
</html>
