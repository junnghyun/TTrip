package com.ttrip.tripboard.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ttrip.accom.AccomDomain;
import com.ttrip.dstmt.DstntDomain;
import com.ttrip.tripboard.TripBoardDomain;
import com.ttrip.tripboard.TripBoardService;
import com.ttrip.tripboard.TripBoardVO;

@Controller
public class TripBoardController {

	@Autowired
    private TripBoardService tripBoardService;
	
	@GetMapping("/travelPlan3")
    public ModelAndView loadTravelPlan3(@RequestParam("regionId") int regionId) {
		List<DstntDomain> destinations = tripBoardService.getDestinationsByRegion(regionId);
        List<AccomDomain> accommodations = tripBoardService.getAccommodationsByRegion(regionId);
        
//        // 디버깅 로그 추가
//        System.out.println("Destinations: " + destinations);
//        System.out.println("Accommodations: " + accommodations);
        
        ModelAndView mav = new ModelAndView("travel-plan3");
        mav.addObject("destinations", destinations);
        mav.addObject("accommodations", accommodations);
        return mav;
    }

	@GetMapping("/get_trip_board_list")
	public String getTripBoardList(String str,Model model) {
		return str;
	}
	
	@GetMapping("/tripBoard/get_trip_board_list_frm")
	public String getTripBoardDetailFrm(int tripBoardId, Model model) {
		return null;
	}

	@GetMapping("/tripBoard/trip_board_insert_frm")
	public String tripBoardInsertFrm() {
		return null;
	}

	@GetMapping("/tripBoard/trip_board_insert")
	public String tripBoardInsert(TripBoardVO tbVO, Model model) {
		return null;
	}

	@GetMapping("/tripBoard/trip_board_delete")
	public String tripBoardDelete(int tripBoardId) {
		return null;
	}

//	@GetMapping("/tripBoard/trip_board_report")
//	public String tripBoardReport(ReportVO rVO) {
//		
//	}

	@GetMapping("/tripBoard/trip_board_recommend_insert")
	public String tripBoardRecommendInsert(int tripBoardId, String recommendId) {
		return recommendId;
	}

	@GetMapping("/tripBoard/trip_board_recommend_delete")
	public String tripBoardRecommendDelete(int tripBoardId, String recommendId) {
		return recommendId;
	}

	@GetMapping("/tripBoard/trip_board_selectLoc")
	public String selectLoc(int regionId) {
		return null;
	}

	@ResponseBody
	public String searchDstnt(int dstntId) {
		return null;
	}

	@ResponseBody
	public String searchAccom(int AccomId) {
		return null;
	}

//	@GetMapping("/tripBoard/insertDstnt")
//	public String insertDstnt(dstntId[] dstntArr) {
//		
//	}
//
//	@GetMapping("/tripBoard/trip_board_insertAccom")
//	public String insertAccom(accomId[] accomArr) {
//		
//	}
	
}//class