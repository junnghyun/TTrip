$(document).ready(function() {
    // 중복 확인 버튼 클릭 시
    $('.check-btn').click(function() {
        const nickname = $(this).siblings('input[name="nickname"]').val();

        // 닉네임이 비어있으면 경고 메시지
        if (!nickname) {
            alert('닉네임을 입력하세요!');
            return;
        }

        // 서버에 중복 확인 요청
        $.ajax({
            url: '/api/checkNick',
            type: 'POST',
            data: { nick: nickname },
            success: function(response) {
                if (response.isAvailable) {  // true면 사용 가능
                    alert('사용 가능한 닉네임입니다!');
                } else {  // false면 사용 중
                    alert('이미 사용 중인 닉네임입니다.');
                }
            },
            error: function(error) {
                console.log(error);
                alert('중복 확인 중 오류가 발생했습니다.');
            }
        });
    });

    // 회원가입 폼 제출
    $('#signupForm').submit(function(event) {
        event.preventDefault();  // 기본 폼 제출을 막음

        const formData = {
            name: $('input[name="name"]').val(),
            email: $('input[name="email"]').val(),
            nick: $('input[name="nickname"]').val(),
            gender: $('input[name="gender"]:checked').val(),
            phone: $('input[name="phone"]').val(),
            birth: $('input[name="birthdate"]').val(),
            password: $('input[name="password"]').val()  // 비밀번호 추가
        };


        // 서버로 전달할 데이터 준비
        $.ajax({
            url: '/api/signup/user',
            type: 'POST',
            data: JSON.stringify(formData),
            contentType: 'application/json; charset=utf-8',
            success: function(response) {
                if (response.success) {
                    alert('회원가입 성공!');
                    window.location.href = '/login';  // 성공 시 로그인 페이지로 이동
                } else {
                    alert(response.message || '회원가입 중 오류가 발생했습니다.');
                }
            },
            error: function(error) {
                console.log(error);
                alert('회원가입 중 서버오류가 발생했습니다.');
            }
        });
    });
});
