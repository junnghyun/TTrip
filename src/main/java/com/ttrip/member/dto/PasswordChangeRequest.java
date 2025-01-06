package com.ttrip.member.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PasswordChangeRequest {
    private String email;
    private String newPassword;
    private String confirmPassword;
}
