<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

</style>
<script type="text/javascript">

//	BoardDomain 글 읽어오기 -> error(empty bd를 찾을 수 없음)
	
//	if(${empty.cd}){
//		alert("글을 가져오는데 문제가 발생하였습니다.")
//		location.href="../ttrip/boardlist/mainBoardlist.jsp"
//	}

	// 게시글 신고 버튼 
    $('#report-button').click(function() {
        const confirmReport = confirm("이 게시글을 신고하시겠습니까?");
        if (confirmReport) {
            window.location.href = '../ttrip/boardlist/registerBoard.jsp';
        }//end if
    });//click
    
	$(function(){
	
 	 //좋아요 기능 추가
	$("like-button").click(function(){
		likeUp();
	});//click

	$("#comment-toggle").click(function(){
		movePage('c'); //댓글 달기
	});//click

	$("#delete-toggle").click(function(){
		movePage('d'); //글 삭제하기
	});//click

	$.("#modify-toggle").click(function(){
		movePage('m') //글 수정하기
	});//click
	
	
	
    
	listComm();
	
	 // 댓글 버튼 클릭 이벤트(ajax로 처리)
    $('#comment-toggle').click(function () {
        $('.comment-input').toggle(); // 입력창 표시/숨기기 토글
    });

    // 페이지 로드 시 입력창 숨기기
    $('.comment-input').hide();
    
    
    var detail=$("#detail").val();
    var boardID="${comment.boardID}"
    var param="detail="+detail+"&boardID="+boardID;
    
    $.ajax{(
    	type:"POST"	
    	url:"/ttrip/comment/comment_insert",
    	data:param,
    	success:function(){
    		alert("댓글이 등록되었습니다.");
    		listComm(); 
    	}
    )};//ajax
});//click
    
    // 신고 버튼 기능
    $(document).on('click', '.report-icon', function() {
        const confirmReport = confirm("이 댓글을 신고하시겠습니까?");
        if (confirmReport) {
            window.location.href = '../boardlist/registerBoard.jsp';
        }
    });
 
	//게시글 목록 버튼 클릭 이벤트: 버튼 클릭시 상세보기
	
});//ready
	
	//페이지 이동
function movePage(){
    var msg="글을 수정하시겠습니까?";
    
    if(flag == 'd'){
        msg="정말 글을 삭제하시겠습니까?";
    } // end if
    
    if(confirm(msg)){
        if(flag == 'm'){ //comment 댓글 작성
            location.href="../ttrip/boardlist/writeBoardlist.jsp";
        } // end if

        if(flag  == 'c'){ //modify 수정
            modifyBoard();
        } else {
            removeBoard();
        } // end else
    } // end if
} // end movePage

	//게시판 글 삭제
	function removeBoard(){
		var nick=${"#nick"}.val();
	
		if(nick.trim() ==""){
			alert("삭제는 닉네임 입력이 필수입니다.");
			return;
		}//end if
	
		
		<%--$.ajax({
		    url: "/ttrip/boardlist/deleteBoard",
		    type: "POST", // 수정된 부분
		    data: param,
		    dataType: "JSON",
		    error: function(xhr){
		        alert(xhr.status);
		    },
		    success: function(jsonObj){
		        var msg = jsonObj.removeCount + "건이";
		        if(jsonObj.removeFlag){
		            msg += "삭제되었습니다.";
		        } else {
		            msg = "삭제되지 않았습니다.\n작성자 비밀번호를 확인해주세요.";
		        }
		        
		        $("#pass").val("");
		        alert(msg);
		        
		        if(jsonObj.removeFlag){
		            moveBoardList();
		        }
		    }
		}); --%>

		
		//좋아요 기능 추가
		function likeUp({
			
		let check; 
		// 기존에 좋아요 체크 X (빈하트)  : 0
        // 기존에 좋아요 체크 O (꽉찬하트) : 1
		
        
        //contains("클래스명"):클래스가 있으면 true, 없으면 false
        if(e.target.classList.contains("fa-regular")) { // 좋아요 체크 X (빈하트)
            check = 0;
        } else{ // 좋아요 체크 O (꽉찬하트)
            check = 1;
        }
       	
     	// ajax 코드 작성
        fetch("", { 
            method : "POST",
            headers : {"Content-Type" : "application/json"},
            body : JSON.stringify(data)
        })
        .then(response => response.text()) // 응답 객체를 필요한 형태로 파싱하여 리턴
        .then(count => {
            console.log("count : " + count);

            if(count == -1){ // INSERT, DELETE 실패 시
                console.log("좋아요 처리 실패");
                return;
            }

            // toggle() : 클래스가 있으면 없애고, 없으면 추가하고
            e.target.classList.toggle("fa-regular");
            e.target.classList.toggle("fa-solid");

            // 현재 게시글의 좋아요 수를 화면에 출력
            e.target.nextElementSibling.innerText = count;

        }) // 파싱된 데이터를 받아서 처리하는 코드 작성

        .catch(err => {
            console.log("예외 발생");
            console.log(err);

        }) // 예외 발생 시 처리하는 부분
    })
        
		}//likeUp
		
}//end removeBoard 

	function modifyBoard(){
	
		url:"POST",
		data:param
		dataType:"JSON",
		error:function(xhr){
			alert(xhr.status);
		},
		success:function(jsonObj){
			var msg = jsonObj.modifyCount+ "건이";
			if(jsonObj.modifyFlag){
				msg+="변경되었습니다.";
			}else{
				msg="변경되지 않았습니다.";
			}//end else
				
			$("#pass").val("");
			
			alert( msg )
		}
		
	});//ajax
	
}//modifyBoard

    // 자유게시판으로 이동하는 함수 정의
    function Onhome() {
        window.location.href = "..ttrip/boardlist/mainBoardlist.jsp"; // 이동할 페이지 경로
    }
    
       
        
        
