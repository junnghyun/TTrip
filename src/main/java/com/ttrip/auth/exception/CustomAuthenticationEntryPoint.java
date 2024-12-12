package com.ttrip.auth.exception;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {

    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException) throws IOException {
        // 권한이 없을 때 alert 메시지를 보내고 로그인 페이지로 리디렉션
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<script>alert('로그인 후 이용해주세요'); location.href='/login';</script>");
        response.getWriter().flush();
    }
}
