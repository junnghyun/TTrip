$(document).ready(function() {
    // Password visibility toggle
    $('.eye-icon').click(function() {
        const passwordField = $(this).siblings('.password');
        const type = passwordField.attr('type') === 'password' ? 'text' : 'password';
        passwordField.attr('type', type);
        $(this).toggleClass('bx-hide bx-show');
    });

    // Login form submission
    $('#loginForm').submit(function(event) {
        event.preventDefault();

        const email = $('.input[type="email"]').val();
        const password = $('.password').val();

        $.ajax({
            url: "/api/auth",
            type: "POST",
            data: JSON.stringify({
                email: email,
                password: password
            }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function(response) {
                if(response.status === 'success') {
                    alert('Login successful!');
                    window.location.href = "/";
                } else {
                    alert('Login failed: ' + response.message);
                }
            },
            error: function(error) {
                console.log(error);
                alert('Error during login process');
            }
        });
    });
});