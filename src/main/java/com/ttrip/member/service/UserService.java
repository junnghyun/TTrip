package com.ttrip.member.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.repository.UserRepository;
import com.ttrip.member.dto.MemberInfoResponse;
import com.ttrip.member.dto.MemberUpdateRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
    }

    public MemberInfoResponse getMemberInfo(String nick) {
        User user = userRepository.findByNick(nick);
        if (user == null) {
            throw new RuntimeException("User not found");
        }

        return MemberInfoResponse.builder()
                .name(user.getName())
                .nick(user.getNick())
                .birth(user.getBirth())
                .gender(user.getGender())
                .phone(user.getPhone())
                .email(user.getEmail())
                .oauthProvider(user.getOauthProvider())
                .build();
    }

    @Transactional
    public void updateMemberInfo(String currentNick, MemberUpdateRequest updateRequest) {
        User user = userRepository.findById(currentNick)
                .orElseThrow(() -> new RuntimeException("User not found"));

        // 비밀번호 검증
        if (!passwordEncoder.matches(updateRequest.getCurrentPassword(), user.getPassword())) {
            throw new RuntimeException("현재 비밀번호가 일치하지 않습니다.");
        }

        // 닉네임 변경 시 중복 체크
        if (!currentNick.equals(updateRequest.getNick()) && !isNicknameAvailable(updateRequest.getNick())) {
            throw new RuntimeException("이미 사용중인 닉네임입니다.");
        }

        // 정보 업데이트
        user.setNick(updateRequest.getNick());
        user.setPhone(updateRequest.getPhone());
        user.setGender(updateRequest.getGender());

        // 새 비밀번호가 있는 경우 업데이트
        if (updateRequest.getNewPassword() != null && !updateRequest.getNewPassword().isEmpty()) {
            user.setPassword(passwordEncoder.encode(updateRequest.getNewPassword()));
        }

        userRepository.save(user);
    }

    public boolean isNicknameAvailable(String nickname) {
        return !userRepository.existsByNick(nickname);
    }

//    private String maskName(String name) {
//        if (name == null || name.length() < 2) return name;
//        return name.charAt(0) + "*".repeat(name.length() - 1);
//    }
//
//    private String maskBirth(String birth) {
//        if (birth == null) return null;
//        return "****년 **월 **일";
//    }
}
