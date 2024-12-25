package com.ttrip.admin.member;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class MemberVO {
    private String nick;           
    private String name;           
    private String pass;          
    private String birth;          
    private String phone;          
    private String gender;         
    private String email;          
    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date join_date;        
    private String account_flag;   
    private String oauth_provider; 
    private String oauth_user_id;  
    private String authority;
}