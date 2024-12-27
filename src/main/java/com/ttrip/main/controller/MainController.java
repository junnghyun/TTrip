package com.ttrip.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

	@GetMapping("/")
    public String index() {

        return "/index";
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
