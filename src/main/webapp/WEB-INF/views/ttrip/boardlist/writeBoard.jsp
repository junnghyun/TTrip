<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ site_kor }</title>
<link rel="shortcut icon" href="${ defaultURL }common/images/favicon.ico">
<link rel = "stylesheet" type = "text/css" href="${ defaultURL }common/css/main_20240911.css"/>
<!-- bootstrap CDN 시작 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--JQuery 시작-->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type='text/javascript' src="<?= JS_DIR ?>/summernote.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
<style type="text/css"> 

</style>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 작성</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
<style>
  #wrap {
    width: 80%;
    margin: 0 auto;
    margin-top: 20px;
  }
  .category, .title, .writeMain {
    margin-bottom: 20px;
  }
  .category label {
    font-weight: bold;
    margin-right: 10px;
  }
  .title input[type="text"] {
    width: 100%;
    height: 40px;
    padding: 5px 10px;
    font-size: 16px;
    border: 1px solid #ddd;
    border-radius: 5px;
  }
  .writeMain textarea {
    width: 100%;
    height: 200px;
    border: 1px solid #ddd;
    border-radius: 5px;
  }
  .buttons {
    margin-top: 20px;
    text-align: right;
  }
  .buttons button {
    margin-left: 10px;
  }
</style>
<script>
  $(function() {
    // Summernote 편집기 초기화
    $('#summernote').summernote({
      tabsize: 2,
      height: 120,
      toolbar: [
        ['style', ['style']],
        ['font', ['bold', 'underline', 'clear']],
        ['color', ['color']],
        ['para', ['ul', 'ol', 'paragraph']],
        ['table', ['table']],
        ['insert', ['link', 'picture', 'video']],
        ['view', ['fullscreen', 'codeview', 'help']]
      ]
    });
  });
  
  //적용하기 버튼 클릭
  $("#btnWrite").click(function(){
	  chkNull();
  });//click
  
  //취소하기 버튼 클릭시 메인 페이지로 이동
  $("#btnBack").click(function(){
	  location.href="../boardlist/mainBoardlist.jsp";
  });//click
  
  function chkNull(){
		if($("#subject").val().trim()==""){
			alert("제목은 필수 입력");
			$("#subject").focus();
			return;
		}//end if
		
		if($("#contents").val().trim()==""){
			alert("내용은 필수 입력");
			return;
		}//end if
		
		$("#btnWrite").submit();
	}//chkNull 
  
  
</script>
</head>
<body>
<div id="wrap">
  <h2>게시판 글 작성</h2>

  <!-- 카테고리 -->
  <div class="category">
    <label for="category">카테고리</label>
    <select id="category" name="category" class="form-select" style="width: 200px; display: inline-block;">
      <option value="question">질문</option>
      <option value="recommendation">추천</option>
      <option value="free">자유</option>
    </select>
  </div>

  <!-- 제목 -->
  <div class="title">
    <label for="title">제목</label>
    <input type="text" id="title" name="title" placeholder="제목을 입력하세요">
  </div>

  <!-- 내용 -->
  <div class="writeMain">
    <label for="contents">내용</label>
    <textarea id="summernote" id="contents" name="contents"></textarea>
  </div>

  <!-- 버튼 -->
  <div class="buttons">
    <button type="button" id="btnBack"  class="btn btn-secondary">취소하기</button>
    <button type="button" id="btnWrite" class="btn btn-primary">적용하기</button>
  </div>
</div>
</body>
</html>