</script>  
<body>
<div class="board-container">
    <div class="header-icons">
        <img src="../ttrip/boardlist/images/home.png" alt="Home" onclick="Onhome()" width="30">
    </div>
    <form name="readFrm" id="readFrm" method="post">
    <div class="post-header">
        <div class="post-author">
        <c:out value="${bd.nick}"/>
        mangni<!-- ❤ -->
                <span id="total-like-count">
        <!-- 좋아요 누른 적 없거나, 로그인 x -->
        	<c:if test="${empty lickCnt}">
        		<i class="fa-regular fa-heart" id="commentLike"></i>
        	</c:if>
        <!-- 좋아요 누른 적이 있을 때 -->
        	<c:if test="${!empty lickCnt}">
        		<i class="fa-regular fa-heart" id="commentLike"></i>
        	</c:if>
        <span>${bd.likeCnt}"</span>
        0</span>
        <!-- 원본 게시글 신고 버튼 -->
            <img src="../ttrip/boardlist/images/siren.png" id="report-button" class="report-icon">
        </div>
        <div class="post-time"><fmt:formatDate value="${bd.inputData}"/>3시간 전</div>
    </div>
    <div class="post-content">
    <c:out value="${bd.title}"/>
    <!-- 게시판 제목 -->
        제주 5박 6일 혼자 여행해보려는데 무엇을 하면 좋을까요?!!
    </div>
    <div class="interaction-buttons">
    <!-- 하트 -->
        <button id="like-button" class="btn btn-outline-primary">❤️<span id="like-count">0</span></button>
    <!-- 댓글 -->
        <button id="comment-toggle" class="btn btn-outline-secondary">댓글</button>
    <!-- 수정 -->    
        <button id="modify-toggle" class="btn btn-sm btn-success">수정</button>
    <!-- 삭제 -->    
        <button id="delete-toggle" class="btn btn-sm btn-danger">삭제</button>
    </div>
    <div class="comment-section">
        <div class="comment-input">
            <input type="text" id="comment-input" placeholder="댓글을 작성해주세요">
            <button id="add-comment" class="btn btn-success">완료</button>
        </div>
    </div>
    </form>
   
    <!-- 가 데이터 댓글 -->
    <div class="comments">
  		<div class="comment">
    	<div class="content">
     	 <header class="top">
        <div class="username">우연히 들어온 사람</div>
         <img src="../ttrip/boardlist/images/siren.png" class="report-icon comment-report" data-id="${comment.id}">
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
         <img src="../ttrip/boardlist/images/siren.png" class="report-icon comment-report" data-id="${comment.id}">
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
</body>
</html>
