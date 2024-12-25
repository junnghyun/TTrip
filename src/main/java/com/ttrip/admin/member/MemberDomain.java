package com.ttrip.admin.member;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberDomain {
    private String nick;           // 닉네임
    private String name;           // 이름
    private String birth;          // 생년월일
    private String phone;          // 전화번호
    private String gender;         // 성별
    private String email;          // 이메일
    private Date join_date;        // 가입일
    private String account_flag;   // 계정상태
    private String oauth_provider; // OAuth 제공자
    private String oauth_user_id;  // OAuth 사용자 ID
    private String authority;      // 권한
}