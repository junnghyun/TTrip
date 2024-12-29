package com.ttrip.auth.controller;

import com.ttrip.auth.dto.SignupDto;
import com.ttrip.auth.dto.SignupOAuthDto;
import com.ttrip.auth.dto.SignupUserDto;
import com.ttrip.auth.service.SignupOAuthService;
import com.ttrip.auth.service.SignupService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class SignupController {

    private final SignupService signupService;
    private final SignupOAuthService signupOAuthService;

    public SignupController(SignupService signupService, SignupOAuthService signupOAuthService) {
        this.signupService = signupService;
        this.signupOAuthService = signupOAuthService;
    }

    @PostMapping("/signup")
    public ResponseEntity<Map<String, String>> signup(@RequestBody SignupDto signupDto) {
        Map<String, String> response = new HashMap<>();

        try {
            String result = signupService.signupProcess(signupDto);
            if (result.equals("Email already exists")) {
                response.put("status", "error");
                response.put("message", "Email already exists");
                return ResponseEntity.status(400).body(response);
            } else {
                response.put("status", "success");
                response.put("message", "Email available");
                return ResponseEntity.ok(response);
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "회원가입 처리 중 오류가 발생했습니다");
            return ResponseEntity.status(500).body(response);
        }
    }

    @PostMapping("/checkNick")
    public Map<String, Boolean> checkNick(String nick) {
        Map<String, Boolean> response = new HashMap<>();
        boolean isAvailable = !signupService.checkNick(nick);
        response.put("isAvailable", isAvailable);
        return response;
    }

    @PostMapping("/signup/user")
    public ResponseEntity<?> signupUser(@RequestBody SignupUserDto signupUserDto) {
        try {
            // 회원가입 로직 처리
            signupService.registerUser(signupUserDto);

            // 성공 응답
            Map<String, Boolean> response = new HashMap<>();
            response.put("success", true);
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            // 오류 발생 시 응답 처리
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "message", e.getMessage()));
        }
    }

    @PostMapping("/signup/oauth")
    public ResponseEntity<?> signupOauth(@RequestBody SignupOAuthDto signupOAuthDto) {
        try {
            // 회원가입 로직 처리
            signupOAuthService.registerUser(signupOAuthDto);

            // 성공 응답
            Map<String, Boolean> response = new HashMap<>();
            response.put("success", true);
            return ResponseEntity.ok(response);

        } catch (Exception e) {
            // 오류 발생 시 응답 처리
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "message", e.getMessage()));
        }
    }

}