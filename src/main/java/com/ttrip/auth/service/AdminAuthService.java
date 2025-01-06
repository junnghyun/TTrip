package com.ttrip.auth.service;

import com.ttrip.auth.dto.AdminLoginRequest;
import com.ttrip.auth.jwt.JwtUtil;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class AdminAuthService {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public AdminAuthService(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }

    public String authenticateAdmin(AdminLoginRequest loginRequest) {

        System.out.println("=== Admin Login Request ===");
        System.out.println("ID: " + loginRequest.getId());
        System.out.println("Password: " + loginRequest.getPassword());
        System.out.println("=======================");

        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getId(),
                        loginRequest.getPassword()
                )
        );
        String role = authentication.getAuthorities().iterator().next().getAuthority();
        System.out.println("Role during token creation: " + role);

        // 관리자용 JWT 토큰 생성
        return jwtUtil.createAdminJwt(
                authentication.getName(),
                authentication.getAuthorities().iterator().next().getAuthority()
        );
    }
}
