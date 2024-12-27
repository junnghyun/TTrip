<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="게시글 신고" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 신고하기</title>
<link rel="shortcut icon" href="${ defaultURL }common/images/favicon.ico">
<link rel = "stylesheet" type = "text/css" href="${ defaultURL }common/css/main_20240911.css"/>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--JQuery 시작-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<style type="text/css"> 

 body {
        background-color: #f9f9f9;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        font-family: Arial, sans-serif;
    }
    .report-container {
        width: 500px;
        background: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 20px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }
    .report-container h1 {
        font-size: 18px;
        font-weight: bold;
        margin-bottom: 20px;
        text-align: center;
    }
    .report-item {
        display: flex;
        justify-content: space-between;
        padding: 10px 0;
        border-bottom: 1px solid #ddd;
    }
    .report-item:last-child {
        border-bottom: none;
    }
    .form-group {
        margin: 20px 0;
    }
    .form-group label {
        display: block;
        font-weight: bold;
        margin-bottom: 8px;
    }
    .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .radio-group {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
    }
    .radio-group label {
        font-weight: normal;
    }
    .btn-primary {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        color: #fff;
        font-weight: bold;
        border-radius: 4px;
        cursor: pointer;
    }
    .btn-primary:hover {
        background-color: #0056b3;
    }
</style>
<script>

//onclick : 신고하기 버튼 클릭시 

function handleReport() {
    if (confirm("신고하시겠습니까?")) {
        alert("신고 완료되었습니다.");
    }//end if
}//handleReport

</script>
</head>
<body>
<div class="report-container">
    <h1>게시글 신고</h1>
    <div class="report-item">
        <span>내용:</span>
        <span><c:out value="${bd.title}"/></span>
    </div>
    <div class="report-item">
        <span>작성자:</span>
        <span><c:out value="${bd.nick}"/></span>
    </div>
    <div class="form-group">
        <label>신고 사유</label>
        <div class="radio-group">
            <div>
                <input type="radio" id="reason1" name="reason" value="스팸/광고">
                <label for="reason1">스팸/광고</label>
            </div>
            <div>
                <input type="radio" id="reason2" name="reason" value="욕설/비방">
                <label for="reason2">욕설/비방</label>
            </div>
            <div>
                <input type="radio" id="reason3" name="reason" value="불법정보">
                <label for="reason3">불법정보</label>
            </div>
            <div>
                <input type="radio" id="reason4" name="reason" value="음란물">
                <label for="reason4">음란물</label>
            </div>
            <div>
                <input type="radio" id="reason5" name="reason" value="개인정보노출">
                <label for="reason5">개인정보노출</label>
            </div>
           <!--  <div>
                <input type="radio" id="reason6" name="reason" value="기타">
                <label for="reason6">기타</label>
            </div> -->
        </div>
    </div>
    <div class="form-group">
        <label for="details">상세 내용 (선택)</label>
        <textarea id="details" rows="4"></textarea>
    </div>
    <button class="btn-primary" onclick="handleReport()">신고하기</button>
</div>
</body>
</html>