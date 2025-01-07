package com.ttrip.auth.oauth2;

import com.ttrip.auth.exception.CustomOAuth2AuthenticationException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.IOException;

@Component
public class CustomOAuth2AuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                        AuthenticationException exception) throws IOException, ServletException {

        if (exception.getCause() instanceof CustomOAuth2AuthenticationException) {
            CustomOAuth2AuthenticationException customEx =
                    (CustomOAuth2AuthenticationException) exception.getCause();

            String redirectUrl = UriComponentsBuilder.fromPath("/signup/oauth2")
                    .queryParam("email", customEx.getEmail())
                    .queryParam("provider", customEx.getRegistrationId())
                    .queryParam("providerId", customEx.getProviderId())
                    .queryParam("name", customEx.getName())
                    .queryParam("error", customEx.getMessage())
                    .build().encode()
                    .toUriString();

            getRedirectStrategy().sendRedirect(request, response, redirectUrl);
        } else {
            super.onAuthenticationFailure(request, response, exception);
        }
    }
}
