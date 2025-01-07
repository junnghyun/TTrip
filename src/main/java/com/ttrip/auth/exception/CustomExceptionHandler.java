package com.ttrip.auth.exception;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class CustomExceptionHandler {

//    @ExceptionHandler(CustomOAuth2AuthenticationException.class)
//    public String handleOAuth2AuthenticationException(CustomOAuth2AuthenticationException ex,
//                                                      HttpServletRequest request,
//                                                      RedirectAttributes redirectAttributes) {
//
//        redirectAttributes.addAttribute("email", ex.getEmail());
//        redirectAttributes.addAttribute("provider", ex.getRegistrationId());
//        redirectAttributes.addAttribute("providerId", ex.getProviderId());
//        redirectAttributes.addAttribute("name", ex.getName());
//
//        return "redirect:/signup/oauth2";
//    }
    @ExceptionHandler(CustomOAuth2AuthenticationException.class)
    public String handleCustomOAuth2AuthenticationException(CustomOAuth2AuthenticationException ex, Model model) {
        model.addAttribute("email", ex.getEmail());
        model.addAttribute("provider", ex.getRegistrationId());
        model.addAttribute("providerId", ex.getProviderId());
        model.addAttribute("name", ex.getName());
        model.addAttribute("error", ex.getMessage());
        return "redirect:/signup/oauth2";  // 회원가입 페이지로 리다이렉트
    }
}
