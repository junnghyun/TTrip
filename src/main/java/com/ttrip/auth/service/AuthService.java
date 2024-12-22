package com.ttrip.auth.service;

import com.ttrip.auth.dto.LoginRequest;
import com.ttrip.auth.jwt.JwtUtil;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Iterator;

@Service
public class AuthService {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public AuthService(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }

    public String authenticateUser(LoginRequest loginRequest) throws Exception {
        // 인증 시도
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getEmail(),
                        loginRequest.getPassword()
                )
        );

        // 권한 가져오기
        Iterator<? extends GrantedAuthority> iterator = authentication.getAuthorities().iterator();
        String role = iterator.next().getAuthority();

        // JWT 토큰 생성
        return jwtUtil.createJwt(authentication.getName(), role, 60 * 60 * 10L);
    }
}
