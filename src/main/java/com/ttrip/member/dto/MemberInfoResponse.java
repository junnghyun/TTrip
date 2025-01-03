package com.ttrip.member.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MemberInfoResponse {
    private String name;
    private String nick;
    private String birth;
    private char gender;
    private String phone;
    private String email;
    private String oauthProvider;
}
