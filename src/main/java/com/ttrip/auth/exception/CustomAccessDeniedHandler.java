package com.ttrip.auth.exception;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException {
        // 권한이 없을 때 (접근 불가) alert 메시지를 보내고 로그인 페이지로 리디렉션
        response.setContentType("text/html; charset=UTF-8");
        response.getWriter().println("<script>alert('권한이 없습니다. 로그인 후 이용해주세요'); location.href='/login';</script>");
        response.getWriter().flush();
    }
}
