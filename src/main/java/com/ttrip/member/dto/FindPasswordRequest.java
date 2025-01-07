package com.ttrip.member.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FindPasswordRequest {
    private String email;
    private String birth;
    private String phone;
}
