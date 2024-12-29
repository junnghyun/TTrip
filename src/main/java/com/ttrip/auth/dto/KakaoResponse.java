package com.ttrip.auth.dto;

import java.util.Map;

public class KakaoResponse implements OAuth2Response {

    private final Map<String, Object> attributes;
    private final Map<String, Object> kakaoAccount;
    private final Map<String, Object> profile;

    public KakaoResponse(Map<String, Object> attributes) {
        this.attributes = attributes;
        this.kakaoAccount = (Map<String, Object>) attributes.get("kakao_account");
        this.profile = (Map<String, Object>) kakaoAccount.get("profile");
    }

    @Override
    public String getProvider() {
        return "kakao";
    }

    @Override
    public String getProviderId() {
        return attributes.get("id").toString();  // 고유 사용자 ID
    }

    @Override
    public String getEmail() {
        return kakaoAccount.get("email").toString();  // 이메일
    }

    @Override
    public String getName() {
        return profile.get("nickname").toString();  // 닉네임
    }
}