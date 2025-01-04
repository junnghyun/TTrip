package com.ttrip.member.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberUpdateRequest {
    private String nick;
    private String phone;
    private char gender;
    private String currentPassword;
    private String newPassword;
}
