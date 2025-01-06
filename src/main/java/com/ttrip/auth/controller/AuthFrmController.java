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

    @GetMapping("/signup/outh2")
    public String showOuth2Page(HttpServletRequest request, Model model) {
        // 이메일과 로그인 출처 파라미터 가져오기
        String email = request.getParameter("email");
        String registrationId = request.getParameter("registrationId");

        // 모델에 이메일과 로그인 출처 정보를 추가하여 뷰로 전달
        model.addAttribute("email", email);
        model.addAttribute("registrationId", registrationId);

        return "ttrip/member/signupOauth2";
    }

    @GetMapping("/admin/login")
    public String showAdminPage() { return "admin/login/admin_login"; }

}
