<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관광 웹사이트</title>
    <style>
   * {
       margin: 0;
       padding: 0;
       box-sizing: border-box;
       font-family: 'Noto Sans KR', sans-serif;
   }

   body {
       min-height: 100vh;
   }

   .header {
       position: fixed;
       width: 100%;
       top: 0;
       z-index: 1000;
       background-color: #FFFFFF;
       box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
   }

   .header::before,
   .header::after {
       content: '';
       position: absolute;
       top: 0;
       width: calc((100% - 1200px) / 2);
       height: 100%;
       background-color: #FFFFFF;
   }

   .header::before {
       left: 0;
   }

   .header::after {
       right: 0;
   }
       
   .header-wrapper {
       height: 70px;
       margin-bottom: 50px;
   }
       
   .nav-container {
       max-width: 1200px;
       margin: 0 auto;
       display: flex;
       align-items: center;
       padding: 0 20px;
       height: 70px;
       background-color: #FFFFFF;
       position: relative;
   }

   .logo {
       display: flex;
       align-items: center;
       text-decoration: none;
       color: #333;
       font-weight: bold;
       font-size: 24px;
       margin-right: 110px;
   }

   .nav-menu {
       display: flex;
       list-style: none;
       gap: 10px;
       position: relative;
       width: 800px;
   }

   .nav-item {
       position: relative;
       flex: 1;
   }

   .nav-link {
       color: #4F4F4F;
       text-decoration: none;
       font-size: 18px;
       font-weight: 600;
       padding: 25px 0;
       display: block;
       transition: color 0.3s ease;
       white-space: nowrap;
   }

   .nav-link:hover {
       color: #000000;
   }

   .mega-menu {
       position: fixed;
       top: 70px;
       left: 0;
       width: 100%;
       background-color: #f4f6f8;
       box-shadow: 0 4px 24px rgba(0, 0, 0, 0.1);
       opacity: 0;
       visibility: hidden;
       transition: all 0.3s ease;
       padding: 30px 0;
   }

   .nav-menu:hover .mega-menu {
       opacity: 1;
       visibility: visible;
   }

   .mega-menu-container {
       max-width: 1200px;
       margin: 0 auto;
       display: flex;
       justify-content: space-between;
       width: 800px;
       padding: 0 20px;
   }

   .mega-menu-column {
       min-width: 160px;
       flex: 1;
       display: flex;
       flex-direction: column;
       align-items: flex-start;
   }

   .mega-menu-item {
       display: inline-block;
       padding: 12px 0;
       color: #4F4F4F;
       text-decoration: none;
       font-size: 16px;
       font-weight: 600;
       transition: all 0.2s ease;
       white-space: nowrap;
       position: relative;
   }

   .mega-menu-item::after {
       content: '';
       position: absolute;
       width: 0;
       height: 2px;
       bottom: 8px;
       left: 0;
       background-color: #000000;
       transition: width 0.2s ease;
   }

   .mega-menu-item:hover::after {
       width: 100%;
   }

   .mega-menu-item:hover {
       color: #000000;
   }

   .auth-buttons {
       margin-left: auto;
       display: flex;
       gap: 12px;
   }

   .auth-link {
       text-decoration: none;
       padding: 8px 16px;
       border-radius: 6px;
       font-size: 14px;
       font-weight: 500;
       transition: all 0.3s ease;
       white-space: nowrap;
   }

   .login {
       color: #666;
   }

   .signup {
       background-color: #2D63E2;
       color: white;
   }

   .login:hover {
       background-color: #f8f9fa;
       color: #333;
   }

   .signup:hover {
       background-color: #1a4cbd;
   }

   .nav-link.active {
       color: #000000;
   }
</style>
</head>
<body>
<div class="header-wrapper">
    <header class="header">
        <nav class="nav-container">
            <a href="#" class="logo">
                <img src="${pageContext.request.contextPath}/common/header/images/logo.png" alt="로고" style="height: 40px;">
            </a>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="#" class="nav-link" style=" margin-left:20px;">추천코스</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" style=" margin-left:10px;">여행지 정보</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" style=" margin-left:0px;">여행코스</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" style=" margin-left:0px;">게시판</a>
                </li>
                <div class="mega-menu">
                    <div class="mega-menu-container">
                        <div class="mega-menu-column">
                            <a href="#" class="mega-menu-item">나의코스</a>
                            <a href="#" class="mega-menu-item">월간Best30</a>
                            <a href="#" class="mega-menu-item">여행 게시판</a>
                        </div>
                        <div class="mega-menu-column">
                            <a href="#" class="mega-menu-item">지역정보</a>
                        </div>
                        <div class="mega-menu-column">
                            <a href="#" class="mega-menu-item">여행지 선택</a>
                        </div>
                        <div class="mega-menu-column">
                            <a href="#" class="mega-menu-item">자유게시판</a>
                            <a href="#" class="mega-menu-item">질문게시판</a>
                            <a href="#" class="mega-menu-item">추천게시판</a>
                        </div>
                    </div>
                </div>
            </ul>
            <div class="auth-buttons">
                <a href="#" class="auth-link login">로그인</a>
                <a href="#" class="auth-link signup">회원가입</a>
            </div>
        </nav>
    </header>
</div>
</body>
</html>