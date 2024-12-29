package com.ttrip.auth.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginResponse {
    private String status;
    private String message;
    private String token;

    public LoginResponse(String status, String message, String token) {
        this.status = status;
        this.message = message;
        this.token = token;
    }
}
