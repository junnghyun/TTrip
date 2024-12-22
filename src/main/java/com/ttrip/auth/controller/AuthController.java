package com.ttrip.auth.controller;

import com.ttrip.auth.dto.LoginRequest;
import com.ttrip.auth.dto.LoginResponse;
import com.ttrip.auth.service.AuthService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api")
public class AuthController {

    private final AuthService authService;

    public AuthController(AuthService authService) {
        this.authService = authService;
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

            return ResponseEntity.ok(response);

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
