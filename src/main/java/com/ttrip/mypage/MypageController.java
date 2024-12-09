package com.ttrip.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {
	
	@GetMapping("/mypage_myboard")
    public String mypage_myboard() {

        return "ttrip/mypage/mypage_myboard";
    }//
	
	@GetMapping("/mypage_course")
	public String mypage_course() {
		
		return "ttrip/mypage/mypage_course";
	}//
	
	@GetMapping("/mypage_comment")
	public String mypage_comment() {
		
		return "ttrip/mypage/mypage_comment";
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
