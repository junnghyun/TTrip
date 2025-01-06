package com.ttrip.member.controller;

import com.ttrip.member.dto.FindPasswordRequest;
import com.ttrip.member.dto.FindPasswordResponse;
import com.ttrip.member.service.PasswordFindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/member")
public class PasswordFindController {

    @Autowired
    private PasswordFindService passwordFindService;

    @PostMapping("/findPassword")
    public ResponseEntity<FindPasswordResponse> findPassword(@RequestBody FindPasswordRequest request) {
        FindPasswordResponse response = passwordFindService.verifyUserInfo(request);
        return ResponseEntity.ok(response);
    }
}
