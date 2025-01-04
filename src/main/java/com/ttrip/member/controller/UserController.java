package com.ttrip.member.controller;

import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.member.dto.MemberInfoResponse;
import com.ttrip.member.service.UserService;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
}
