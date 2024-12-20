package com.ttrip.auth.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SignupUserDto {
    private String name;
    private String nick;
    private String email;
    private char gender;
    private String birth;
    private String phone;
    private String password;
}
