package com.ttrip.member.controller;

import com.ttrip.member.dto.PasswordChangeRequest;
import com.ttrip.member.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class FindController {

    private final UserService userService;
    public FindController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/find_pw")
    public String find_pw() {

        return "ttrip/member/find_pw";
    }

    @PostMapping("/find_pw2")
    public String showPasswordResetForm(@RequestParam("email") String email, Model model) {
        model.addAttribute("email", email);
        return "ttrip/member/find_pw2";
    }

    @PostMapping("/change-password")
    public String changePassword(PasswordChangeRequest request, RedirectAttributes redirectAttributes) {
        try {
            if (userService.changePassword(request)) {
                redirectAttributes.addFlashAttribute("message", "비밀번호가 성공적으로 변경되었습니다.");
                return "redirect:/find_pw3";
            } else {
                redirectAttributes.addFlashAttribute("error", "비밀번호 변경에 실패했습니다.");
                return "redirect:/find_pw2?email=" + request.getEmail();
            }
        } catch (IllegalArgumentException e) {
            redirectAttributes.addFlashAttribute("error", e.getMessage());
            return "redirect:/find_pw2?email=" + request.getEmail();
        }
    }

    @GetMapping("/find_pw3")
    public String find_pw3() {

        return "ttrip/member/find_pw3";
    }

}
