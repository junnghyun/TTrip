package com.ttrip.auth.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.time.LocalDate;

@Entity
@Getter
@Setter
@ToString
@Table(name = "user")
public class User {

    @Id
    @Column(name = "user_id", length = 30, nullable = false)
    private String userId; // 닉네임

    @Column(name = "name", length = 30)
    private String name;

    @Column(name = "pass", length = 60) // 암호화된 비밀번호를 저장하기 위해 길이를 60으로 설정
    private String password;

    @Column(name = "birth", length = 8)
    private String birth;

    @Column(name = "phone", length = 11)
    private String phone;

    @Column(name = "gender", length = 1)
    private String gender;

    @Column(name = "email", length = 60)
    private String email;

    @Column(name = "join_date")
    private LocalDate joinDate;

    @Column(name = "withdrawn_flag", length = 1)
    private String withdrawnFlag;

    @Column(name = "o_auth_provider", length = 20)
    private String oauthProvider;

    @Column(name = "o_auth_user_id", length = 225)
    private String oauthUserId;

}
