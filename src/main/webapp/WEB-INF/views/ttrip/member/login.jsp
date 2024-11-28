<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<!-- Coding by CodingLab | www.codinglabweb.com-->
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Responsive Login and Signup Form </title>

  <!-- CSS -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/ttrip/member/login.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/common/footer/assets/css/footer.css">


  <!-- Boxicons CSS -->
  <link href='https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css' rel='stylesheet'>

</head>

<body>
<section class="container forms">
  <div class="form login">
    <div class="form-content">
      <header>Login</header>
      <form action="#">
        <div class="field input-field">
          <input type="email" placeholder="Email" class="input">
        </div>

        <div class="field input-field">
          <input type="password" placeholder="Password" class="password">
          <i class='bx bx-hide eye-icon'></i>
        </div>

        <div class="form-link">
          <a href="#" class="forgot-pass">Forgot password?</a>
        </div>

        <div class="field button-field">
          <button>Login</button>
        </div>
      </form>

      <div class="form-link">
        <span>Don't have an account? <a href="#" class="link signup-link">Signup</a></span>
      </div>
    </div>

    <div class="line"></div>

    <div class="media-options">
      <a href="#" class="field kakao">
        <img src="${pageContext.request.contextPath}/ttrip/member/images/kakao_logo.png" alt="Kakao" class="kakao-img">
        <span>Login with Kakao</span>
      </a>
    </div>

    <div class="media-options">
      <a href="#" class="field naver">
        <img src="${pageContext.request.contextPath}/ttrip/member/images/naver_logo.png" alt="Naver" class="naver-img">
        <span>Login with Naver</span>
      </a>
    </div>

  </div>

  <!-- Signup Form -->

  <div class="form signup">
    <div class="form-content">
      <header>Signup</header>
      <form action="#">
        <div class="field input-field">
          <input type="email" placeholder="Email" class="input">
        </div>

        <div class="field input-field">
          <input type="password" placeholder="Create password" class="password">
        </div>

        <div class="field input-field">
          <input type="password" placeholder="Confirm password" class="password">
          <i class='bx bx-hide eye-icon'></i>
        </div>

        <div class="field button-field">
          <button>Signup</button>
        </div>
      </form>

      <div class="form-link">
        <span>Already have an account? <a href="#" class="link login-link">Login</a></span>
      </div>
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
</section>
<jsp:include page="../common/footer.jsp"/>
<!-- JavaScript -->
<script type="text/javascript" src="${pageContext.request.contextPath}/ttrip/member/login.js"></script>

</body>

</html>