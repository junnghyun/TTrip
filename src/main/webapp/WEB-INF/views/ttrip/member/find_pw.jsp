<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         info="비밀번호 찾기 페이지"
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <style type="text/css">
        .cont_header {
            padding-top: 75px;
            text-align: center;
            font-size: 14px;
            font-family: Arial, nbgr, '나눔바른고딕', sans-serif;
            line-height: 24px;
        }

        .pw_find_wrap {
            margin: 0 auto;
            max-width: 900px;
            width: 100%;
            padding: 50px 20px;
            border-top: 1px solid #222;
            background-color: #f8f8f8;
        }

        .find_handy {
            max-width: 500px;
            margin: 0 auto;
            text-align: center;
        }

        .btn.btn_em {
            background-color: #333;
            color: #fff;
            height: 40px;
            padding: 0 15px;
            border: 1px solid #333;
            border-radius: 3px;
            margin-top: 20px;
            width: 100%;
            max-width: 375px;
            transition: background-color 0.3s;
        }

        .btn.btn_em:hover {
            background-color: #555;
        }

        .cont_area {
            padding-top: 60px;
        }

        .h2_tit {
            line-height: 50px;
            margin-bottom: 30px;
        }

        .input_txt {
            margin-bottom: 15px;
            display: block;
        }

        .text {
            width: 100%;
            max-width: 375px;
            padding: 8px 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            transition: border-color 0.3s;
        }

        .text:focus {
            outline: none;
            border-color: #333;
        }

        .error-message {
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            const $email = $('#email');
            const $birth = $('#birth');
            const $phone = $('#phone');
            const $form = $('#findPwForm');

            function validateEmail(email) {
                const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return re.test(email);
            }

            function formatBirthDate(value) {
                if (value.length === 8) {
                    return value.slice(0, 4) + '-' + value.slice(4, 6) + '-' + value.slice(6);
                }
                return value;
            }

            function showError($element, message) {
                const $error = $element.siblings('.error-message');
                $error.text(message).show();
                $element.addClass('is-invalid');
            }

            function clearError($element) {
                const $error = $element.siblings('.error-message');
                $error.hide();
                $element.removeClass('is-invalid');
            }

            $birth.on('input', function() {
                this.value = this.value.replace(/[^0-9]/g, '');
                if (this.value.length > 8) {
                    this.value = this.value.slice(0, 8);
                }
                clearError($(this));
            });

            $phone.on('input', function() {
                this.value = this.value.replace(/[^0-9]/g, '');
                if (this.value.length > 11) {
                    this.value = this.value.slice(0, 11);
                }
                clearError($(this));
            });

            $email.on('input', function() {
                clearError($(this));
            });

            $('#btnSearch').on('click', function(e) {
                e.preventDefault();
                let isValid = true;

                // 유효성 검사
                if (!$email.val().trim()) {
                    showError($email, '이메일을 입력해주세요.');
                    isValid = false;
                } else if (!validateEmail($email.val().trim())) {
                    showError($email, '올바른 이메일 형식이 아닙니다.');
                    isValid = false;
                }

                if (!$birth.val()) {
                    showError($birth, '생년월일을 입력해주세요.');
                    isValid = false;
                } else if ($birth.val().length !== 8) {
                    showError($birth, '생년월일은 8자리여야 합니다.');
                    isValid = false;
                }

                if (!$phone.val()) {
                    showError($phone, '휴대전화번호를 입력해주세요.');
                    isValid = false;
                } else if ($phone.val().length !== 11) {
                    showError($phone, '휴대전화번호는 11자리여야 합니다.');
                    isValid = false;
                }

                if (!isValid) return;

                const birthDate = formatBirthDate($birth.val());

                $.ajax({
                    url: '/api/member/findPassword',
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({
                        email: $email.val().trim(),
                        birth: birthDate,
                        phone: $phone.val()
                    }),
                    success: function(response) {
                        if (response.status === 'success') {
                            const form = $('<form>', {
                                "method": "POST",
                                "action": "/find_pw2"
                            }).append(
                                $('<input>', {
                                    "type": "hidden",
                                    "name": "email",
                                    "value": $email.val().trim()
                                })
                            );
                            form.appendTo('body').submit();
                        } else {
                            alert('입력하신 정보가 일치하지 않습니다. 다시 시도해주세요.');
                        }
                    },
                    error: function() {
                        alert('서버 오류가 발생했습니다. 다시 시도해주세요.');
                    }
                });
            });
        });
    </script>
</head>
<body>
<div class="cont_header">
    <h1>비밀번호 찾기</h1>
    <p>비밀번호가 기억나지 않으세요? 아래 정보를 입력하시면 비밀번호를 재설정하실 수 있습니다.</p>
</div>
<div class="cont_area">
    <div class="pw_find_wrap">
        <div class="find_handy">
            <h2 class="h2_tit">비밀번호 재설정</h2>
            <form id="findPwForm" method="POST" accept-charset="UTF-8">
                <span class="input_txt">
                    <input type="email" class="text" id="email" name="email" placeholder="이메일을 입력해주세요">
                    <div class="error-message"></div>
                </span>
                <span class="input_txt">
                    <input type="text" class="text" id="birth" name="birth"
                           placeholder="법정생년월일 8자리(YYYYMMDD)를 입력해주세요" maxlength="8">
                    <div class="error-message"></div>
                </span>
                <span class="input_txt">
                    <input type="text" class="text" id="phone" name="phone"
                           placeholder="휴대전화번호 010포함 11자리를 입력해주세요" maxlength="11">
                    <div class="error-message"></div>
                </span>
                <div class="btn_sec">
                    <button type="button" class="btn btn_em" id="btnSearch">비밀번호 재설정</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>