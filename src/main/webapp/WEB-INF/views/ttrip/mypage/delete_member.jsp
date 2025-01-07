<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"
		 info="개인정보를 변경하기 전 비밀번호 인증 페이지"
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 탈퇴</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<style type="text/css">
		.cont_header {
			padding-top: 75px;
			text-align: center;
			font-size: 14px;
			font-family: Arial, nbgr, '나눔바른고딕', '돋음';
			line-height: 24px;
		}
		.pw_wrap {
			margin:0px auto;
			width: 900px;
			padding: 50px;
			border-top: 1px solid #222;
			background-color: #f8f8f8;
		}
		.find_handy {
			width:500px;
			height:270px;
			margin-top: 40px;
			margin: 0px auto;
			text-align: center;
		}
		.em {
			color: #ee6900;
			font-weight: bold;
		}
		.btn.btn_accept {
			background-color: #333;
			color: #fff;
			height: 40px;
			cursor: pointer;
			border: 1px solid #333;
			border-radius: 3px;
			margin-top: 30px;
			width: 180px;
			margin-left: 5px;
		}
		.btn.btn_pw {
			background-color: #FFF;
			color: #000;
			height: 40px;
			cursor: pointer;
			border: 1px solid #333;
			border-radius: 3px;
			margin-top: 30px;
			width: 180px;
			margin-right: 5px;
		}
		.cont_area {
			padding-top: 60px;
		}
		.pw {
			font-size: 21px;
			font-family: Arial, nbgr, '나눔바른고딕', '돋음';
			font-weight: bold;
		}
	</style>
	<script type="text/javascript">
		function validateAndSubmit() {
			if (confirm("정말로 탈퇴하시겠습니까?")) {
				// JWT 토큰을 로컬 스토리지나 세션에서 가져오기
				var token = localStorage.getItem("jwt_token");  // JWT 토큰을 로컬스토리지에 저장했다고 가정

				if (!token) {
					alert("토큰이 존재하지 않습니다.");
					return;
				}

				// 비밀번호를 포함한 JSON 요청을 서버에 보냄
				$.ajax({
					type: "POST",
					url: "/user/api/delete", // RestController에서 처리할 URL
					contentType: "application/json",
					headers: {
						"Authorization": "Bearer " + token  // JWT 토큰을 헤더에 포함
					},
					data: JSON.stringify({
						password: $("#password").val() // 비밀번호를 JSON으로 전송
					}),
					success: function(response) {
						if(response.success) {
							alert(response.message);  // 탈퇴 완료 메시지
							localStorage.removeItem('jwt_token');
							location.href = '/'; // 메인 페이지로 이동
						} else {
							alert(response.message);  // 오류 메시지
						}
					},
					error: function() {
						alert("서버 오류가 발생했습니다.");
					}
				});
			}
		}
	</script>

</head>
<body>
<div class="cont_header">
	<h1>회원 탈퇴</h1>
	<p>회원 탈퇴 신청 전 유의사항을 확인하세요.</p>
</div>
<div class="cont_area">
	<div class="pw_wrap">
		<div class="find_handy">
			<p class="pw">회원 탈퇴 전 꼭 읽어주세요</p><br>
			<p>회원 탈퇴를 하시면 회원 약관 및 개인정보 제공, 활용에 관한<br> 약관 동의가 모두 철회되며<br>
				모든 제휴 브랜드의 회원 서비스 및 웹사이트로부터 탈퇴됩니다.<br>
				유의 및 안내 사항을 모두 확인하였으며, 탈퇴 시 위 사항에<br> 동의한 것으로 간주합니다.</p>

			<p><strong>비밀번호 입력</strong></p>
			<input type="password" id="password" class="form-control" placeholder="비밀번호를 입력하세요" required><br>

			<div>
				<button type="button" class="btn btn_pw" id="btn_pw" onclick="javascript:history.back()">취소</button>
				<button type="button" class="btn btn_accept" id="btn_accept" onclick="validateAndSubmit()">탈퇴</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>
