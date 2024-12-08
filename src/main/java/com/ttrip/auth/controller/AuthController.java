package com.ttrip.auth.controller;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.service.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    // 일반 회원가입
    @PostMapping("/register")
    public ResponseEntity<String> register(@RequestBody User user) {
        try {
            authService.registerUser(user);
            return ResponseEntity.ok("회원가입 성공");
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    // 일반 로그인
    @PostMapping("/login")
    public ResponseEntity<User> login(@RequestParam String email, @RequestParam String password) {
        try {
            User user = authService.loginUser(email, password);
            return ResponseEntity.ok(user);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }

    // OAuth2 로그인/회원가입 (카카오, 네이버 등)
    @PostMapping("/oauth2/login")
    public ResponseEntity<User> oauthLogin(
            @RequestParam String oauthProvider,
            @RequestParam String oauthUserId,
            @RequestParam String email,
            @RequestParam String name) {
        try {
            User user = authService.registerOrLoginOAuth2User(oauthProvider, oauthUserId, email, name);
            return ResponseEntity.ok(user);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(null);
        }
    }
}

