package com.ttrip.auth.oauth2;

import com.ttrip.auth.dto.CustomOAuth2User;
import com.ttrip.auth.jwt.JwtUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomOAuth2LoginSuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final JwtUtil jwtUtil;

    public CustomOAuth2LoginSuccessHandler(JwtUtil jwtUtil) {
        this.jwtUtil = jwtUtil;
    }

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        // 인증된 사용자 정보에서 이메일 가져오기
        CustomOAuth2User oAuth2User = (CustomOAuth2User) authentication.getPrincipal();
        String email = oAuth2User.getEmail();
        String nick = oAuth2User.getName();
        String role = oAuth2User.getRole();

        // JWT 토큰 생성
        String token = jwtUtil.createJwt(email, role, nick);

        // 프론트엔드로 리다이렉트하면서 JWT 토큰 전달
        String redirectUrl = "http://localhost:8080?jwt_token=" + token;
        getRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }
}
