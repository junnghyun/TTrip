package com.ttrip.auth.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.dto.SignupDto;
import com.ttrip.auth.dto.SignupOAuthDto;
import com.ttrip.auth.dto.SignupUserDto;
import com.ttrip.auth.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class SignupOAuthService {

    private final UserRepository userRepository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public SignupOAuthService(UserRepository userRepository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.userRepository = userRepository;
        this.bCryptPasswordEncoder = new BCryptPasswordEncoder();
    }

    public String signupProcess(SignupDto signupDto) {
        try {
            // 이메일 중복 체크
            if (userRepository.existsByEmail(signupDto.getEmail())) {
                return "Email already exists";
            }

            return "Email available";

        } catch (Exception e) {
            // 로그 기록 추가하면 좋을 것 같습니다
            throw new RuntimeException("회원가입 처리 중 오류가 발생했습니다", e);
        }
    }

    public boolean checkNick(String nick) {
        return userRepository.existsByNick(nick);
    }

    @Transactional
    public void registerUser(SignupOAuthDto signupOAuthDto) {
        if (userRepository.existsByEmail(signupOAuthDto.getEmail())) {
            throw new IllegalArgumentException("이미 존재하는 이메일입니다.");
        }
        if (userRepository.existsByNick(signupOAuthDto.getNick())) {
            throw new IllegalArgumentException("이미 존재하는 닉네임입니다.");
        }

        // 유저 엔티티 생성 및 저장 로직
        User user = new User();
        user.setEmail(signupOAuthDto.getEmail());
        user.setNick(signupOAuthDto.getNick());
        user.setName(signupOAuthDto.getName());
        user.setGender(signupOAuthDto.getGender());
        user.setPhone(bCryptPasswordEncoder.encode(signupOAuthDto.getPhone()));
        user.setBirth(signupOAuthDto.getBirth());
        user.setOauthProvider(signupOAuthDto.getOauthProvider());
        user.setRole("USER");
        // 비밀번호 암호화 등 추가 로직
        user.setPassword(bCryptPasswordEncoder.encode(signupOAuthDto.getPassword()));

        userRepository.save(user);
    }
}
