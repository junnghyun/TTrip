package com.ttrip.member.controller;

import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.member.dto.DeleteUserRequest;
import com.ttrip.member.dto.MemberInfoResponse;
import com.ttrip.member.dto.MemberUpdateRequest;
import com.ttrip.member.service.UserService;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/user/api")
public class UserController {

    private final UserService memberService;
    private final JwtUtil jwtUtil;

    public UserController(UserService memberService, JwtUtil jwtUtil) {
        this.memberService = memberService;
        this.jwtUtil = jwtUtil;
    }

    @GetMapping("/edit_member")
    public MemberInfoResponse editMember(@RequestHeader("Authorization") String authorization) {
        try {
            if (authorization != null && authorization.startsWith("Bearer ")) {
                String token = authorization.split(" ")[1];
                String nick = jwtUtil.getNick(token);
                return memberService.getMemberInfo(nick);  // 반환은 MemberInfoResponse 객체
            } else {
                throw new IllegalArgumentException("Authorization header is missing or invalid");
            }
        } catch (Exception e) {
            throw new RuntimeException("회원 정보를 불러오는데 실패했습니다.", e);
        }
    }

    @GetMapping("/check_nickname")
    public boolean checkNickname(@RequestParam("nick") String nick) {
        try {
            return memberService.isNicknameAvailable(nick);  // true면 사용 가능한 닉네임
        } catch (Exception e) {
            throw new RuntimeException("닉네임 중복 확인에 실패했습니다.", e);
        }
    }

    @PutMapping("/update")
    public ResponseEntity<?> updateMember(
            @RequestHeader("Authorization") String authorization,
            @RequestBody MemberUpdateRequest updateRequest
    ) {
        try {
            if (authorization != null && authorization.startsWith("Bearer ")) {
                String token = authorization.split(" ")[1];
                String currentNick = jwtUtil.getNick(token);

                // 로그를 추가하여 디버깅
                System.out.println("Current Nick: " + currentNick);
                System.out.println("Update Request: " + updateRequest.toString());

                memberService.updateMemberInfo(currentNick, updateRequest);
                return ResponseEntity.ok().body("회원 정보가 성공적으로 수정되었습니다.");
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("유효하지 않은 인증 토큰입니다.");
            }
        } catch (IllegalArgumentException e) {
            // 잘못된 입력값에 대한 예외
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (RuntimeException e) {
            // 비즈니스 로직 예외
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            // 예상치 못한 서버 에러
            e.printStackTrace(); // 로그 추가
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("회원 정보 수정에 실패했습니다.");
        }
    }

    @PostMapping("/delete")
    public ResponseEntity<?> deleteUser(@RequestHeader("Authorization") String token, @RequestBody Map<String, String> request) {
        // JWT에서 이메일 추출
        String jwtToken = token.replace("Bearer ", "");
        if (jwtUtil.isExpired(jwtToken)) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Map.of("success", false, "message", "토큰이 만료되었습니다."));
        }

        String email = jwtUtil.getEmail(jwtToken);

        // 요청에서 비밀번호 가져오기
        String password = request.get("password");
        if (password == null || password.isEmpty()) {
            return ResponseEntity.badRequest().body(Map.of("success", false, "message", "비밀번호가 필요합니다."));
        }

        // 회원 탈퇴 처리
        try {
            memberService.deleteUser(email, password);
            return ResponseEntity.ok(Map.of("success", true, "message", "회원 탈퇴가 완료되었습니다."));
        } catch (RuntimeException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(Map.of("success", false, "message", e.getMessage()));
        }
    }

}
