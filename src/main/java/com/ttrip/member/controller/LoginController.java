package com.ttrip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

    @RequestMapping("/login")
    public String showLoginPage() {
        return "ttrip/member/login";  // ttrip/member/login.jsp를 반환
    }
}


