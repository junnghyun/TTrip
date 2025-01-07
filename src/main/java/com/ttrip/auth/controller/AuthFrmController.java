package com.ttrip.auth.controller;

import jakarta.servlet.http.HttpServletRequest;
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

    @GetMapping("/signup/oauth2")
    public String showOauth2Page(
            @RequestParam(required = false) String email,
            @RequestParam(required = false) String provider,
            @RequestParam(required = false) String providerId,
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String error,
            Model model) {

        model.addAttribute("email", email);
        model.addAttribute("provider", provider);
        model.addAttribute("providerId", providerId);
        model.addAttribute("name", name);
        model.addAttribute("error", error);

        return "ttrip/member/signupOauth2";
    }

    @GetMapping("/admin/login")
    public String showAdminPage() { return "admin/login/admin_login"; }

}
