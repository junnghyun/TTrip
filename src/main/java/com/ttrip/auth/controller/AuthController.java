package com.ttrip.auth.controller;

import com.ttrip.auth.dto.LoginRequest;
import com.ttrip.auth.dto.LoginResponse;
import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.auth.service.AuthService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class AuthController {

    private final JwtUtil jwtUtil;
    private final AuthService authService;

    public AuthController(AuthService authService, JwtUtil jwtUtil) {
        this.authService = authService;
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

    @GetMapping("/validate-token")
    public ResponseEntity<?> validateToken(HttpServletRequest request) {
        try {
            String authorization = request.getHeader("Authorization");
            if (authorization != null && authorization.startsWith("Bearer ")) {
                String token = authorization.substring(7);
                if (!jwtUtil.isExpired(token)) {
                    String email = jwtUtil.getEmail(token);
                    String role = jwtUtil.getRole(token);
                    return ResponseEntity.ok(Map.of(
                            "status", "valid",
                            "email", email,
                            "role", role
                    ));
                }
            }
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of(
                    "status", "invalid",
                    "message", "Invalid or expired token"
            ));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of(
                    "status", "error",
                    "message", e.getMessage()
            ));
        }
    }
}
