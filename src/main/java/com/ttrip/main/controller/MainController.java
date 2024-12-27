package com.ttrip.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/main_monthbest")
    public String main_monthbest() {

        return "ttrip/main/main_monthbest";
    }//
	
	@GetMapping("/main_mytripcourse")
	public String main_mytripcourse() {
		
		return "ttrip/main/main_mytripcourse";
	}//
	
	@GetMapping("/main_tripboard")
	public String main_tripboard() {
		
		return "ttrip/main/main_tripboard";
	}//
}
