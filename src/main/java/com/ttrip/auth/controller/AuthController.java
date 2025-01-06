package com.ttrip.auth.controller;

import com.ttrip.auth.dto.AdminLoginRequest;
import com.ttrip.auth.service.AdminAuthService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ttrip.auth.dto.LoginRequest;
import com.ttrip.auth.dto.LoginResponse;
import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.auth.service.AuthService;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class AuthController {

    private final JwtUtil jwtUtil;
    private final AuthService authService;
    private final AdminAuthService adminAuthService;

    public AuthController(AuthService authService, AdminAuthService adminAuthService, JwtUtil jwtUtil) {
        this.authService = authService;
        this.adminAuthService = adminAuthService;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest loginRequest) {
        try {
            // AuthService를 사용하여 인증 및 토큰 생성
            String token = authService.authenticateUser(loginRequest);

            // 응답 생성
            LoginResponse response = new LoginResponse(
                    "success",
                    "Login successful",
                    token
            );

            return ResponseEntity.ok()
                    .header("Authorization", "Bearer " + token)
                    .body(response);

        } catch (Exception e) {
            LoginResponse response = new LoginResponse(
                    "error",
                    e.getMessage(),
                    null
            );
            return ResponseEntity.badRequest().body(response);
        }
    }

    @GetMapping("/validate-token")
    public ResponseEntity<?> validateToken(@RequestHeader("Authorization") String authorization) {
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            return ResponseEntity.badRequest()
                    .body(Map.of("status", "invalid", "message", "Invalid or missing Authorization header"));
        }

        String token = authorization.split(" ")[1];

        if (jwtUtil.isExpired(token)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("status", "expired", "message", "Token expired"));
        }

        return ResponseEntity.ok(Map.of("status", "valid"));
    }

    @PostMapping("/admin/login")
    public ResponseEntity<LoginResponse> adminLogin(@RequestBody AdminLoginRequest loginRequest) {
        try {
            String token = adminAuthService.authenticateAdmin(loginRequest);

            LoginResponse response = new LoginResponse(
                    "success",
                    "Admin login successful",
                    token
            );

            return ResponseEntity.ok()
                    .header("Authorization", "Bearer " + token)
                    .body(response);

        } catch (Exception e) {
            LoginResponse response = new LoginResponse(
                    "error",
                    e.getMessage(),
                    null
            );
            return ResponseEntity.badRequest().body(response);
        }
    }
}
