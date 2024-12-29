package com.ttrip.tripboard.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ttrip.accom.AccomDomain;
import com.ttrip.tripboard.TripBoardService;
import com.ttrip.tripplan.TripPlanService;
import com.ttrip.dstnt.domain.DstntDomain;
import com.ttrip.tripboard.TripBoardDomain;
import com.ttrip.tripboard.TripBoardService;
import com.ttrip.tripboard.TripBoardVO;

@Controller
public class TripBoardController {

	@Autowired
    private TripBoardService tripBoardService;
	
	@Autowired
    private TripPlanService tripPlanService;
	
	@GetMapping("/tr3")
    public ModelAndView loadTravelPlan3(@RequestParam(value = "region", required = false) String region) {
		List<DstntDomain> destinations = tripBoardService.getDestinationsByRegion(region);
        List<AccomDomain> accommodations = tripBoardService.getAccommodationsByRegion(region);
        
        // 디버깅 로그 추가
//        System.out.println("Destinations: " + destinations);
//        System.out.println("Accommodations: " + accommodations);
//        System.out.println("Region parameter: " + region);
        
        ModelAndView mav = new ModelAndView("ttrip/travel/travel-plan3");
        mav.addObject("destinations", destinations);
        mav.addObject("accommodations", accommodations);
        return mav;
    }
	
}//class