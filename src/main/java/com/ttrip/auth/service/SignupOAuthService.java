package com.ttrip.auth.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.dto.SignupOAuthDto;
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
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Transactional
    public void registerOAuthUser(SignupOAuthDto signupOAuthDto) {
        if (userRepository.existsByEmail(signupOAuthDto.getEmail())) {
            throw new IllegalArgumentException("이미 존재하는 이메일입니다.");
        }
        if (userRepository.existsByNick(signupOAuthDto.getNick())) {
            throw new IllegalArgumentException("이미 존재하는 닉네임입니다.");
        }

        User user = new User();
        user.setEmail(signupOAuthDto.getEmail());
        user.setNick(signupOAuthDto.getNick());
        user.setName(signupOAuthDto.getName());
        user.setGender(signupOAuthDto.getGender());
        user.setPhone(bCryptPasswordEncoder.encode(signupOAuthDto.getPhone()));
        user.setBirth(signupOAuthDto.getBirth());
        user.setOauthProvider(signupOAuthDto.getOauthProvider());
        user.setOauthUserId(signupOAuthDto.getOauthUserId());
        user.setRole("USER");
        user.setPassword(bCryptPasswordEncoder.encode(signupOAuthDto.getPassword()));

        userRepository.save(user);
    }
}
