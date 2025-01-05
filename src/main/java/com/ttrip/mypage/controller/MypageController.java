package com.ttrip.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ttrip.auth.jwt.JwtUtil;
import com.ttrip.mypage.MypageService;


@Controller
@RequestMapping("/user")
public class MypageController {
    
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private JwtUtil jwtUtil;
	
	@GetMapping("/mypage_myboard")
	public String mypage_myboard() {
	    return "ttrip/mypage/mypage_myboard";
	}
	
	@GetMapping("/mypage_comment")
    public String mypage_comment() {
        return "ttrip/mypage/mypage_comment";
    }
	@GetMapping("/mypage_course")
	public String mypage_course() {
	     return "ttrip/mypage/mypage_course";
	 }
	    
    @GetMapping("/mypage_recommend")
    public String mypage_recommend() {
        return "ttrip/mypage/mypage_recommend";
    }
    
    @GetMapping("/mypage_report")
    public String mypage_report() {
        return "ttrip/mypage/mypage_report";
    }
	
	
	@GetMapping("/edit_member")
	public String edit_member() {
		return "ttrip/mypage/edit_member";
	}

	@GetMapping("/delete_member")
	public String delete_member() {
		return "ttrip/mypage/delete_member";
	}
}
