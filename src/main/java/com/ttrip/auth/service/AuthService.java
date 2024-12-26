package com.ttrip.auth.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.dto.LoginRequest;
import com.ttrip.auth.dto.CustomUserDetails;
import com.ttrip.auth.jwt.JwtUtil;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Service;

import java.util.Iterator;

@Service
public class AuthService {

    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public AuthService(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }

    public String authenticateUser(LoginRequest loginRequest) throws Exception {
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(
                        loginRequest.getEmail(),
                        loginRequest.getPassword()
                )
        );

        Iterator<? extends GrantedAuthority> iterator = authentication.getAuthorities().iterator();
        String role = iterator.next().getAuthority();

        // CustomUserDetails에서 nick 정보 가져오기
        CustomUserDetails userDetails = (CustomUserDetails) authentication.getPrincipal();
        String nick = userDetails.getUser().getNick();

        // 디버깅을 위한 로그 추가
        System.out.println("Role during token creation: " + role);
        System.out.println("Nick during token creation: " + nick);

        return jwtUtil.createJwt(authentication.getName(), role, nick, 6 * 60 * 60 * 1000L);
    }
}