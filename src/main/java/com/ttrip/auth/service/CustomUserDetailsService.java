package com.ttrip.auth.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.dto.CustomUserDetails;
import com.ttrip.auth.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final UserRepository userRepository;

    public CustomUserDetailsService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        // DB에서 이메일로 사용자 정보 조회
        User userData = userRepository.findByEmail(email);

        if (userData != null) {
            // UserDetails로 변환하여 반환
            return new CustomUserDetails(userData);
        }

        throw new UsernameNotFoundException("User not found with email: " + email);
    }
}

