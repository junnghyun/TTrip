package com.ttrip.auth.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Date;

@Entity
@Getter
@Setter
@ToString
@Table(name = "member")
public class User {

    @Id
    @Column(name = "nick", nullable = false, unique = true)
    private String nick; // 닉네임

    @Column(name = "email", nullable = false, unique = true)
    private String email; // 이메일

    @Column(name = "name")
    private String name;

    @Column(name = "pass") // 암호화된 비밀번호를 저장하기 위해 길이를 200으로 설정
    private String password;

    @Column(name = "birth")
    private String birth;

    @Column(name = "phone")
    private String phone;

    @Column(name = "gender")
    private char gender;

    @Column(name = "join_date")
    private Date joinDate;

    @Column(name = "account_flag")
    private String accountFlag;

    @Column(name = "oauth_provider")
    private String oauthProvider;

    @Column(name = "oauth_user_id")
    private String oauthUserId;

    @Column(name = "role")
    private String role;

    @PrePersist
    public void prePersist() {
        if (this.joinDate == null) {
            this.joinDate = new Date(System.currentTimeMillis()); // 현재 시간을 기반으로 SQL DATE 생성
        }
        if (this.accountFlag == null) {
            this.accountFlag = "Y"; // 기본값 'Y' 설정
        }
    }
}
