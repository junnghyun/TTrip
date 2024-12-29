$(document).ready(function() {
    // Password visibility toggle
    $('.eye-icon').click(function() {
        const passwordField = $(this).siblings('.password');
        const type = passwordField.attr('type') === 'password' ? 'text' : 'password';
        passwordField.attr('type', type);
        $(this).toggleClass('bx-hide bx-show');
    });

    // Signup form submission
    $('#signupForm').submit(function(event) {
        event.preventDefault();

        const email = $('.input[type="email"]').val();
        const password = $('.password').eq(0).val();
        const confirmPassword = $('.password').eq(1).val();

        // Password validation
        if (password !== confirmPassword) {
            alert('Passwords do not match!');
            return;
        }

        // Email availability check and signup process
        $.ajax({
            url: "/api/signup",
            type: "POST",
            data: JSON.stringify({
                email: email,
                password: password
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                if (response.status === "error") {
                    alert(response.message);
                } else {
                    // If email is available, submit form to next page
                    const form = $('<form></form>');
                    form.attr('method', 'post');
                    form.attr('action', '/signup/user');

                    // Add email and password as hidden input
                    const emailInput = $('<input>').attr({
                        type: 'hidden',
                        name: 'email',
                        value: email
                    });

                    const passwordInput = $('<input>').attr({
                        type: 'hidden',
                        name: 'password',
                        value: password
                    });

                    form.append(emailInput);
                    form.append(passwordInput);
                    $('body').append(form);
                    form.submit();
                }
            },
            error: function(xhr) {
                if (xhr.responseJSON) {
                    alert(xhr.responseJSON.message);
                } else {
                    alert('회원가입 처리 중 오류가 발생했습니다.');
                }
            }
        });
    });
});
