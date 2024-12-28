package com.ttrip.dstnt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DstntController {

	@GetMapping("/dstnt_detail")
    public String dstnt_detail() {

        return "ttrip/dstnt/dstnt_detail";
    }//
	
	@GetMapping("/dstnt_list")
	public String dstnt_list() {
		
		return "ttrip/dstnt/dstnt_list";
	}//
}
