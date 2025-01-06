<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         info="로그인 페이지에서 이동할 수 있는 비밀번호 변경 페이지"
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>비밀번호 변경</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <style type="text/css">
        body, input, button, table {
            color: #555;
            font-size: 14px;
            font-family: Arial, nbgr, '나눔바른고딕', '돋음';
            line-height: 24px;
        }

        .h1_tit {
            font-size: 48px;
            font-family: 'cj_onlyone_new_medium';
            line-height: 48px;
            margin: 0;
            color: #222;
            font-weight: normal;
        }

        .cont_header .h_desc {
            padding-top: 30px;
            color: #555;
            font-size: 16px;
        }

        .cont_header {
            padding-top: 75px;
            text-align: center;
        }

        .cont_area {
            padding-top: 60px;
            width: 800px;
            margin: 0 auto;
        }

        .table_col {
            border-top: 1px solid #222;
        }

        .table_col table {
            width: 100%;
            border: 0 none;
            border-collapse: collapse;
        }

        caption {
            font-size: 0;
            line-height: 0;
            text-indent: -9999px;
        }

        .title {
            width: 20%;
        }

        .table_col th {
            padding-left: 40px;
            background-color: #f8f8f8;
            color: #222;
            text-align: left;
        }

        .table_col th, .table_col td {
            padding: 23px 20px 21px 20px;
            border-bottom: 1px solid #ddd;
        }

        .table_col td {
            padding: 15px 20px;
        }

        .input .input_group {
            float: left;
        }

        .input_txt {
            display: inline-block;
            height: 34px;
            padding-right: 32px;
            vertical-align: middle;
            width: 350px;
        }

        .input_txt input {
            display: block;
            width: 100%;
            height: 32px;
            padding: 0 15px;
            border: 1px solid #ddd;
            color: #888;
            font-size: 14px;
            line-height: 32px;
        }

        .box_info {
            margin-top: 60px;
            min-height: 1%;
            padding: 30px;
            background-color: #f8f8f8;
            overflow: hidden;
        }

        .btn_sec {
            margin-top: 30px;
            text-align: center;
        }

        .btn {
            display: inline-block;
            min-width: 160px;
            height: 40px;
            margin: 0 3px;
            padding: 0 15px;
            border: 1px solid #333;
            border-radius: 3px;
            background-color: #333;
            color: #fff;
            text-align: center;
            line-height: 38px;
            vertical-align: middle;
            cursor: pointer;
            transition: border .5s, background .5s, color .5s;
        }

        .error-message {
            color: red;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .password-requirements {
            margin-top: 10px;
            font-size: 12px;
        }

    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            const $newPassword = $('#new_pwd');
            const $confirmPassword = $('#new_pwd_check');
            const $form = $('#passwordForm');

            function validatePassword(password) {
                const hasLetter = /[a-zA-Z]/.test(password);
                const hasNumber = /[0-9]/.test(password);
                const isLengthValid = password.length >= 8 && password.length <= 12;

                return hasLetter && hasNumber && isLengthValid;
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

            function validatePasswordStrength(password) {
                const $requirements = $('.password-requirements');
                const hasLetter = /[a-zA-Z]/.test(password);
                const hasNumber = /[0-9]/.test(password);
                const isLengthValid = password.length >= 8 && password.length <= 12;

                $requirements.html(`
                    <div>요구사항:</div>
                    <div style="color: ${hasLetter ? 'green' : 'red'}">✓ 영문자 포함</div>
                    <div style="color: ${hasNumber ? 'green' : 'red'}">✓ 숫자 포함</div>
                    <div style="color: ${isLengthValid ? 'green' : 'red'}">✓ 8-12자리</div>
                `);
            }

            // 입력 필드 이벤트 리스너
            $newPassword.on('input', function() {
                validatePasswordStrength($(this).val());
                clearError($(this));
            });

            $confirmPassword.on('input', function() {
                clearError($(this));
            });

            $('#changePass').on('click', function (e) {
                e.preventDefault();
                let isValid = true;

                const newPassword = $newPassword.val();
                const confirmPassword = $confirmPassword.val();

                if (!validatePassword(newPassword)) {
                    showError($newPassword, "비밀번호는 영문자와 숫자를 포함한 8-12자리여야 합니다.");
                    isValid = false;
                }

                if (newPassword !== confirmPassword) {
                    showError($confirmPassword, "비밀번호가 일치하지 않습니다.");
                    isValid = false;
                }

                if (isValid) {
                    // FormData 객체 생성
                    const formData = new FormData($form[0]);

                    // AJAX 요청
                    $.ajax({
                        url: '/change-password',
                        type: 'POST',
                        data: {
                            email: $('#email').val(),
                            newPassword: newPassword,
                            confirmPassword: confirmPassword
                        },
                        success: function (response) {
                            window.location.href = '/find_pw3';
                        },
                        error: function (xhr) {
                            const errorMessage = xhr.responseJSON?.message || "비밀번호 변경 중 오류가 발생했습니다.";
                            alert(errorMessage);
                        }
                    });
                }
            });
        });
    </script>
</head>
<body>
<div class="cont_header">
    <h1 class="h1_tit">비밀번호 변경</h1>
    <p class="h_desc">고객님의 소중한 정보를 보호하기 위하여 새로운 비밀번호로 변경 후 서비스를 이용해 주세요.</p>
</div>
<div class="cont_area">
    <div class="table_col">
        <form id="passwordForm" method="POST">
            <input type="hidden" name="email" id="email" value="${email}">
            <table>
                <caption>비밀번호 변경을 위한 새 비밀번호, 새 비밀번호 확인 입력을 나타냅니다.</caption>
                <colgroup>
                    <col class='title'>
                    <col class='body'>
                </colgroup>
                <tbody>
                <tr class="input">
                    <th scope="row"><label for="new_pwd">새 비밀번호</label></th>
                    <td>
                        <div class="input_group">
                            <span class="input_txt">
                                <input type="password" id="new_pwd" name="newPassword" class="text" placeholder="새 비밀번호를 입력해주세요." value="">
                                <div class="error-message"></div>
                            </span>
                            <div class="password-requirements"></div>
                        </div>
                    </td>
                </tr>
                <tr class="input">
                    <th scope="row"><label for="new_pwd_check">새 비밀번호 확인</label></th>
                    <td>
                        <div class="input_group">
                            <span class="input_txt">
                                <input type="password" id="new_pwd_check" name="confirmPassword" class="text" placeholder="새 비밀번호를 재입력해주세요." value="">
                                <div class="error-message"></div>
                            </span>
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
        </form>
    </div>
    <dl class="box_info">
        <dt>비밀번호 변경 시 유의사항</dt>
        <dd>
            <ul>
                <li>영문자와 숫자를 조합하여 8~12자리여야 합니다.</li>
                <li>아이디와 4자리 이상 동일한 문자와 숫자는 사용이 불가합니다.</li>
            </ul>
        </dd>
    </dl>
    <div class="btn_sec">
        <button type="button" class="btn btn_em" id="changePass">비밀번호 변경</button>
    </div>
</div>
</body>
</html>