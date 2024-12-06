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
            background-color: #f8f9fa;
        }

        .header {
	        position: fixed;
	        width: 100%;
	        top: 0;
	        z-index: 1000;
	    }
	    
	    .header-wrapper {
	        height: 70px;  /* 헤더의 실제 높이 */
	        margin-bottom: 50px;  /* 콘텐츠와의 간격 */
	    }
        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            align-items: center;
            padding: 0 20px;
            height: 70px;
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
            width: 800px; /* 메뉴 영역 너비 고정 */
        }

        .nav-item {
            position: relative;
            flex: 1; /* 각 메뉴 아이템이 동일한 너비를 가지도록 설정 */
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
            background-color: #fff;
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
            justify-content: space-between; /* 컬럼들을 균등하게 분배 */
            width: 800px; /* 메인 메뉴와 동일한 너비 */
            padding: 0 20px;
        }

        .mega-menu-column {
            min-width: 160px;
            flex: 1; /* 각 컬럼이 동일한 너비를 가지도록 설정 */
        }

        .mega-menu-item {
            display: block;
            padding: 12px 0;
            color: #4F4F4F;
            text-decoration: none;
            font-size: 16px;
            font-weight: 600; /* 서브메뉴 굵기 증가 */
            transition: color 0.2s ease;
            white-space: nowrap; /* 텍스트가 한 줄로 유지되도록 설정 */
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
            width: 100%; /* 부모 요소(텍스트)의 너비만큼만 밑줄이 그어짐 */
        }

        .mega-menu-item:hover {
            color: #000000;
        }

        .mega-menu-column {
            min-width: 160px;
            flex: 1;
            display: flex;  
            flex-direction: column;  
            align-items: flex-start; 
        }
    </style>
</head>
<body>
<div class="header-wrapper">
    <header class="header">
        <nav class="nav-container">
            <a href="#" class="logo">
                <img src="logo.png" alt="로고" style="height: 40px;">
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