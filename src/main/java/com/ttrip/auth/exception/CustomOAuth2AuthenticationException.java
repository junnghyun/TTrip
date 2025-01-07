package com.ttrip.auth.exception;

import org.springframework.security.oauth2.core.OAuth2AuthenticationException;

public class CustomOAuth2AuthenticationException extends RuntimeException {
    private final String email;
    private final String registrationId;
    private final String providerId;
    private final String name;

    public CustomOAuth2AuthenticationException(String message, String email,
                                               String registrationId, String providerId, String name) {
        super(message);
        this.email = email;
        this.registrationId = registrationId;
        this.providerId = providerId;
        this.name = name;
    }

    public String getEmail() { return email; }
    public String getRegistrationId() { return registrationId; }
    public String getProviderId() { return providerId; }
    public String getName() { return name; }
}
