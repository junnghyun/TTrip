<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행코스 메인 페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">
/* 기존 CSS 유지 */
.title {
    margin-top: 50px;
    font-weight: bold;
    font-size: 40px;
    margin-bottom: 2rem;
    text-align: center;
}
.cont {
    border: 3px black solid;
    width: 800px;
    text-align: center;
    margin: 50px auto;
}
.top {
    text-align: center;
    padding: 30px;
}
ul {
    padding: 29px 0 0;
}
li {
    list-style-type: none;  
}
input[type="button"] {
    height: 105px;
    width: 110px;
    border-radius: 50%;
    margin: 15px 5px;
    font-size: 20px;
    font-weight: bold;
    background-color: #F5F6F7;
    border-style: none;
}
input[type="button"]:hover {
    background-color: #C0C0C0; /* 호버 효과 */
}
#btn18 {
    background-color: #202020;
    color: #fff;
    border-radius: 0%;
    height: 50px;
}
</style>
<script type="text/javascript">
$(function() {
    // 선택된 여행지 저장
    let selectedRegion = "";

    $("input[type='button']").not("#btn18").click(function() {
        // 모든 버튼 초기화
        $("input[type='button']").not("#btn18").css("background-color", "#F5F6F7").css("color", "#000");
        // 선택된 버튼 스타일 변경
        $(this).css("background-color", "#333333").css("color", "#fff");
        // 선택된 값 저장
        selectedRegion = $(this).val();
    });

    $("#btn18").click(function() {
        if (selectedRegion === "") {
            alert("여행지를 선택해 주세요.");
        } else {
            // 폼에 값 설정 후 전송
            $("#regionForm input[name='region']").val(selectedRegion);
            $("#regionForm").submit();
        }
    });
});
</script>
</head>
<body>
<div id="wrap">

<h1 class="title">기존에 경험하지 못한<br>새로운 여행 플래너</h1>

<div class="cont">
<div class="top">
<span style="color: #808080;">이번 여행, 어디로 떠나볼까요?</span>
<h3><strong>여행을 떠나고 싶은 지역을 </strong>선택해 주세요.</h3>
</div>

    <div class="select_area">
        <form id="regionForm" method="post" action="nextPage.jsp">
            <input type="hidden" name="region" value="">
        </form>
        <ul>
            <li>
                <input type="button" id="btn1" name="btn1" value="서울" />
                <input type="button" id="btn2" name="btn2" value="부산" />
                <input type="button" id="btn3" name="btn3" value="대구" />
                <input type="button" id="btn4" name="btn4" value="인천" />
                <input type="button" id="btn5" name="btn5" value="광주" />
                <input type="button" id="btn6" name="btn6" value="대전" />
            </li>
            <li>
                <input type="button" id="btn7" name="btn7" value="울산" />
                <input type="button" id="btn8" name="btn8" value="세종" />
                <input type="button" id="btn9" name="btn9" value="경기" />
                <input type="button" id="btn10" name="btn10" value="강원" />
                <input type="button" id="btn11" name="btn11" value="충북" />
                <input type="button" id="btn12" name="btn12" value="충남" />
            </li>
            <li>
                <input type="button" id="btn13" name="btn13" value="전북" />
                <input type="button" id="btn14" name="btn14" value="전남" />
                <input type="button" id="btn15" name="btn15" value="경북" />
                <input type="button" id="btn16" name="btn16" value="경남" />
                <input type="button" id="btn17" name="btn17" value="제주" />
            </li>
        </ul>
        <input type="button" id="btn18" name="btn18" value="다음" />
    </div>
</div>

</div>
</body>
</html>
