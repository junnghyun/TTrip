<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="자유게시판 메인화면" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--JQuery 시작-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


<style>
    body {
        margin: 20px;
        font-family: Arial, sans-serif;
    }
    
    .header{
    	width: 1000px; 
    	height: 80px;
    	
    }
    
    .title{
    	font-weight: bold; 
    }
    
    .header-title{
    	width: 1000px;
    	height: 80px;
    }
    
    .title {
        text-align: center;
        margin-bottom: 30px;
    }
    .table-container {
        margin: 0 auto;
        width: 80%;
        text-align: center;
        
    }
    .actions-container {
        margin: 20px 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .actions-container input[type="text"] {
        width: 50%;
        max-width: 300px;
        padding: 5px 30px 5px 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        background: url('../common/images/search.png') no-repeat right center;
        background-size: 20px 20px;
    }
    .write-btn {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 5px 15px;
        border-radius: 4px;
        text-decoration: none;
        margin-left: 20px;
    }
    .write-btn:hover {
        background-color: #0056b3;
    }
    .clickable-title {
        color: #007bff;
        cursor: pointer;
        text-decoration: underline;
    }
    .clickable-title:hover {
        color: #0056b3;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<div class="header">
<!-- header: 미리 비워두기 1000/80 -->

</div>
<div class="title">
    <h2>자유게시판</h2>
</div>
<div class="header-title">
<!-- header-title : 자유게시판 제목 위와 header 아래 비움 -->
</div>
<!-- container 위치 조정: 카테고리 -->
<div class="table-container">
    <table class="table table-hover">
        <thead>
            <tr>
                <th style="width:10%">No</th>
                <th style="width:20%">카테고리</th>
                <th style="width:50%">제목</th>
                <th style="width:20%">작성시간</th>
            </tr>
        </thead>
        <tbody id="board-content">
            <tr>
                <td>1</td>
                <td>자유</td>
                <td>
                    <a href="/boardlist/commentBoard" class="clickable-title">제주가려고 하는데...질문요</a>
                </td>
                <td>2023-07-31</td>
            </tr>
            <tr>
                <td>2</td>
                <td>자유</td>
                <td>
                    <a href="/boardlist/commentBoard" class="clickable-title">최근에 피크닉으로 유명해진 노들섬</a>
                </td>
                <td>2024-04-01</td>
            </tr>
            <tr>
                <td>3</td>
                <td>질문</td>
                <td>
                    <a href="/boardlist/commentBoard" class="clickable-title">대전에 핫플있을까요?</a>
                </td>
                <td>2024-06-21</td>
            </tr>
        </tbody>
    </table>
</div>
<div class="actions-container">
<!-- actions-container 위치 조정:	검색, 글쓰기 영역 -->
    <input type="text" id="search-input" placeholder="Search" />
    <button type="button" class="write-btn" onclick="location.href='writeBoard.jsp'">글쓰기</button>
</div>
<script>
$(document).ready(function() {
    // 검색 기능
    $('#search-input').on('keyup', function() {
        var value = $(this).val().toLowerCase();
        $('#board-content tr').filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    // 제목 클릭 이벤트 (추가적인 페이지 이동 처리 가능)
    $('.clickable-title').on('click', function(e) {
        e.preventDefault(); // 기본 동작 막기
        const url = $(this).attr('href'); // href 값 가져오기
        console.log(`Navigating to: ${url}`);
        window.location.href = ""; // 페이지 이동
    });
});
</script>
</body>
</html>