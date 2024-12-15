package com.ttrip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String showLoginPage() {
        return "ttrip/member/login";
    }

    @PostMapping("/join")
    public String showJoinPage() {
        return "ttrip/member/signup";
    }

    @PostMapping("/join/outh2")
    public String showOuth2Page() {
        return "ttrip/member/signup2";
    }
}


