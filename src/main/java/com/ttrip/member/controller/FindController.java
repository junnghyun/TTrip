package com.ttrip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class FindController {

	@GetMapping("/find_pw")
	public String find_pw() {
		
		return "ttrip/member/find_pw";
	}
	
	@GetMapping("/find_pw2")
	public String find_pw2() {
		
		return "ttrip/member/find_pw2";
	}

	@GetMapping("/find_pw3")
	public String find_pw3() {
		
		return "ttrip/member/find_pw3";
	}
	
}
