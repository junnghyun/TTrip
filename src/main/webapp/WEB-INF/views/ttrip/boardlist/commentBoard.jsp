<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="게시판" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }
    .board-container {
        width: 100%;
        max-width: 700px;
        margin: 20px auto;
        background: #FFFFFF; 
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .post-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
    }
    .post-author {
        font-size: 1.2em;
        font-weight: bold;
    }
    .post-time {
        font-size: 0.9em;
        color: #777;
    }
    .post-content {
        margin: 20px 0;
        font-size: 1.1em;
    }
    .interaction-buttons {
        display: flex;
        gap: 10px;
        margin-top: 20px;
    }
    
    .comment-section {
        margin-top: 30px;
    }
    .comment-input {
        display: flex;
        align-items: center;
        gap: 10px;
    }
    .comment-input input[type="text"] {
        flex: 1;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    .comments-list {
        margin-top: 20px;
        list-style: none;
        padding: 0;
    }
    .comment-item {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-bottom: 10px;
       
    }
    .header-icons {
        display: flex;
        align-items: center;
        gap: 10px;
        margin-bottom: 20px;
    }
    .header-icons img {
        cursor: pointer;
    }
     .comment-content {
        flex: 1;
    }
    .report-icon {
        cursor: pointer;
        margin-left: 10px;
    }
    
  
  
  /* 레이아웃 - 댓글 */
.comments {
  border: 1px solid #dbdbdb;
  padding: 10px;
  
}
.comments .comment {
  border-bottom: 1px solid #dbdbdb;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 6px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  
}

 .comment-input {
   margin-bottom: 20px;
        }

.comments .comment:last-child {
  border-bottom: none;
}


/* 상단 메뉴 */
.top {
  display: flex;
  flex-direction: row;
  align-items: center;
}
.top .username {
  font-weight: bold;
}
.top .utility {
  display: flex;
  flex-direction: row;
  margin-left: auto;
}

/* 하단 메뉴 */
.bottom {
  display: flex;
  flex-direction: row;
  align-items: center;
  list-style: none;
  padding: 0;
  margin: 0;
  text-transform: uppercase;
  letter-spacing: -0.5px;
  font-weight: bold;
  font-size: 14px;
}
.bottom .divider {
  width: 1px;
  height: 20px;
  background-color: #dbdbdb;
  margin: 0 20px;
}
.bottom .menu {
  margin: 0;
  padding: 0;
  color: #bebebe;
}
.bottom .menu.show-reply {
  color: #333;
}


<script>
    // 자유게시판으로 이동하는 함수 정의
    function Onhome() {
        window.location.href = "mainBoardlist.jsp"; // 이동할 페이지 경로
    }
</script>  
  
</style>
<body>
<div class="board-container">
    <div class="header-icons">
        <img src="http://localhost/model2_project/common/images/home.png" alt="Home" onclick="Onhome()" width="30">
    </div>
    <div class="post-header">
        <div class="post-author">mangni ❤️ <span id="total-like-count">0</span>
        <!-- 원본 게시글 신고 버튼 -->
            <img src="../common/images/siren.png" id="report-button" class="report-icon">
        </div>
        <div class="post-time">3시간 전</div>
    </div>
    <div class="post-content">
        제주 5박 6일 혼자 여행해보려는데 무엇을 하면 좋을까요?!!
    </div>
    <div class="interaction-buttons">
        <button id="like-button" class="btn btn-outline-primary">❤️<span id="like-count">0</span></button>
        <button id="comment-toggle" class="btn btn-outline-secondary">댓글</button>
        <button id="modify-toggle" class="btn btn-sm btn-success">수정</button>
        <button id="delete-toggle" class="btn btn-sm btn-danger">삭제</button>
    </div>
    <div class="comment-section">
        <div class="comment-input">
            <input type="text" id="comment-input" placeholder="댓글을 작성해주세요">
            <button id="add-comment" class="btn btn-success">완료</button>
        </div>
    </div>
    
   
    <!-- 가 데이터 댓글 -->
    <div class="comments">
  		<div class="comment">
    	<div class="content">
     	 <header class="top">
        <div class="username">우연히 들어온 사람</div>
         <img src="../common/images/siren.png" class="report-icon comment-report" data-id="${comment.id}">
        <div class="utility">
        </div>
      </header>
      <p>너무 좋은 글입니다. 잘 보고 가요 !!</p>
      <ul class="bottom">
        <li class="menu time">3시간 전</li>
        <li class="divider"></li>
        <li class="menu show-reply">❤️<span id="total-like-count">0</span></li>
      </ul>
    </div>
  </div>
</div>
  <div class="comments">
  		<div class="comment">
    	<div class="content">
     	 <header class="top">
        <div class="username">우연히 들어온 사람2</div>
         <img src="../common/images/siren.png" class="report-icon comment-report" data-id="${comment.id}">
        <div class="utility">
        </div>
      </header>
      <p>강력히 추천 드립니다.</p>
      <ul class="bottom">
        <li class="menu time">2시간 전</li>
        <li class="divider"></li>
        <li class="menu show-reply">❤️<span id="total-like-count">0</span></li>
      </ul>
    </div>
  </div>
</div>      
</div>
<script>

	//자유게시판으로 이동
	function Onhome() {
    window.location.href = "mainBoardlist.jsp";
	}
       /*  // 댓글 추가 기능
        $('#add-comment').click(function() {
            const commentText = $('#comment-input').val().trim();
            if (commentText) {
                const newComment = { id: 'NewUser', text: commentText };
                initialComments.push(newComment);
                renderComments();
                $('#comment-input').val(''); // 입력창 초기화
            }
        }); */
        
        // 댓글 버튼 클릭 시 입력창 토글
   		 $(document).ready(function () {
        $('#comment-toggle').click(function () {
            $('.comment-input').toggle(); // 입력창 표시/숨기기 토글
        });

        // 페이지 로드 시 입력창 숨기기
        $('.comment-input').hide();
    });

        

        // 신고 버튼 기능
        $(document).on('click', '.report-icon', function() {
            const confirmReport = confirm("이 댓글을 신고하시겠습니까?");
            if (confirmReport) {
                window.location.href = 'registerBoard.jsp';
            }
        });

        // 게시글 신고 버튼 
        $('#report-button').click(function() {
            const confirmReport = confirm("이 게시글을 신고하시겠습니까?");
            if (confirmReport) {
                window.location.href = 'registerBoard.jsp';
            }//end if
        });//click
</script>
</body>
</html>
