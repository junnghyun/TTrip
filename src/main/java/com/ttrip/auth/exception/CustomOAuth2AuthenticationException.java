package com.ttrip.auth.exception;

import org.springframework.security.oauth2.core.OAuth2AuthenticationException;

public class CustomOAuth2AuthenticationException extends OAuth2AuthenticationException {

    private final String email;
    private final String registrationId;

    // 기본 생성자
    public CustomOAuth2AuthenticationException(String message) {
        super(message);
        this.email = null;
        this.registrationId = null;
    }

    // 이메일과 로그인 출처를 포함하는 생성자
    public CustomOAuth2AuthenticationException(String message, String email, String registrationId) {
        super(message);
        this.email = email;
        this.registrationId = registrationId;
    }

    public String getEmail() {
        return email;
    }

    public String getRegistrationId() {
        return registrationId;
    }
}
