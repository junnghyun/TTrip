package com.ttrip.auth.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AuthFrmController {

    @GetMapping("/login")
    public String showLoginPage() {
        return "ttrip/member/login";
    }

    @GetMapping("/signup")
    public String showSignupPage() {
        return "ttrip/member/signup";
    }

    @PostMapping("/signup/user")
    public String showJoinPage(@RequestParam("email") String email,@RequestParam("password") String password, Model model) {
        model.addAttribute("email", email);
        model.addAttribute("password", password);
        return "ttrip/member/signupUser";
    }

    @PostMapping("/signup/outh2")
    public String showOuth2Page() {
        return "ttrip/member/signupOuth2";
    }

}
