package com.ttrip.auth.jwt;

import com.ttrip.auth.dto.CustomUserDetails;
import com.ttrip.auth.service.CustomUserDetailsService;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;

public class JwtFilter extends OncePerRequestFilter {

    private final JwtUtil jwtUtil;
    private final CustomUserDetailsService customUserDetailsService;

    public JwtFilter(JwtUtil jwtUtil, CustomUserDetailsService customUserDetailsService) {
        this.jwtUtil = jwtUtil;
        this.customUserDetailsService = customUserDetailsService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String authorization = request.getHeader("Authorization");

        // Authorization 헤더 확인
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            System.out.println("Authorization header is missing or incorrect format");
            filterChain.doFilter(request, response);
            return;
        }

        String token = authorization.split(" ")[1];
        System.out.println("Token extracted: " + token);

        // 토큰 만료 체크
        if (jwtUtil.isExpired(token)) {
            System.out.println("Token is expired");
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Token is expired");
            return;
        }

        try {
            // 이메일을 통해 사용자 정보를 로드
            String email = jwtUtil.getEmail(token);
            System.out.println("Extracted email from token: " + email);

            CustomUserDetails customUserDetails = (CustomUserDetails) customUserDetailsService.loadUserByUsername(email);
            System.out.println("User details loaded for: " + customUserDetails.getUsername());

            // 인증된 사용자 정보를 SecurityContext에 설정
            Authentication authToken = new UsernamePasswordAuthenticationToken(customUserDetails, null, customUserDetails.getAuthorities());
            SecurityContextHolder.getContext().setAuthentication(authToken);

        } catch (Exception e) {
            // 예외 처리: 토큰 파싱 실패 시 Unauthorized 반환
            System.out.println("Error during token parsing or user details loading: " + e.getMessage());
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Invalid token");
            return;
        }

        // 필터 체인 계속 진행
        filterChain.doFilter(request, response);
    }
}
