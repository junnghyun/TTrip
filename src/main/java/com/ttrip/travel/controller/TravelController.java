package com.ttrip.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelController {

	@RequestMapping("/tr2")
	public String tr2() {
		
		return "ttrip/travel/travel-plan2";
	}
	
	@RequestMapping("/tr3")
	public String tr3() {
		
		return "ttrip/travel/travel-plan3";
	}
}
