package com.ttrip.member.service;

import com.ttrip.auth.domain.User;
import com.ttrip.auth.repository.UserRepository;
import com.ttrip.member.dto.FindPasswordRequest;
import com.ttrip.member.dto.FindPasswordResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PasswordFindService {

    @Autowired
    private UserRepository userRepository;

    public FindPasswordResponse verifyUserInfo(FindPasswordRequest request){
        FindPasswordResponse response = new FindPasswordResponse();

        try {
            Optional<User> memberOpt = userRepository.findByEmailAndBirthAndPhone(
                    request.getEmail(),
                    request.getBirth(),
                    request.getPhone()
            );

            if (memberOpt.isPresent()) {
                response.setStatus("success");
                response.setMessage("회원정보가 확인되었습니다.");
            } else {
                response.setStatus("error");
                response.setMessage("입력하신 정보와 일치하는 회원이 없습니다.");
            }
        } catch (Exception e) {
            response.setStatus("error");
            response.setMessage("회원정보 확인 중 오류가 발생했습니다.");
        }

        return response;
    }
}
