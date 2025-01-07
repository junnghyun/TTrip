$(document).ready(function() {
    let isNickAvailable = false;

    // 닉네임 중복 체크
    $('#checkNickBtn').click(function() {
        const nick = $('#nick').val();
        if (!nick) {
            alert('닉네임을 입력해주세요.');
            return;
        }

        $.ajax({
            url: '/api/checkNick',
            type: 'POST',
            data: { nick: nick },
            success: function(response) {
                if (response.available) {
                    alert('사용 가능한 닉네임입니다.');
                    isNickAvailable = true;
                } else {
                    alert('이미 사용 중인 닉네임입니다.');
                    isNickAvailable = false;
                }
            },
            error: function() {
                alert('닉네임 중복 확인 중 오류가 발생했습니다.');
                isNickAvailable = false;
            }
        });
    });

    // 회원가입 폼 제출
    $('#signupForm2').submit(function(e) {
        e.preventDefault();

        if (!isNickAvailable) {
            alert('닉네임 중복 확인을 해주세요.');
            return;
        }

        // 비밀번호 확인
        const password = $('input[name="pass"]').first().val();
        const confirmPassword = $('input[name="pass"]').last().val();

        if (password !== confirmPassword) {
            alert('비밀번호가 일치하지 않습니다.');
            return;
        }

        const formData = {
            name: $('input[name="name"]').val(),
            email: $('input[name="email"]').val(),
            nick: $('#nick').val(),
            gender: $('input[name="gender"]:checked').val(),
            phone: $('#phone').val(),
            birth: $('input[name="birthdate"]').val(),
            password: password,
            oauthProvider: $('input[name="oauthProvider"]').val(),
            oauthUserId: $('input[name="oauthUserId"]').val()
        };

        $.ajax({
            url: '/api/signup/oauth',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                alert('회원가입이 완료되었습니다.');
                window.location.href = '/login'; // 로그인 페이지로 리다이렉트
            },
            error: function(xhr) {
                alert(xhr.responseJSON?.message || '회원가입 중 오류가 발생했습니다.');
            }
        });
    });
});