package com.ttrip.auth.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.dto.*;
import com.ttrip.auth.exception.CustomOAuth2AuthenticationException;
import com.ttrip.auth.repository.UserRepository;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    private final UserRepository userRepository;

    public CustomOAuth2UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        String registrationId = userRequest.getClientRegistration().getRegistrationId();

        OAuth2Response oAuth2Response = switch (registrationId) {
            case "naver" -> new NaverResponse(oAuth2User.getAttributes());
            case "kakao" -> new KakaoResponse(oAuth2User.getAttributes());
            default -> throw new OAuth2AuthenticationException("Unsupported provider");
        };

        String email = oAuth2Response.getEmail();
        User user = userRepository.findByEmail(email);

        if (user == null) {
            UserDto tempDto = createTempUserDto(email, oAuth2Response.getName());
            throw new CustomOAuth2AuthenticationException(
                    "회원가입이 필요합니다",
                    email,
                    registrationId,
                    oAuth2Response.getProviderId(),
                    oAuth2Response.getName()
            );
        }

        return new CustomOAuth2User(convertToUserDto(user));
    }

    private UserDto createTempUserDto(String email, String name) {
        UserDto dto = new UserDto();
        dto.setEmail(email);
        dto.setName(name);
        dto.setRole("USER");
        return dto;
    }

    private UserDto convertToUserDto(User user) {
        UserDto dto = new UserDto();
        dto.setEmail(user.getEmail());
        dto.setName(user.getNick());
        dto.setRole(user.getRole());
        return dto;
    }
}
