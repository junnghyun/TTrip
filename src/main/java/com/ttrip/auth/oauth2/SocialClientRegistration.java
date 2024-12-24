package com.ttrip.auth.oauth2;

import org.springframework.context.annotation.Bean;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.core.AuthorizationGrantType;

public class SocialClientRegistration {

    @Bean
    public ClientRegistration naverClientRegistration() {
        return ClientRegistration.withRegistrationId("naver")
                .clientId("tE0OaG039gtLyIXOFS32")
                .clientSecret("uOK0TNvJnZ")
                .redirectUri("{baseUrl}/login/oauth2/code/naver")
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .scope("name", "email")
                .authorizationUri("https://nid.naver.com/oauth2.0/authorize")
                .tokenUri("https://nid.naver.com/oauth2.0/token")
                .userInfoUri("https://openapi.naver.com/v1/nid/me")
                .userNameAttributeName("response")
                .clientName("Naver")
                .build();
    }

    @Bean
    public ClientRegistration kakaoClientRegistration() {
        return ClientRegistration.withRegistrationId("kakao")
                .clientId("d7888bf5f8b1cb00e302ad100b9343eb")
                .clientSecret("QJ3ANp5A4tfMhqY6kFaMPQLMMCWgHPNl")
                .redirectUri("{baseUrl}/login/oauth2/code/kakao")
                .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
                .scope("account_email", "profile_nickname")  // 필요한 scope 추가
                .authorizationUri("https://kauth.kakao.com/oauth/authorize")
                .tokenUri("https://kauth.kakao.com/oauth/token")
                .userInfoUri("https://kapi.kakao.com/v2/user/me")
                .userNameAttributeName("id")  // 카카오에서 기본적으로 사용하는 식별자
                .clientName("Kakao")
                .build();
    }
}
