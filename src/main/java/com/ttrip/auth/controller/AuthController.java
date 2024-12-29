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
    public ResponseEntity<?> validateToken(@RequestHeader("Authorization") String authorization) {
        if (authorization == null || !authorization.startsWith("Bearer ")) {
            return new ResponseEntity<>("Invalid or missing Authorization header", HttpStatus.BAD_REQUEST);
        }

        String token = authorization.split(" ")[1]; // "Bearer " 이후의 토큰을 추출

        if (jwtUtil.isExpired(token)) {
            return new ResponseEntity<>("Token expired", HttpStatus.UNAUTHORIZED);
        }

        return new ResponseEntity<>("{\"status\": \"valid\"}", HttpStatus.OK);
    }

}
