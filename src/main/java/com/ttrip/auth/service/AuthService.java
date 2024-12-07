package com.ttrip.auth.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Optional;

@Service
public class AuthService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    // 일반 회원가입
    public User registerUser(User user) {
        if (userRepository.findByEmail(user.getEmail()).isPresent()) {
            throw new IllegalStateException("이미 존재하는 이메일입니다.");
        }
        user.setPassword(passwordEncoder.encode(user.getPassword())); // 비밀번호 암호화
        user.setJoinDate(LocalDate.now());
        user.setWithdrawnFlag("N"); // 활성화된 계정
        return userRepository.save(user);
    }

    // 일반 로그인
    public User loginUser(String email, String password) {
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new IllegalStateException("잘못된 이메일 또는 비밀번호입니다."));

        if (!passwordEncoder.matches(password, user.getPassword())) {
            throw new IllegalStateException("잘못된 이메일 또는 비밀번호입니다.");
        }

        return user; // 성공적으로 로그인 시 사용자 정보 반환
    }

    // OAuth2 회원 가입 또는 로그인
    public User registerOrLoginOAuth2User(String oauthProvider, String oauthUserId, String email, String name) {
        Optional<User> existingUser = userRepository.findByOauthUserIdAndOauthProvider(oauthUserId, oauthProvider);

        if (existingUser.isPresent()) {
            return existingUser.get(); // 기존 사용자는 로그인 처리
        }

        // 새로운 사용자 생성 및 저장
        User newUser = new User();
        newUser.setOauthProvider(oauthProvider);
        newUser.setOauthUserId(oauthUserId);
        newUser.setEmail(email);
        newUser.setName(name);
        newUser.setJoinDate(LocalDate.now());
        newUser.setWithdrawnFlag("N");

        return userRepository.save(newUser);
    }
}
