package com.ttrip.auth.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.util.Date;

@Component
public class JwtUtil {

    private final SecretKey secretKey;

    // 생성자에서 비밀 키 초기화
    public JwtUtil(@Value("${spring.jwt.secret}") String secret) {
        secretKey = new SecretKeySpec(secret.getBytes(StandardCharsets.UTF_8), SignatureAlgorithm.HS256.getJcaName());
    }

    // 토큰에서 이메일 추출
    public String getEmail(String token) {
        Claims claims = extractAllClaims(token);
        return claims.get("email", String.class);  // 토큰의 "email" 클레임에서 값 추출
    }

    // 토큰에서 역할(role) 추출
    public String getRole(String token) {
        Claims claims = extractAllClaims(token);
        return claims.get("role", String.class);  // 토큰의 "role" 클레임에서 값 추출
    }

    // 토큰이 만료되었는지 확인
    public Boolean isExpired(String token) {
        Claims claims = extractAllClaims(token);
        return claims.getExpiration().before(new Date());  // 만료 시간 확인
    }

    // JWT 토큰 생성
    public String createJwt(String email, String role, Long expiredMs) {
        return Jwts.builder()
                .claim("email", email)  // 이메일 클레임 추가
                .claim("role", role)    // 역할 클레임 추가
                .setIssuedAt(new Date(System.currentTimeMillis()))  // 발행 시간 설정
                .setExpiration(new Date(System.currentTimeMillis() + expiredMs))  // 만료 시간 설정
                //.signWith(secretKey)    // 비밀 키로 서명
                .compact();              // 토큰 생성
    }

    // 내부적으로 토큰을 파싱하여 클레임을 추출하는 메서드
    private Claims extractAllClaims(String token) {
        return Jwts.parser()
                .setSigningKey(secretKey)  // 비밀 키 설정
                .parseClaimsJws(token)  // 토큰 파싱
                .getBody();  // 클레임 추출
    }
}
