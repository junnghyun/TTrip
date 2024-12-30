package com.ttrip.auth.oauth2;

import com.ttrip.auth.exception.CustomOAuth2AuthenticationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.net.URLEncoder;

@Component
public class CustomOAuth2AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        String errorMessage = "Authentication failed. Please try again.";
        String email = null;
        String registrationId = null;

        // OAuth2AuthenticationException 처리
        if (exception.getCause() instanceof CustomOAuth2AuthenticationException) {
            CustomOAuth2AuthenticationException customException = (CustomOAuth2AuthenticationException) exception.getCause();
            errorMessage = customException.getMessage();
            email = customException.getEmail();
            registrationId = customException.getRegistrationId();
        }

        // 실패 이유와 이메일, 로그인 출처를 URL에 포함시켜서 리디렉션 (회원가입 페이지로 보낼 수 있음)
        String redirectUrl = "/signup/outh2?error=" + URLEncoder.encode(errorMessage, "UTF-8");

        if (email != null) {
            redirectUrl += "&email=" + URLEncoder.encode(email, "UTF-8");
        }

        if (registrationId != null) {
            redirectUrl += "&registrationId=" + URLEncoder.encode(registrationId, "UTF-8");
        }

        // 실패한 경우 해당 URL로 리디렉션
        getRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }
}
